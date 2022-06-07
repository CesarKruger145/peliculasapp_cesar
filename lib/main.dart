import 'package:flutter/material.dart';
import 'package:peliculasapp_cesar/providers/movies_providers.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProviders(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'peliculas',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreens(),
          'detalles': (_) => DetallesScreens()
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Colors.indigo),
        ));
  }
}
