import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/usecases/add_mood_usecase.dart';
import 'package:mood_app/src/domain/usecases/create_default_moods_usecase.dart';
import 'package:mood_app/src/domain/usecases/get_mood_list_usecase.dart';
import 'package:mood_app/src/domain/usecases/select_mood_from_list_usecase.dart';

part 'moods_event.dart';
part 'moods_state.dart';

class MoodsBloc extends Bloc<MoodsEvent, MoodsState>{
  final GetMoodListUseCase _getMoodListUseCase;
  final AddMoodUseCase _addMoodUseCase;

  
  MoodsBloc(this._getMoodListUseCase, this._addMoodUseCase) : super(const MoodsListLoading());

  @override
  Stream<MoodsState> mapEventToState(MoodsEvent event) async*{
    if(event is GetMoodList){
      yield* _getAllMoods();
    }
    if(event is AddMood){
      await _addMoodUseCase(params: event.mood!);
      yield* _getAllMoods();
    }
  }

  Stream<MoodsState> _getAllMoods() async*{
    final moods = await _getMoodListUseCase();
    yield MoodsListDone(moods);
  }

}