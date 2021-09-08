

import 'package:mood_app/src/core/usecases/usecase.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';

class GetMoodListUseCase implements UseCase<List<Mood>, void>{
  final MoodsRepository _moodsRepository;

  GetMoodListUseCase(this._moodsRepository);

  @override
  Future<List<Mood>> call({void params}) {
    return _moodsRepository.getSavedMoods();
  }
}