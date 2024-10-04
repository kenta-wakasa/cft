import 'package:cft/firebase_options.dart';
import 'package:cft/routes/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}
