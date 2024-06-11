import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:hungry_app/screens/homepage.dart';
import 'firebase_options.dart';
import 'package:hungry_app/screens/register.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 148, 112, 45),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 192, 173, 155)),
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Register(),
    );
  }
}