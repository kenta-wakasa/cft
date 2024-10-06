import 'package:cft/common/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SemanticUnderstandingPage extends ConsumerStatefulWidget {
  const SemanticUnderstandingPage({super.key});

  static const path = '/semantic_understanding';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticUnderstandingPageState();
}

class _SemanticUnderstandingPageState
    extends ConsumerState<SemanticUnderstandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(),
    );
  }
}
