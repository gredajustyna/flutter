import 'package:floor/floor.dart';
import 'package:mood_app/src/core/utils/constants.dart';
import 'package:mood_app/src/domain/entities/mood.dart';

@dao
abstract class MoodDao{
  @Query('SELECT * FROM $kMoodsTableName')
  Future<List<Mood>> getAllMoods();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMood(Mood mood);

}