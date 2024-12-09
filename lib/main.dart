import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:password_management/view/Authentication/get_started_view.dart';
import 'package:password_management/view/Homepage/home_page.dart';
import 'package:password_management/view/main_screen.dart';
import 'package:provider/provider.dart';

import 'blockchain_servies/blochchain_service_file.dart';
import 'controller/user_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordService()),
        // Add more providers as needed
      ],
      child: const MyApp(),
    ),
  );;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GetStartedView()
    );
  }
}
