import 'package:flutter/material.dart';
import 'package:supabase_demo/features/auth/presentation/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


const supabaseUrl = 'https://yiautszxpcquqewxnqjp.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlpYXV0c3p4cGNxdXFld3hucWpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQxNTQ2MDgsImV4cCI6MjA2OTczMDYwOH0.mf3Sqr7v9vS6YnIX5MgxhwaTBFPA-lGJP-tIv_byszU";

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginPage(),
    );
  }
}
