// ignore_for_file: file_names

import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  static Future<MySqlConnection> createConnection() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: "host",
      user: "user",
      password: "port",
      db: "database",
      port: 3306,
    ));
    return conn;
  }

  static Future<void> insertDynamic(Map<String, dynamic> jsonData) async {
    MySqlConnection conn = await createConnection();
    try {
      String table = jsonData['table'];
      Map<String, dynamic> data = Map.from(jsonData)..remove('table');

      String columns = data.keys.join(", ");
      String values = data.values.map((value) => '?').join(", ");
      List<dynamic> args = data.values.toList();

      await conn.query('INSERT INTO $table ($columns) VALUES ($values)', args);
    } finally {
      await conn.close();
    }
  }
}
