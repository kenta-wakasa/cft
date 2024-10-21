import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:cft/auth/firebase_auth.dart';
import 'package:cft/common/common_app_bar.dart';
import 'package:cft/home/home_page.dart';
import 'package:cft/performance/edge.dart';
import 'package:cft/performance/graph.dart';
import 'package:cft/performance/node.dart';
import 'package:cft/performance/performance_problem.dart';
import 'package:cft/performance/performance_problem_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PerformancePage extends ConsumerStatefulWidget {
  const PerformancePage({
    super.key,
    required this.nextPath,
    required this.id,
  });

  final String? nextPath;

  final String? id;

  static const path = '/performance';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PerformancePageState();
}

class _PerformancePageState extends ConsumerState<PerformancePage> {
  static const canvasSize = Size(400, 480);

  var currentQuestionIndex = 0;
  var currentGraphIndex = 0;

  var isReady = false;

  /// 問題はここに追加していく
  var performanceProblems = [
    PerformanceProblem(
      graph: Graph(
        nodes: [
          Node(
            id: 'S',
            dx: 160,
            dy: 0,
          ),
          Node(
            id: 'A',
            dx: 0,
            dy: 180,
          ),
          Node(
            id: 'B',
            dx: 320,
            dy: 180,
          ),
          Node(
            id: 'G',
            dx: 160,
            dy: 400,
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
      ),
      questionTexts: [
        'それぞれの経路に、かかる時間と料金を表示しています。Sを出発点として、30分以内にGに到着したいとき、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、今度は必ずAを通り、Sを出発点として、30分以内にGに到着したいとき、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、今度は時間はどれだけかかってもいいので、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。'
      ],
      answerTexts: [
        'S→B→G',
        'S→A→G',
        'S→A→B→G',
      ],
    ),
    PerformanceProblem(
      graph: Graph(
        nodes: [
          Node(
            id: 'S',
            dx: 180,
            dy: 0,
          ),
          Node(
            id: 'A',
            dx: 0,
            dy: 200,
          ),
          Node(
            id: 'B',
            dx: 180,
            dy: 200,
          ),
          Node(
            id: 'C',
            dx: 360,
            dy: 200,
          ),
          Node(
            id: 'G',
            dx: 180,
            dy: 400,
          ),
        ],
        edges: [
          Edge(
            sourceId: 'S',
            destinationId: 'A',
            fee: 500,
            time: 5,
          ),
          Edge(
            sourceId: 'S',
            destinationId: 'B',
            fee: 300,
            time: 10,
          ),
          Edge(
            sourceId: 'S',
            destinationId: 'C',
            fee: 100,
            time: 15,
          ),
          Edge(
            sourceId: 'C',
            destinationId: 'B',
            fee: 150,
            time: 20,
          ),
          Edge(
            sourceId: 'C',
            destinationId: 'G',
            fee: 250,
            time: 20,
          ),
          Edge(
            sourceId: 'A',
            destinationId: 'B',
            fee: 100,
            time: 25,
          ),
          Edge(
            sourceId: 'A',
            destinationId: 'G',
            fee: 300,
            time: 15,
          ),
          Edge(
            sourceId: 'B',
            destinationId: 'G',
            fee: 50,
            time: 15,
          ),
        ],
      ),
      questionTexts: [
        'それぞれの経路に、かかる時間と料金を表示しています。Sを出発点として、Gに到着したいとき、必ずAを通りかつ700円以内の料金となる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、今度はSを出発点として、Gに到着したいとき、もっとも短い時間でたどり着ける経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、Sを出発点として、Gに到着したいとき、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
      ],
      answerTexts: [
        'S→A→B→G',
        'S→A→G',
        'S→C→B→G',
      ],
    ),
    PerformanceProblem(
      graph: Graph(
        nodes: [
          Node(
            id: 'S',
            dx: 120 + 40,
            dy: 0,
          ),
          Node(
            id: 'A',
            dx: 0 + 40,
            dy: 130,
          ),
          Node(
            id: 'B',
            dx: 240 + 40,
            dy: 130,
          ),
          Node(
            id: 'C',
            dx: 0 + 40,
            dy: 360,
          ),
          Node(
            id: 'D',
            dx: 240 + 40,
            dy: 240,
          ),
          Node(
            id: 'G',
            dx: 240 + 40,
            dy: 360,
          ),
        ],
        edges: [
          Edge(
            sourceId: 'S',
            destinationId: 'A',
            fee: 250,
            time: 5,
          ),
          Edge(
            sourceId: 'S',
            destinationId: 'B',
            fee: 200,
            time: 10,
          ),
          Edge(
            sourceId: 'A',
            destinationId: 'B',
            fee: 10,
            time: 15,
          ),
          Edge(
            sourceId: 'A',
            destinationId: 'C',
            fee: 50,
            time: 20,
          ),
          Edge(
            sourceId: 'B',
            destinationId: 'D',
            fee: 150,
            time: 10,
          ),
          Edge(
            sourceId: 'B',
            destinationId: 'C',
            fee: 5,
            time: 25,
          ),
          Edge(
            sourceId: 'A',
            destinationId: 'D',
            fee: 50,
            time: 15,
          ),
          Edge(
            sourceId: 'C',
            destinationId: 'D',
            fee: 75,
            time: 10,
          ),
          Edge(
            sourceId: 'C',
            destinationId: 'G',
            fee: 300,
            time: 5,
          ),
          Edge(
            sourceId: 'D',
            destinationId: 'G',
            fee: 200,
            time: 10,
          ),
        ],
      ),
      questionTexts: [
        'それぞれの経路に、かかる時間と料金を表示しています。Sを出発点として、必ずCを通り、30分以内にGに到着したいとき、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、Sを出発点として、どの経路を通っても構わないので、30分以内にGに到着したいとき、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。',
        '次の問題です。経路はそのままですが、Sを出発点として、Gに到着したいとき、時間はどれだけかかってもいいので、もっとも料金が安くなる経路を回答してください。次に進みたい場所をタップすることで選択できます。'
      ],
      answerTexts: [
        'S→A→C→G',
        'S→A→D→G',
        'S→B→C→D→G',
      ],
    ),
  ];

  late final selectedNodeIds = [
    performanceProblems.first.graph.nodes.first.id,
  ];

  Future<void> enterAnswer({bool isForce = false}) async {
    await showDialog<void>(
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
              onPressed: () async {
                await nextProblem();
                Navigator.of(context).pop();
              },
              child: const Text('決定'),
            ),
          ],
        );
      },
    );
  }

  Future<void> nextProblem() async {
    /// 回答の記録
    performanceProblems = [
      for (final problem in performanceProblems)
        if (problem == performanceProblems[currentGraphIndex])
          problem.copyWith(
            userAnswers: [
              ...problem.userAnswers,
              selectedNodeIds.join('→'),
            ],
            answeredAtList: [
              ...problem.answeredAtList,
              DateTime.now(),
            ],
          )
        else
          problem
    ];

    setState(() {
      selectedNodeIds.clear();
      selectedNodeIds.add(
        performanceProblems[currentGraphIndex].graph.nodes.first.id,
      );
    });

    /// これが最終問題文の場合、終了するか、次の問題に進む
    if (performanceProblems[currentGraphIndex].questionTexts.length ==
        currentQuestionIndex + 1) {
      /// 最終問題だった場合
      if (performanceProblems.length == currentGraphIndex + 1) {
        /// ログの送信
        final uid = ref.read(firebaseAuthProvider).currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('performance_problem_log')
            .add(
              PerformanceProblemLog(
                      uid: uid, performanceProblems: performanceProblems)
                  .toJson(),
            );

        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('お疲れ様でした！'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: widget.nextPath == null
                      ? const Text('ホームに戻る')
                      : const Text('次のゲーム'),
                ),
              ],
            );
          },
        );
        if (!context.mounted) {
          return;
        }
        if (widget.nextPath != null) {
          context.go('${widget.nextPath!}?id=${widget.id}');
        } else {
          context.go(HomePage.path);
        }
      } else {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('次の問題では経路図が変わります。'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('次に進む'),
                ),
              ],
            );
          },
        );

        /// 次のグラフに進む
        setState(() {
          currentQuestionIndex = 0;
          currentGraphIndex++;
          performanceProblems = [
            for (var index = 0; index < performanceProblems.length; index++)
              if (index == currentGraphIndex)
                performanceProblems[index].copyWith(
                  startedAt: DateTime.now(),
                )
              else
                performanceProblems[index]
          ];
        });
      }
    }

    /// 次の問題に進む
    else {
      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('経路図は同じですが、問題が変更されます。'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('次に進む'),
              ),
            ],
          );
        },
      );
      setState(() {
        currentQuestionIndex++;
      });

      performanceProblems = [
        for (var index = 0; index < performanceProblems.length; index++)
          if (index == currentGraphIndex)
            performanceProblems[index].copyWith(
              startedAt: DateTime.now(),
            )
          else
            performanceProblems[index]
      ];
    }
  }

  Future<void> timer() async {
    while (mounted) {
      await Future.delayed(const Duration(microseconds: 10000 ~/ 60));
      setState(() {});
      if (isReady) {
        if (currentQuestionIndex == 0) {
          if (performanceProblems[currentGraphIndex].startedAt != null &&
              performanceProblems[currentGraphIndex]
                  .startedAt!
                  .add(const Duration(seconds: 60))
                  .isBefore(DateTime.now())) {
            await nextProblem();
          }
        } else {
          if (performanceProblems[currentGraphIndex]
              .answeredAtList[currentQuestionIndex - 1]
              .add(const Duration(seconds: 60))
              .isBefore(DateTime.now())) {
            await nextProblem();
          }
        }
      }
    }
  }

  Future<void> start() async {
    setState(() {
      isReady = true;
      performanceProblems = [
        for (var index = 0; index < performanceProblems.length; index++)
          if (index == currentGraphIndex)
            performanceProblems[index].copyWith(
              startedAt: DateTime.now(),
            )
          else
            performanceProblems[index]
      ];
    });
    await timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: isReady
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(16),
                    Text(
                      performanceProblems[currentGraphIndex]
                          .questionTexts[currentQuestionIndex],
                    ),
                    const Gap(16),

                    /// 制限時間
                    LinearProgressIndicator(
                      value: 1 -
                          (DateTime.now()
                                  .difference(
                                      performanceProblems[currentGraphIndex]
                                          .startedAt!)
                                  .inMilliseconds /
                              (const Duration(seconds: 60).inMilliseconds)),
                    ),
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
                                  size:
                                      Size(canvasSize.width, canvasSize.height),
                                  painter: EdgeRender(
                                      performanceProblems[currentGraphIndex]
                                          .graph,
                                      selectedNodeIds),
                                ),
                                ...performanceProblems[currentGraphIndex]
                                    .graph
                                    .nodes
                                    .map((node) {
                                  return Positioned(
                                    left: node.dx,
                                    top: node.dy,
                                    child: GestureDetector(
                                      onTap: () {
                                        /// 選択したNodeの最後が入ってくるものであれば追加する
                                        if (performanceProblems[
                                                currentGraphIndex]
                                            .graph
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
                                                color: selectedNodeIds.last ==
                                                        node.id
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
                      onPressed: enterAnswer,
                      child: const Text('決定'),
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '遂行・計画変更',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      '次の画面では経路図が表示されます。指定された条件に従って、最適な経路を選択してください。※各問制限時間60秒',
                    ),
                    const Gap(32),
                    ElevatedButton(
                      onPressed: start,
                      child: const Text('スタート'),
                    ),
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

      final direction = getDirection(Offset(destination.dx, destination.dy) -
          Offset(source.dx, source.dy));

      final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 2
        ..color = Colors.grey;

      if (isPassed(edge)) {
        paint.color = Colors.red;
        paint.strokeWidth = 4.0;
      }

      switch (direction) {
        case Direction.right:
          drawLine(
            canvas,
            getRightPoint(Offset(source.dx, source.dy), const Size(40, 40)),
            getLeftPoint(
                Offset(destination.dx, destination.dy), const Size(40, 40)),
            paint,
          );
          break;
        case Direction.down:
          drawLine(
            canvas,
            getDownPoint(Offset(source.dx, source.dy), const Size(40, 40)),
            getUpPoint(
                Offset(destination.dx, destination.dy), const Size(40, 40)),
            paint,
          );
          break;
        case Direction.left:
          drawLine(
            canvas,
            getLeftPoint(Offset(source.dx, source.dy), const Size(40, 40)),
            getRightPoint(
                Offset(destination.dx, destination.dy), const Size(40, 40)),
            paint,
          );
          break;
        case Direction.up:
          drawLine(
            canvas,
            getUpPoint(Offset(source.dx, source.dy), const Size(40, 40)),
            getDownPoint(
                Offset(destination.dx, destination.dy), const Size(40, 40)),
            paint,
          );
          break;
      }
      drawEdgeLabel(
        canvas,
        getRightPoint(Offset(source.dx, source.dy), const Size(40, 40)),
        getLeftPoint(
            Offset(destination.dx, destination.dy), const Size(40, 40)),
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
  void drawLine(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint,
  ) {
    Path path = Path();
    path.moveTo(start.dx, start.dy);
    path.relativeLineTo((end - start).dx * 0.2, (end - start).dy * 0.2);
    path = ArrowPath.addTip(
      path,
      isAdjusted: true,
      tipAngle: pi * 0.15,
      tipLength: 10,
    );
    path.relativeLineTo((end - start).dx * 0.7, (end - start).dy * 0.7);
    path = ArrowPath.addTip(
      path,
      isAdjusted: true,
      tipAngle: pi * 0.2,
      tipLength: 10,
    );
    path.relativeLineTo((end - start).dx * 0.1, (end - start).dy * 0.1);
    canvas.drawPath(path, paint);
  }

  /// offsetから角度を求める
  Direction getDirection(Offset offset) {
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

  Offset getUpPoint(Offset offset, Size size) {
    return offset + Offset(size.width / 2, 0);
  }

  Offset getDownPoint(Offset offset, Size size) {
    return offset + Offset(size.width / 2, size.height);
  }

  Offset getLeftPoint(Offset offset, Size size) {
    return offset + Offset(0, size.height / 2);
  }

  Offset getRightPoint(Offset offset, Size size) {
    return offset + Offset(size.width, size.height / 2);
  }

  /// startとendの中間に与えられたテキストを表示する
  void drawEdgeLabel(
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
