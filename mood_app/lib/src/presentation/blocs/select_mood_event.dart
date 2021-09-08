
import 'package:mood_app/src/domain/entities/mood.dart';

class SelectMoodEvent{
  final List<Mood>? moods;
  final int? index;

  const SelectMoodEvent({this.moods, this.index});
}

class ButtonWithMoodClickedEvent extends SelectMoodEvent{
  const ButtonWithMoodClickedEvent(List<Mood> moods, int index): super(moods: moods, index: index);
}