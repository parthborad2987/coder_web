import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/splashscreen.dart';
import 'provider/theme changer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemChanger(),),
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemChanger>(context);

          return MaterialApp(
            themeMode: themeChanger.themeMode,
            debugShowCheckedModeBanner: false,
            title: 'Coder Web',
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Splashscreen(),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              primaryColor: Colors.purple,
            ),
          );
        },),
    );
  }
}

