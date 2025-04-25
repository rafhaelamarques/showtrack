import 'dart:convert';

import 'package:showtrack/data/model/channel.dart';
import 'package:showtrack/data/model/embedded.dart';
import 'package:showtrack/data/model/image_banner.dart';
import 'package:showtrack/data/model/links.dart';
import 'package:showtrack/data/model/rating.dart';
import 'package:showtrack/data/model/schedule.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/services/repositories/tvshow_repository_interface.dart';
import 'package:sqflite/sqflite.dart';

class TvShowSqliteRepository implements TvShowRepositoryInterface {
  // Pseudo singleton
  static late Database _database;
  static late TvShowSqliteRepository _instance;

  TvShowSqliteRepository._();

  static Future<TvShowSqliteRepository> getInstance() async {
    _database = await _initDb();
    _instance = TvShowSqliteRepository._();
    return _instance;
  }

  static Future<Database> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = '$databasesPath/shows.db';

    bool exists = await databaseExists(path);

    if (exists) {
      // Se existir, apenas abre
      return await openDatabase(path, version: 1);
    }
    // Se não existir, cria e abre
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shows (
        id INTEGER PRIMARY KEY,
        name TEXT,
        status TEXT,
        averageRuntime INTEGER,
        schedule TEXT,
        rating TEXT,
        network TEXT,
        webChannel TEXT,
        image TEXT,
        summary TEXT,
        links TEXT,
        embedded TEXT,
        createdAt INTEGER
      )
    ''');
  }

  Future<Database> get db async => _database;

  // Método auxiliar para decodificar JSON na query
  Map<String, dynamic>? _tryDecodeMap(dynamic value) {
    if (value == null || value == 'null') return null;
    final decoded = jsonDecode(value);
    return decoded is Map<String, dynamic> ? decoded : null;
  }

  @override
  Future<List<Show>> getShows() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps =
        await db.query('shows', orderBy: 'createdAt ASC');

    return maps
        .map((map) => Show(
              id: map['id'],
              name: map['name'],
              status: map['status'],
              averageRuntime: map['averageRuntime'] as int?,
              schedule: Schedule.fromJson(_tryDecodeMap(map['schedule']) ?? {}),
              rating: Rating.fromJson(_tryDecodeMap(map['rating']) ?? {}),
              network: _tryDecodeMap(map['network']) != null
                  ? Channel.fromJson(_tryDecodeMap(map['network'])!)
                  : null,
              webChannel: _tryDecodeMap(map['webChannel']) != null
                  ? Channel.fromJson(_tryDecodeMap(map['webChannel'])!)
                  : null,
              image: _tryDecodeMap(map['image']) != null
                  ? ImageBanner.fromJson(_tryDecodeMap(map['image'])!)
                  : null,
              summary: map['summary'] as String?,
              links: _tryDecodeMap(map['links']) != null
                  ? Links.fromJson(_tryDecodeMap(map['links'])!)
                  : null,
              embedded: _tryDecodeMap(map['embedded']) != null
                  ? Embedded.fromJson(_tryDecodeMap(map['embedded'])!)
                  : null,
            ))
        .toList();
  }

  @override
  Future<void> saveShow(Show show) async {
    Database db = await this.db;
    await db.insert(
      'shows',
      {
        'id': show.id,
        'name': show.name,
        'status': show.status,
        'averageRuntime': show.averageRuntime,
        'schedule': jsonEncode(show.schedule?.toJson()),
        'rating': jsonEncode(show.rating?.toJson()),
        'network': jsonEncode(show.network?.toJson()),
        'webChannel': jsonEncode(show.webChannel?.toJson()),
        'image': jsonEncode(show.image?.toJson()),
        'summary': show.summary,
        'links': jsonEncode(show.links?.toJson()),
        'embedded': jsonEncode(show.embedded?.toJson()),
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteShow(Show show) async {
    Database db = await this.db;
    await db.delete(
      'shows',
      where: 'id = ?',
      whereArgs: [show.id],
    );
  }
}
