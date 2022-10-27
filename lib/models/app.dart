import 'package:hive/hive.dart';

import 'journal/journal.dart';

class HiveTypeIds {
  static const int journal = 0;
}

void registerHiveAdapter() {
  Hive.registerAdapter(JournalAdapter());
}
