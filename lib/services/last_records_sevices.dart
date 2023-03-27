import 'package:speech_assistance_app/models/database_model.dart';

class LastRecordSevices {
  DatabaseModel? _databaseModel;

  LastRecordSevices() {
    _databaseModel = DatabaseModel();
  }

  Future<List<Map<String, Object?>>> readData() async {
    return _databaseModel!
        .readData(table: 'last_cells', orderBy: 'is_pinned DESC,datetime(date) DESC');
  }
}
