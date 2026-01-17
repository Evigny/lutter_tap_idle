import 'generator.dart';
import 'upgrade.dart';

class GameData {
  double totalEnergy;
  double tapPower;
  double globalMultiplier;
  double offlineMultiplier;

  Map<String, Bonus> activeBonuses = {};

  List<Generator> generators;
  List<Upgrade> upgrades;

  DateTime lastUpdateTime;

  GameData({
    this.totalEnergy = 0,
    this.tapPower = 1.0,
    this.globalMultiplier = 1.0,
    this.offlineMultiplier = 1.0,
    required this.generators,
    required this.upgrades,
    required this.lastUpdateTime,
  });

  // Общий доход в секунду от всех генераторов
  double get incomePerSecond {
    double total = 0;
    for (var generator in generators) {
      total += generator.currentIncome;
    }
    return total * globalMultiplier;
  }

  // Сумма силы всех улучшений тапа
  double get totalMultiplier {
    double multiplier = globalMultiplier;
    for (var bonus in activeBonuses.values) {
      multiplier *= bonus.multiplier;
    }
    return multiplier;
  }

  GameData copyWith({
    double? totalEnergy,
    double? tapPower,
    double? globalMultiplier,
    double? offlineMultiplier,

    List<Generator>? generators,
    List<Upgrade>? upgrades,
    DateTime? lastUpdateTime,
    required Map<String, Bonus> activeBonuses,
  }) {
    return GameData(
      totalEnergy: totalEnergy ?? this.totalEnergy,
      tapPower: tapPower ?? this.tapPower,
      globalMultiplier: globalMultiplier ?? this.globalMultiplier,
      offlineMultiplier: offlineMultiplier ?? this.offlineMultiplier,
      generators: generators ?? this.generators,
      upgrades: upgrades ?? this.upgrades,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
    );
  }
}

class Bonus {
  final String id;
  final double multiplier;
  final DateTime expiresAt;

  Bonus({required this.id, required this.multiplier, required this.expiresAt});

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
