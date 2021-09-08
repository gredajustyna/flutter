
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:mood_app/src/data/datasources/local/DAOs/mood_dao.dart';
import 'package:mood_app/src/domain/entities/mood.dart';

part 'app_database.g.dart';

@Database(version:1 , entities:[Mood])
abstract class AppDatabase extends FloorDatabase{
  MoodDao get moodDao;
}