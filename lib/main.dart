import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Providers/CategoryProvider.dart';
import 'package:wallpaperapp/Providers/SearchProvider.dart';
import 'package:wallpaperapp/Providers/WallProvider.dart';
import 'package:wallpaperapp/Screens/HomePage.dart';

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
        ChangeNotifierProvider<WallpaperProvider>(create: (context) => WallpaperProvider(),),
        ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
