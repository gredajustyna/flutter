
import 'package:floor/floor.dart';
import 'package:mood_app/src/core/utils/constants.dart';

@Entity(tableName: kMoodsTableName)
class Mood {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  String name;
  String pathToImg;
  String? date;
  String? description;

  Mood({this.id, required this.name, required this.pathToImg, this.date, this.description});
}