part of 'moods_bloc.dart';

abstract class MoodsState {
  final List<Mood>? moodsList;

  const MoodsState({this.moodsList});
}

class MoodsListLoading extends MoodsState{
  const MoodsListLoading();
}

class MoodsListDone extends MoodsState{
  const MoodsListDone(List<Mood> moods) : super(moodsList: moods);
}