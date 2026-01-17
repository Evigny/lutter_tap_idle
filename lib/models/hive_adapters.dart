import 'package:hive/hive.dart';
import 'generator.dart';
import 'upgrade.dart';
import 'game_data.dart';

// Регистрация адаптеров
void registerHiveAdapters() {
  Hive.registerAdapter(GeneratorAdapter());
  Hive.registerAdapter(UpgradeAdapter());
  Hive.registerAdapter(UpgradeTypeAdapter());
  Hive.registerAdapter(GameDataAdapter());
}

// Адаптер для Generator
class GeneratorAdapter extends TypeAdapter<Generator> {
  @override
  final int typeId = 0;

  @override
  Generator read(BinaryReader reader) {
    return Generator(
      id: reader.readString(),
      name: reader.readString(),
      description: reader.readString(),
      assetPath: reader.readString(),
      baseCost: reader.readDouble(),
      baseIncome: reader.readDouble(),
      costGrowthRate: reader.readDouble(),
      level: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Generator obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeString(obj.assetPath);
    writer.writeDouble(obj.baseCost);
    writer.writeDouble(obj.baseIncome);
    writer.writeDouble(obj.costGrowthRate);
    writer.writeInt(obj.level);
  }
}

// Адаптер для UpgradeType
class UpgradeTypeAdapter extends TypeAdapter<UpgradeType> {
  @override
  final int typeId = 1;

  @override
  UpgradeType read(BinaryReader reader) {
    return UpgradeType.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, UpgradeType obj) {
    writer.writeInt(obj.index);
  }
}

// Адаптер для Upgrade
class UpgradeAdapter extends TypeAdapter<Upgrade> {
  @override
  final int typeId = 2;

  @override
  Upgrade read(BinaryReader reader) {
    return Upgrade(
      id: reader.readString(),
      name: reader.readString(),
      description: reader.readString(),
      cost: reader.readDouble(),
      type: reader.read(),
      value: reader.readDouble(),
      isPurchased: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Upgrade obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeDouble(obj.cost);
    writer.write(obj.type);
    writer.writeDouble(obj.value);
    writer.writeBool(obj.isPurchased);
  }
}

// Адаптер для GameData
class GameDataAdapter extends TypeAdapter<GameData> {
  @override
  final int typeId = 3;

  @override
  GameData read(BinaryReader reader) {
    return GameData(
      totalEnergy: reader.readDouble(),
      tapPower: reader.readDouble(),
      globalMultiplier: reader.readDouble(),
      offlineMultiplier: reader.readDouble(),
      generators: List<Generator>.from(reader.readList()),
      upgrades: List<Upgrade>.from(reader.readList()),
      lastUpdateTime: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, GameData obj) {
    writer.writeDouble(obj.totalEnergy);
    writer.writeDouble(obj.tapPower);
    writer.writeDouble(obj.globalMultiplier);
    writer.writeDouble(obj.offlineMultiplier);
    writer.writeList(obj.generators);
    writer.writeList(obj.upgrades);
    writer.writeInt(obj.lastUpdateTime.millisecondsSinceEpoch);
  }
}
