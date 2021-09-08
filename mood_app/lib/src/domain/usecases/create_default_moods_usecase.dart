import 'package:mood_app/src/core/usecases/no_future_usecase.dart';
import 'package:mood_app/src/core/usecases/usecase.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';

class CreateDefaultMoodsUseCase implements NoFutureUseCase<List<Mood>,void>{
  final MoodsRepository _moodsRepository;

  CreateDefaultMoodsUseCase(this._moodsRepository);

  @override
  List<Mood> call({void params}) {
    return _moodsRepository.createDefaultMoods();
  }

}