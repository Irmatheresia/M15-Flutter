import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan%2015/imagepicker.dart';
import 'package:flutter_application_1/pertemuan%2015/pertemuan15provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Pertemuan15Provider>(
              create: (_) => Pertemuan15Provider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pertemuan15Screen(),
    );
  }
}
