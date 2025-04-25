import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subwise/providers/subscription_provider.dart';
import 'models/subscription.dart';
import 'screens/home_screen.dart';
import 'services/db_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Needed for DB operations

  // Ensure DB file is copied and ready
  await DBService.instance.database;

  runApp(
    ChangeNotifierProvider(
      create: (_) => SubscriptionProvider()..loadSubscriptions(), // 👈 load data at startup
      child: const SubwiseApp(),
    ),
  );
}

class SubwiseApp extends StatelessWidget {
  const SubwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subwise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // 👈 Navigate directly here
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
