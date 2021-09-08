import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/usecases/select_mood_from_list_usecase.dart';
import 'package:mood_app/src/presentation/blocs/select_mood_event.dart';

class SelectMoodBloc extends Bloc<SelectMoodEvent, Mood>{
  final SelectMoodFromListUseCase _selectMoodFromListUseCase;

  SelectMoodBloc(this._selectMoodFromListUseCase) : super(Mood(name: 'Neutral', pathToImg: 'assets/faces3.png'));

  @override
  Stream<Mood> mapEventToState(SelectMoodEvent event) async*{
    if(event is ButtonWithMoodClickedEvent){
      yield _selectMoodFromListUseCase(params: event.moods, index: event.index);
    }
  }
}