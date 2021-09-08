part of 'moods_bloc.dart';

abstract class MoodsEvent{
  final Mood? mood;
  final List<Mood>? moods;

  const MoodsEvent({this.mood, this.moods});
}

class GetMoodList extends MoodsEvent{
  const GetMoodList();
}

class AddMood extends MoodsEvent{
  const AddMood(Mood mood) : super(mood: mood);
}

