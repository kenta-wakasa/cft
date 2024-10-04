// assuming this is the root widget of your App
import 'package:cft/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.read(goRouteProvider);

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
        textTheme: GoogleFonts.ibmPlexSansJpTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
