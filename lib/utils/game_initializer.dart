import '../models/game_data.dart';
import '../models/generator.dart';
import '../models/upgrade.dart';
import 'constants.dart';

class GameInitializer {
  static GameData createInitialGameData() {
    return GameData(
      totalEnergy: GameConstants.initialEnergy,
      tapPower: GameConstants.initialTapPower,
      globalMultiplier: 1.0,
      offlineMultiplier: 1.0,
      generators: _createInitialGenerators(),
      upgrades: _createInitialUpgrades(),
      lastUpdateTime: DateTime.now(),
    );
  }

  static List<Generator> _createInitialGenerators() {
    return [
      Generator(
        id: 'gen_1',
        name: 'Солнечная панель',
        description: 'Базовая энергия из солнечного света',
        assetPath: 'assets/generators/solar.svg',
        baseCost: 10,
        baseIncome: 0.1,
        costGrowthRate: GameConstants.baseCostGrowth,
      ),
      Generator(
        id: 'gen_2',
        name: 'Ветряк',
        description: 'Использует силу ветра',
        assetPath: 'assets/generators/wind.svg',
        baseCost: 100,
        baseIncome: 1,
        costGrowthRate: GameConstants.baseCostGrowth,
      ),
      Generator(
        id: 'gen_3',
        name: 'Гидростанция',
        description: 'Энергия потока воды',
        assetPath: 'assets/generators/water.svg',
        baseCost: 1000,
        baseIncome: 10,
        costGrowthRate: GameConstants.baseCostGrowth,
      ),
      Generator(
        id: 'gen_4',
        name: 'Ядерный реактор',
        description: 'Мощный источник энергии',
        assetPath: 'assets/generators/nuclear.svg',
        baseCost: 10000,
        baseIncome: 100,
        costGrowthRate: GameConstants.baseCostGrowth,
      ),
    ];
  }

  static List<Upgrade> _createInitialUpgrades() {
    return [
      Upgrade(
        id: 'upg_1',
        name: 'Усиленные перчатки',
        description: 'Тап дает в 2 раза больше энергии',
        cost: 500,
        type: UpgradeType.tapMultiplier,
        value: GameConstants.tapMultiplierValue,
      ),
      Upgrade(
        id: 'upg_2',
        name: 'Оптимизация сетей',
        description: 'Все генераторы работают на 50% эффективнее',
        cost: 5000,
        type: UpgradeType.globalMultiplier,
        value: GameConstants.globalMultiplierValue,
      ),
      Upgrade(
        id: 'upg_3',
        name: 'Авто-сборщик',
        description: 'Собирает 25% офлайн дохода',
        cost: 10000,
        type: UpgradeType.offlineBonus,
        value: 0.25,
      ),
    ];
  }
}
