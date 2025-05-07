import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_sample/firebase_options.dart';
import 'package:firestore_sample/user.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final db = FirebaseFirestore.instance;
  int _counter = 0;

  Future<void> saveUser(User user) async {
    try {
      final doc = await db.collection('users').add(user.toJson());
      print('保存しました: ${doc.id}');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<User>> getUsers() async {
    List<User> users = List.empty(growable: true);
    final querySnapshot = await db.collection('users').get();
    for (var doc in querySnapshot.docs) {
      users.add(User.fromJson(doc.data()));
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Add User'),
              onPressed: () {
                saveUser(User(name: "Sample Name"));
              },
            ),
            ElevatedButton(
              child: Text('Load Users'),
              onPressed: () async {
                final users = await getUsers();
                print(users);
              },
            ),
          ],
        ),
      ),
    );
  }
}
