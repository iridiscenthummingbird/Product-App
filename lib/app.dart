import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:product_app/di.dart';
import 'package:product_app/screens/main/main_screen.dart';

part 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DI(
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: BotToastInit(),
        onGenerateRoute: _generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
