import 'package:get_it/get_it.dart';
import 'package:mood_app/src/core/utils/constants.dart';
import 'package:mood_app/src/data/datasources/local/app_database.dart';
import 'package:mood_app/src/data/repositories/moods_repository_impl.dart';
import 'package:mood_app/src/domain/repositories/moods_repository.dart';
import 'package:mood_app/src/domain/usecases/add_mood_usecase.dart';
import 'package:mood_app/src/domain/usecases/create_default_moods_usecase.dart';
import 'package:mood_app/src/domain/usecases/get_mood_list_usecase.dart';
import 'package:mood_app/src/domain/usecases/select_mood_from_list_usecase.dart';
import 'package:mood_app/src/presentation/blocs/default%20list/default_list_bloc.dart';
import 'package:mood_app/src/presentation/blocs/moods_bloc.dart';
import 'package:mood_app/src/presentation/blocs/select_mood_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async{
  //Database
  final database = await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);
  
  injector.registerSingleton<MoodsRepository>(MoodsRepositoryImpl(injector()));

  injector.registerSingleton<GetMoodListUseCase>(GetMoodListUseCase(injector()));
  injector.registerSingleton<AddMoodUseCase>(AddMoodUseCase(injector()));
  injector.registerSingleton<SelectMoodFromListUseCase>(SelectMoodFromListUseCase(injector()));
  injector.registerSingleton(CreateDefaultMoodsUseCase(injector()));


  //Bloc
  injector.registerFactory<MoodsBloc>(() => MoodsBloc(injector(), injector()));

  //Bloc
  injector.registerFactory<DefaultListBloc>(() => DefaultListBloc(injector()));

  //Bloc
  injector.registerFactory<SelectMoodBloc>(() => SelectMoodBloc(injector()));

}