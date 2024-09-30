import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cft/performance/edge.dart';
import 'package:cft/performance/graph.dart';
import 'package:cft/performance/node.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PerformancePage extends ConsumerStatefulWidget {
  const PerformancePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PerformancePageState();
}

class _PerformancePageState extends ConsumerState<PerformancePage> {
  final graph = Graph(
    nodes: [
      Node(id: 'A', offset: const Offset(100, 40)),
      Node(id: 'B', offset: const Offset(300, 240)),
    ],
    edges: [
      Edge(
        sourceId: 'A',
        destinationId: 'B',
        fee: 100,
        time: 10,
      ),
    ],
  );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Performance Page'),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 400,
                    height: 400,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomPaint(
                          size: const Size(400, 400),
                          painter: EdgeRender(graph, Offset.zero),
                        ),
                        ...graph.nodes.map((node) {
                          return Positioned(
                            left: node.offset.dx,
                            top: node.offset.dy,
                            child: Container(
                              width: 40,
                              height: 40,
                              color: Colors.grey[300],
                              child: Center(
                                child: Text(node.id),
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
          ],
        ),
      ),
    );
  }
}

/// 400x400のCanvasに描画する
class EdgeRender extends CustomPainter {
  final Graph graph;
  final Offset offset;

  EdgeRender(this.graph, this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    /// The arrows usually looks better with rounded caps.
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;

    for (final edge in graph.edges) {
      final source = graph.getNode(edge.sourceId);
      final destination = graph.getNode(edge.destinationId);

      final direction = _getDirection(destination.offset - source.offset);

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
    canvas.drawPath(path, paint..color = Colors.cyan);
  }

  /// offsetから角度を求める
  Direction _getDirection(Offset offset) {
    final direction = offset.direction;
    if (-pi / 4 <= direction && direction < pi / 4) {
      return Direction.right;
    } else if (pi / 4 <= direction && direction < (3 * pi) / 4) {
      return Direction.down;
    } else if ((3 * pi) / 4 <= direction && direction < -(3 * pi) / 4) {
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
  void _drawEdgeLabel(Canvas canvas, Offset start, Offset end, String text) {
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
      Paint()..color = Colors.cyan,
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
}

enum Direction {
  right,
  down,
  left,
  up,
}
