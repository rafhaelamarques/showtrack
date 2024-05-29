import 'package:hive/hive.dart';
import 'package:showtrack/data/model/show.dart';

class HiveAdapters {
  static void init() {
    Hive.registerAdapter(ShowAdapter());
  }
}
