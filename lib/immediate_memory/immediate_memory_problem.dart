import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'immediate_memory_problem.freezed.dart';
part 'immediate_memory_problem.g.dart';

@freezed
class ImmediateMemoryProblem with _$ImmediateMemoryProblem {
  factory ImmediateMemoryProblem({
    required List<String> randomNumbers,
    @Default([]) List<String> userAnswerNumbers,
  }) = _ImmediateMemoryProblem;
  const ImmediateMemoryProblem._();

  factory ImmediateMemoryProblem.fromJson(Map<String, dynamic> json) =>
      _$ImmediateMemoryProblemFromJson(json);

  static final random = Random.secure();

  factory ImmediateMemoryProblem.generate(int length) {
    final randomNumbers = List.generate(length, (index) {
      return List.generate(random.nextInt(7) + 1, (index) {
        return random.nextInt(10).toString();
      }).join();
    });
    return ImmediateMemoryProblem(
      randomNumbers: randomNumbers,
    );
  }

  /// 正解数
  int get correctAnswerCount {
    var result = 0;
    for (var i = 0; i < randomNumbers.length; i++) {
      if (randomNumbers[i] == userAnswerNumbers[i]) {
        result++;
      }
    }
    return result;
  }
}
