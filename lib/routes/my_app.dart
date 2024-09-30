// assuming this is the root widget of your App
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auto_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
        textTheme: GoogleFonts.ibmPlexSansJpTextTheme(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
