import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cft/performance/edge.dart';
import 'package:cft/performance/graph.dart';
import 'package:cft/performance/node.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class PerformancePage extends ConsumerStatefulWidget {
  const PerformancePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PerformancePageState();
}

class _PerformancePageState extends ConsumerState<PerformancePage> {
  static const canvasSize = Size(400, 400);
  final graph = Graph(
    nodes: [
      Node(
        id: 'S',
        offset: const Offset(100, 0),
      ),
      Node(
        id: 'A',
        offset: const Offset(25, 160),
      ),
      Node(
        id: 'B',
        offset: const Offset(240, 160),
      ),
      Node(
        id: 'G',
        offset: const Offset(240, 300),
      ),
    ],
    edges: [
      Edge(
        sourceId: 'S',
        destinationId: 'A',
        fee: 50,
        time: 10,
      ),
      Edge(
        sourceId: 'S',
        destinationId: 'B',
        fee: 150,
        time: 20,
      ),
      Edge(
        sourceId: 'A',
        destinationId: 'B',
        fee: 10,
        time: 15,
      ),
      Edge(
        sourceId: 'A',
        destinationId: 'G',
        fee: 200,
        time: 20,
      ),
      Edge(
        sourceId: 'B',
        destinationId: 'G',
        fee: 75,
        time: 10,
      ),
    ],
  );

  late final selectedNodeIds = [
    graph.nodes.first.id,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text('ホームに戻りますか？'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.replace(const HomeRoute());
                      },
                      child: const Text('戻る'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  'それぞれの経路に、かかる時間と料金を表示しています。Sを出発点として、30分以内にGに到着したいとき、もっとも料金が低くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。'),
              const Gap(16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: canvasSize.width,
                      height: canvasSize.height,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CustomPaint(
                            size: Size(canvasSize.width, canvasSize.height),
                            painter: EdgeRender(graph, selectedNodeIds),
                          ),
                          ...graph.nodes.map((node) {
                            return Positioned(
                              left: node.offset.dx,
                              top: node.offset.dy,
                              child: GestureDetector(
                                onTap: () {
                                  /// 選択したNodeの最後が入ってくるものであれば追加する
                                  if (graph
                                      .inNodes(node)
                                      .map((e) => e.id)
                                      .contains(selectedNodeIds.last)) {
                                    setState(() {
                                      selectedNodeIds.add(node.id);
                                    });

                                    return;
                                  }

                                  if (selectedNodeIds.length == 1) {
                                    return;
                                  }

                                  if (selectedNodeIds.last == node.id) {
                                    setState(() {
                                      selectedNodeIds.removeLast();
                                    });
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  color: selectedNodeIds.last == node.id
                                      ? Colors.red[400]
                                      : selectedNodeIds.contains(node.id)
                                          ? Colors.red[200]
                                          : Colors.grey[200],
                                  child: Center(
                                    child: Text(
                                      node.id,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: selectedNodeIds.last == node.id
                                              ? Colors.white
                                              : null),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () {
                  if (selectedNodeIds.last != 'G') {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text('Gに到着していません。'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          '選択した経路は${selectedNodeIds.join('→')}です。',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('キャンセル'),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO(kenta-wakasa): 計画の変更
                            },
                            child: const Text('決定'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('決定'),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

/// 400x400のCanvasに描画する
class EdgeRender extends CustomPainter {
  final Graph graph;
  final List<String> selectedNodeIds;

  EdgeRender(this.graph, this.selectedNodeIds);

  @override
  void paint(Canvas canvas, Size size) {
    /// The arrows usually looks better with rounded caps.

    for (final edge in graph.edges) {
      final source = graph.getNode(edge.sourceId);
      final destination = graph.getNode(edge.destinationId);

      final direction = _getDirection(destination.offset - source.offset);

      final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 2.0
        ..color = Colors.grey;

      if (isPassed(edge)) {
        paint.color = Colors.red;
        paint.strokeWidth = 4.0;
      }

      switch (direction) {
        case Direction.right:
          _drawLine(
            canvas,
            _getRightPoint(source.offset, const Size(40, 40)),
            _getLeftPoint(destination.offset, const Size(40, 40)),
            paint,
          );
          break;
        case Direction.down:
          _drawLine(
            canvas,
            _getDownPoint(source.offset, const Size(40, 40)),
            _getUpPoint(destination.offset, const Size(40, 40)),
            paint,
          );
          break;
        case Direction.left:
          _drawLine(
            canvas,
            _getLeftPoint(source.offset, const Size(40, 40)),
            _getRightPoint(destination.offset, const Size(40, 40)),
            paint,
          );
          break;
        case Direction.up:
          _drawLine(
            canvas,
            _getUpPoint(source.offset, const Size(40, 40)),
            _getDownPoint(destination.offset, const Size(40, 40)),
            paint,
          );
          break;
      }
      _drawEdgeLabel(
        canvas,
        _getRightPoint(source.offset, const Size(40, 40)),
        _getLeftPoint(destination.offset, const Size(40, 40)),
        '${edge.time}分 ${edge.fee}円',
        isPassed(edge) ? Colors.red : Colors.grey,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// 矢印を描画する
  void _drawLine(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint,
  ) {
    Path path = Path();
    path.moveTo(start.dx, start.dy);
    path.relativeLineTo((end - start).dx, (end - start).dy);
    path = ArrowPath.addTip(path, isAdjusted: true);
    canvas.drawPath(path, paint);
  }

  /// offsetから角度を求める
  Direction _getDirection(Offset offset) {
    final direction = offset.direction;
    if (-pi / 4 <= direction && direction <= 0 ||
        0 <= direction && direction < pi / 4) {
      return Direction.right;
    } else if (pi / 4 <= direction && direction < (3 * pi) / 4) {
      return Direction.down;
    } else if ((3 * pi) / 4 <= direction || direction < -(3 * pi) / 4) {
      return Direction.left;
    } else {
      return Direction.up;
    }
  }

  Offset _getUpPoint(Offset offset, Size size) {
    return offset + Offset(size.width / 2, 0);
  }

  Offset _getDownPoint(Offset offset, Size size) {
    return offset + Offset(size.width / 2, size.height);
  }

  Offset _getLeftPoint(Offset offset, Size size) {
    return offset + Offset(0, size.height / 2);
  }

  Offset _getRightPoint(Offset offset, Size size) {
    return offset + Offset(size.width, size.height / 2);
  }

  /// startとendの中間に与えられたテキストを表示する
  void _drawEdgeLabel(
      Canvas canvas, Offset start, Offset end, String text, Color color) {
    final edgeCenterPosition = Offset(
      start.dx + (end.dx - start.dx) * 0.5,
      start.dy + (end.dy - start.dy) * 0.5,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: edgeCenterPosition,
        width: 80,
        height: 32,
      ),
      Paint()..color = color,
    );
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      edgeCenterPosition -
          Offset(
            textPainter.width / 2,
            textPainter.height / 2,
          ),
    );
  }

  bool isPassed(Edge edge) {
    for (var index = 0; index < selectedNodeIds.length - 1; index++) {
      if (selectedNodeIds[index] == edge.sourceId &&
          selectedNodeIds[index + 1] == edge.destinationId) {
        return true;
      }
    }
    return false;
  }
}

enum Direction {
  right,
  down,
  left,
  up,
}
