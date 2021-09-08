import 'package:mood_app/src/data/datasources/local/app_database.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';

class MoodsRepositoryImpl implements MoodsRepository{
  final AppDatabase _appDatabase;

  const MoodsRepositoryImpl(this._appDatabase);

  @override
  Future<void> addMood(Mood mood) {
    return _appDatabase.moodDao.insertMood(mood);
  }

  @override
  Future<List<Mood>> getSavedMoods() {
    return _appDatabase.moodDao.getAllMoods();
  }

  @override
  Mood selectMood(List<Mood> moods, int index) {
    return moods[index];
  }

  @override
  List<Mood> createDefaultMoods() {
    List<Mood> defaultMoods = [];
    defaultMoods.add(new Mood(name: 'Very sad', pathToImg: 'assets/faces5.png'));
    defaultMoods.add(new Mood(name: 'Sad', pathToImg: 'assets/faces4.png'));
    defaultMoods.add(new Mood(name: 'Neutral', pathToImg: 'assets/faces1.png'));
    defaultMoods.add(new Mood(name: 'Happy', pathToImg: 'assets/faces3.png'));
    defaultMoods.add(new Mood(name: 'Very happy', pathToImg: 'assets/faces2.png'));
    return defaultMoods;
  }

  
}