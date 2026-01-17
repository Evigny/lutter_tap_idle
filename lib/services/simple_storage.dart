import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SimpleStorage {
  static const String _fileName = 'game_save.json';

  // Сохранить игру
  static Future<void> saveGame(Map<String, dynamic> gameData) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      await file.writeAsString(jsonEncode(gameData));
      print('✅ Игра сохранена успешно');
    } catch (e) {
      print('❌ Ошибка сохранения: $e');
    }
  }

  // Загрузить игру
  static Future<Map<String, dynamic>?> loadGame() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');

      if (await file.exists()) {
        final content = await file.readAsString();
        return jsonDecode(content) as Map<String, dynamic>;
      }
    } catch (e) {
      print('❌ Ошибка загрузки: $e');
    }
    return null;
  }

  // Удалить сохранение
  static Future<void> deleteSave() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      if (await file.exists()) {
        await file.delete();
        print('🗑️ Сохранение удалено');
      }
    } catch (e) {
      print('❌ Ошибка удаления: $e');
    }
  }
}
