import 'package:mood_app/src/core/usecases/usecase.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';

class AddMoodUseCase implements UseCase<void, Mood>{
  final MoodsRepository _moodsRepository;

  AddMoodUseCase(this._moodsRepository);

  @override
  Future<void> call({required Mood params}) {
    //return null;
    print(params);
    return _moodsRepository.addMood(params);
  }

}