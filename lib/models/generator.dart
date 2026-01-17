class Generator {
  final String id;
  final String name;
  final String description;
  final String assetPath;
  final double baseCost;
  final double baseIncome;
  final double costGrowthRate;

  int level;

  Generator({
    required this.id,
    required this.name,
    required this.description,
    required this.assetPath,
    required this.baseCost,
    required this.baseIncome,
    required this.costGrowthRate,
    this.level = 0,
  });

  // Текущая стоимость следующего уровня
  double get currentCost {
    return baseCost * _pow(costGrowthRate, level);
  }

  // Текущий доход в секунду
  double get currentIncome {
    return baseIncome * level * (1.0 + (level - 1) * 0.05);
  }

  // Быстрая функция возведения в степень (оптимизация)
  double _pow(double x, int n) {
    double result = 1.0;
    for (int i = 0; i < n; i++) {
      result *= x;
    }
    return result;
  }

  Generator copyWith({int? level}) {
    return Generator(
      id: id,
      name: name,
      description: description,
      assetPath: assetPath,
      baseCost: baseCost,
      baseIncome: baseIncome,
      costGrowthRate: costGrowthRate,
      level: level ?? this.level,
    );
  }
}
