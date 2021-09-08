import 'package:flutter/material.dart';
import 'package:mood_app/src/config/routes/app_routes.dart';
import 'package:mood_app/src/config/themes/app_themes.dart';
import 'package:mood_app/src/core/utils/constants.dart';
import 'package:mood_app/src/injector.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

