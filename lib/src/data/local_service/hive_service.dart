import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat.dart';

class HiveService {
  final Box _box = Hive.box('userData');

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
    print('key: $key, value: $value');
  }

  dynamic getData(String key) {
    return _box.get(key);
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  Future<void> clearData() async {
    final logsBox = await Hive.openBox<Chat>('aichats');
    logsBox.clear();
    await _box.clear();
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  int getLength() {
    return _box.length;
  }

  List<dynamic> getAllValues() {
    return _box.values.toList();
  }
}
