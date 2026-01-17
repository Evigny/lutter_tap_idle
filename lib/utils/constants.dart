// Константы игры для баланса
class GameConstants {
  // Стартовые значения
  static const double initialEnergy = 100.0;
  static const double initialTapPower = 1.0;

  // Базовые множители
  static const double baseCostGrowth = 1.15;
  static const double tapMultiplierValue = 1.5;
  static const double globalMultiplierValue = 2.0;

  // Офлайн доход (50% от онлайн)
  static const double offlineRatio = 0.5;

  // Время авто-сохранения (секунды)
  static const int autoSaveInterval = 10;

  // Доход в секунду (тик)
  static const int incomeTickMs = 100; // 0.1 секунды
}

// Форматы чисел для отображения
class NumberFormats {
  static const List<String> suffixes = ['', 'K', 'M', 'B', 'T', 'Q'];

  static String format(double number) {
    if (number < 1000) return number.toStringAsFixed(1);

    int suffixIndex = 0;
    while (number >= 1000 && suffixIndex < suffixes.length - 1) {
      number /= 1000;
      suffixIndex++;
    }

    return '${number.toStringAsFixed(2)}${suffixes[suffixIndex]}';
  }
}
