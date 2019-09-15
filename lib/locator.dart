import 'package:get_it/get_it.dart';
import 'package:packie/services/database.dart';

Future setupLocator() async {
  final db = DB(dbName: 'packie.db');
  await db.initDB();

  GetIt.I.registerSingleton<DB>(db);
}
