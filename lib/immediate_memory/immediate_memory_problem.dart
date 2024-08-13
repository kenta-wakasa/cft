import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'immediate_memory_problem.freezed.dart';
part 'immediate_memory_problem.g.dart';

@freezed
class ImmediateMemoryProblem with _$ImmediateMemoryProblem {
  factory ImmediateMemoryProblem({
    required List<String> randomNumbers,
    @Default([]) List<String> userAnswerNumbers,
    DateTime? startedAt,
    DateTime? endAt,
  }) = _ImmediateMemoryProblem;
  const ImmediateMemoryProblem._();

  factory ImmediateMemoryProblem.fromJson(Map<String, dynamic> json) =>
      _$ImmediateMemoryProblemFromJson(json);

  static final random = Random.secure();

  factory ImmediateMemoryProblem.generate() {
    final randomNumbers = <String>[];
    for (var length = 4; length <= 8; length++) {
      randomNumbers.addAll([
        List.generate(length, (index) {
          return random.nextInt(10).toString();
        }).join(),
        List.generate(length, (index) {
          return random.nextInt(10).toString();
        }).join(),
      ]);
    }
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

  /// 誤答数
  int get incorrectAnswerCount {
    var result = 0;
    for (var i = 0; i < randomNumbers.length; i++) {
      if (randomNumbers[i] != userAnswerNumbers[i]) {
        result++;
      }
    }
    return result;
  }

  /// 正解率
  double get correctRate => correctAnswerCount / randomNumbers.length;
}
