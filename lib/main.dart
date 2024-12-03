import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_card/src/features/login/presentation/views/login.view.dart';
import 'package:shop_card/src/injectors/injector.dart';

GetIt sl = GetIt.instance;

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
