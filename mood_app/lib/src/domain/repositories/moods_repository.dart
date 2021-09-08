import 'package:mood_app/src/domain/entities/mood.dart';

abstract class MoodsRepository{
  Future<List<Mood>> getSavedMoods();

  Future<void> addMood(Mood mood);

  Mood selectMood(List<Mood> moods, int index);

  List<Mood> createDefaultMoods();

}