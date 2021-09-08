import 'package:flutter/material.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/presentation/views/add_mood_view.dart';
import 'package:mood_app/src/presentation/views/mood_details_view.dart';
import 'package:mood_app/src/presentation/views/moods_list_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(AddMoodView());
      case'/diary':
        return _materialRoute(MoodListView());
      case '/details':
        return _materialRoute(MoodDetailsView(mood: settings.arguments as Mood));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}