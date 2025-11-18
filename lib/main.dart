import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:menu_app/model/shop.dart';
import 'package:menu_app/pages/cart.dart';
import 'package:menu_app/pages/favourite.dart';
import 'package:menu_app/pages/intro_page.dart';
import 'package:menu_app/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favouriteBox');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => Cart(),
        '/favouritepage': (context) => Favourite(),
      },
    );
  }
}
