/// 演算子のenum
enum Operator {
  addition,
  subtraction,
  multiplication,
  division;

  String get toSymbol => const {
        Operator.addition: '+',
        Operator.subtraction: '−',
        Operator.multiplication: '×',
        Operator.division: '÷',
      }[this]!;
}
