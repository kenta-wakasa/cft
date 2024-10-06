import 'package:cft/performance/graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_problem.freezed.dart';
part 'performance_problem.g.dart';

@freezed
class PerformanceProblem with _$PerformanceProblem {
  factory PerformanceProblem({
    required Graph graph,
    required List<String> questionTexts,
  }) = _PerformanceProblem;
  const PerformanceProblem._();

  factory PerformanceProblem.fromJson(Map<String, dynamic> json) =>
      _$PerformanceProblemFromJson(json);
}
