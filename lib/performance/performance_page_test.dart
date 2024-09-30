// import 'dart:math';

// import 'package:auto_route/auto_route.dart';
// import 'package:cft/routes/auto_router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:graphview/GraphView.dart';

// @RoutePage()
// class PerformancePage extends ConsumerStatefulWidget {
//   const PerformancePage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _SemanticFluencyPageState();
// }

// class _SemanticFluencyPageState extends ConsumerState<PerformancePage> {
//   static const nodeSize = Size(120, 40);
//   final selectedNodeIds = <dynamic>{'A'};

//   final graph = Graph();

//   final sugiyamaConfiguration = SugiyamaConfiguration();

//   @override
//   void initState() {
//     super.initState();

//     final nodeA = Node.Id('A');
//     final nodeB = Node.Id('B');
//     final nodeC = Node.Id('C');
//     final nodeD = Node.Id('D');
//     final nodeF = Node.Id('F');
//     final nodeG = Node.Id('G');

//     graph.addEdge(
//       nodeA,
//       nodeB,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );
//     graph.addEdge(
//       nodeA,
//       nodeC,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     graph.addEdge(
//       nodeB,
//       nodeF,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     graph.addEdge(
//       nodeC,
//       nodeD,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     graph.addEdge(
//       nodeC,
//       nodeG,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     graph.addEdge(
//       nodeD,
//       nodeF,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     graph.addEdge(
//       nodeF,
//       nodeG,
//       paint: Paint()
//         ..strokeWidth = 2
//         ..color = Colors.green,
//     );

//     sugiyamaConfiguration
//       ..bendPointShape = CurvedBendPointShape(curveLength: 2)
//       ..nodeSeparation = 20
//       ..levelSeparation = 80
//       ..coordinateAssignment = CoordinateAssignment.UpLeft
//       ..orientation = SugiyamaConfiguration.DEFAULT_ORIENTATION;

//     /// 描画が完了したら
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {});
//     });
//   }

//   List<Widget> edgeLabels() {
//     return graph.edges.map((e) {
//       final sourceNode = graph.getNodeUsingId(e.source.key!.value!);
//       final destinationNode = graph.getNodeUsingId(e.destination.key!.value!);
//       final paintColor = e.paint!.color;
//       final sourceNodeCenterPosition = Offset(
//         sourceNode.position.dx + (nodeSize.width / 2),
//         sourceNode.position.dy + (nodeSize.height / 2),
//       );

//       final destinationNodeCenterPosition = Offset(
//         destinationNode.position.dx + (nodeSize.width / 2),
//         destinationNode.position.dy + (nodeSize.height / 2),
//       );

//       final edgeCenterPosition = Offset(
//         sourceNodeCenterPosition.dx +
//             (destinationNodeCenterPosition.dx - sourceNodeCenterPosition.dx) *
//                 0.5,
//         sourceNodeCenterPosition.dy +
//             (destinationNodeCenterPosition.dy - sourceNodeCenterPosition.dy) *
//                 0.5,
//       );
//       return Positioned(
//         left: edgeCenterPosition.dx,
//         top: edgeCenterPosition.dy,
//         child: Container(
//           decoration: BoxDecoration(
//             color: paintColor,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: const Padding(
//             padding: EdgeInsets.all(4),
//             child: Center(
//               child: Text(
//                 '15分 300円',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             showDialog<void>(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   content: const Text('ホームに戻りますか？'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('キャンセル'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         context.router.replace(const HomeRoute());
//                       },
//                       child: const Text('戻る'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//           icon: const Icon(Icons.home),
//         ),
//       ),
//       body: Center(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 child: InteractiveViewer(
//                   constrained: true,
//                   clipBehavior: Clip.none,
//                   boundaryMargin: const EdgeInsets.all(240),
//                   minScale: 0.1,
//                   maxScale: 10.6,
//                   child: Stack(
//                     children: [
//                       GraphView(
//                         graph: graph,
//                         algorithm: SugiyamaAlgorithm(
//                           sugiyamaConfiguration,
//                         ),
//                         paint: Paint()
//                           ..color = Colors.green
//                           ..strokeWidth = 2
//                           ..style = PaintingStyle.stroke,
//                         builder: (node) {
//                           // I can decide what widget should be shown here based on the id
//                           final a = node.key!.value!;
//                           return rectangleWidget(a);
//                         },
//                       ),
//                       ...edgeLabels(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   final r = Random();

//   Widget rectangleWidget(dynamic a) {
//     return GestureDetector(
//       onTap: () {
//         final node = graph.getNodeUsingId(a);
//         print(node.position);

//         if (selectedNodeIds.length != 1 && selectedNodeIds.lastOrNull == a) {
//           selectedNodeIds.remove(a);

//           setState(() {});
//           return;
//         }

//         final inEdges = graph.getInEdges(graph.getNodeUsingId(a));
//         final inIds = inEdges.map((e) => e.source.key!.value).toSet();

//         if (!inIds.contains(selectedNodeIds.last)) {
//           return;
//         }

//         selectedNodeIds.add(a);

//         setState(() {});
//       },
//       child: Container(
//         width: nodeSize.width,
//         height: nodeSize.height,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: [
//             BoxShadow(
//               color: selectedNodeIds.contains(a)
//                   ? Colors.red[100]!
//                   : Colors.grey[300]!,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             '$a',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
