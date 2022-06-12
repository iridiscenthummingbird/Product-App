part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case MainScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const MainScreen(),
      );
    default:
      throw ArgumentError.value(settings.name, 'settings.name', 'Unsupported route');
  }
}
