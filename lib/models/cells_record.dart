class CellsRecord {
  final int id;
  final DateTime date;
  final String cells;
  final int cellsType;
  int isPinned;
  int pinningSerial;

  CellsRecord({
    required this.id,
    required this.date,
    required this.cells,
    required this.cellsType,
    this.isPinned = 0,
    this.pinningSerial = 0,
  });

  factory CellsRecord.fromDatabase(Map row) {
    return CellsRecord(
      id: row['id'],
      date: DateTime.parse(row['date']),
      cells: row['cells'],
      cellsType: row['cells_type'],
      isPinned: row['is_pinned'],
      pinningSerial: row['pinning_serial'],
    );
  }

  Map<String, dynamic> toMap() => {
        'date': date.toString(),
        'cells': cells,
        'cells_type': cellsType,
      };

  factory CellsRecord.fromTextToSpeech(String cells) {
    return CellsRecord(
      id: 0,
      date: DateTime.now(),
      cells: cells,
      cellsType: 1,
    );
  }
}
