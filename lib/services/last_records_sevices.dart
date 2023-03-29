import 'package:speech_assistance_app/models/database_model.dart';

class LastRecordSevices {
  DatabaseModel? _databaseModel;

  LastRecordSevices() {
    _databaseModel = DatabaseModel();
  }

  Future<List<Map<String, Object?>>> readData() async {
    return _databaseModel!.readData(
        table: 'last_cells',
        orderBy: 'pinning_serial DESC,is_pinned DESC,datetime(date) DESC');
  }

  Future<void> updateData(
      {required int isPinning,
      required int pinningSerial,
      required int id}) async {
    await _databaseModel!
        .updateData(
            table: 'last_cells',
            values: {'is_pinned': isPinning, 'pinning_serial': pinningSerial},
            where: 'id = ?',
            whereArgs: [id])
        .then((value) => print(value));
  }
}
