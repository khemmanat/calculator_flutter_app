import 'package:flutter/cupertino.dart';
import 'package:calculator_flutter_app/src/pages/pages.dart';

class AppRoute {
  // set route for homepage
  static const home = 'home';

  get getAll => <String, WidgetBuilder>{
        // HOMEPAGE
        home: (BuildContext context) => const HomePage(),
      };
}
