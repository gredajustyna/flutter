import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/domain/usecases/create_default_moods_usecase.dart';
import 'package:mood_app/src/presentation/blocs/default%20list/default_list_event.dart';
import 'package:mood_app/src/presentation/blocs/moods_bloc.dart';

class DefaultListBloc extends Bloc<DefaultMoodsEvent, List<Mood>>{
  final CreateDefaultMoodsUseCase _createDefaultMoodsUseCase;
  DefaultListBloc(this._createDefaultMoodsUseCase) : super([]);

  @override
  Stream<List<Mood>> mapEventToState(event) async*{
    if(event is GenerateListEvent){
      // List<Mood> moods = [];
      // for (int i=0; i<5; i++){
      //   moods.add(new Mood(name: 'name', pathToImg: 'pathToImg'));
      //   print(moods);
      // }
      // yield moods;
    yield _createDefaultMoodsUseCase();
    print(state.length);
    print(state.first.name);
    }
  }

}