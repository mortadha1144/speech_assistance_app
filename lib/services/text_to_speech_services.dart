import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/models/database_model.dart';

class TextToSpeechSevicies {
  DatabaseModel? _databaseModel;

  TextToSpeechSevicies() {
    _databaseModel = DatabaseModel();
  }

  Future<void> saveText(vlues) async {
    await _databaseModel!.insertData('last_cells', vlues);
  }
}
