import 'package:mood_app/src/core/usecases/no_future_usecase.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';

class SelectMoodFromListUseCase implements NoFutureUseCase<Mood, List<Mood>>{
  final MoodsRepository _moodsRepository;

  SelectMoodFromListUseCase(this._moodsRepository);

  @override
  Mood call({List<Mood>? params, int? index}) {
    return _moodsRepository.selectMood(params!, index!);
  }

}