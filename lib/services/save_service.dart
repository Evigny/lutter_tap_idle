import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/game_data.dart';
import '../models/hive_adapters.dart';

class SaveService {
  static const String _boxName = 'gameData';
  static const String _saveKey = 'currentGame';

  static Future<void> init() async {
    // Инициализация Hive
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    // Регистрация адаптеров
    registerHiveAdapters();

    // Открытие коробки
    await Hive.openBox<GameData>(_boxName);
  }

  static Future<void> saveGame(GameData gameData) async {
    final box = Hive.box<GameData>(_boxName);
    await box.put(_saveKey, gameData);
  }

  static Future<GameData?> loadGame() async {
    final box = Hive.box<GameData>(_boxName);
    return box.get(_saveKey);
  }

  static Future<void> deleteSave() async {
    final box = Hive.box<GameData>(_boxName);
    await box.delete(_saveKey);
  }

  static bool hasSave() {
    final box = Hive.box<GameData>(_boxName);
    return box.containsKey(_saveKey);
  }

  static GameData? loadGameSync() {
    try {
      final box = Hive.box<GameData>(_boxName);
      return box.get(_saveKey);
    } catch (e) {
      return null;
    }
  }
}
