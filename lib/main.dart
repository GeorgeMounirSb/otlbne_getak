import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlbne_getak/features/captain/captain_home/view/captain_home_screen.dart';

import 'core/helper/data_helper.dart';
import 'features/login/view/user_selection_screen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final instance = DataHelper.instance;
  await instance.get(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final instance = DataHelper.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      locale: const Locale('ar', 'EG'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.almaraiTextTheme(),
      ),
      home: instance.userType == 1 ? const CaptainHomeScreen() : const UserSelectionScreen(),
    );
  }
}