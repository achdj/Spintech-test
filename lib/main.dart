import 'package:flutter/material.dart';
import 'package:spintech/controller/item_controller.dart';
import 'package:spintech/utils/routes/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpinTech test',
        initialRoute: '/on_boarding',
        routes: AppRoute.allRoutes,
        home: const Text('Flutter Demo Home Page'),
      ),
    );
  }
}