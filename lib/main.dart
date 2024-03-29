import 'package:brain_stacks/screens/screens.dart';
import 'package:brain_stacks/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: AuthService().authChanges,
          initialData: null,
        ),
        Provider<CardStackService>(create: (_) => CardStackService()),
      ],
      child: MaterialApp(
        title: GlobalService.title,
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          TopicsScreen.routeName: (context) => TopicsScreen(),
        },
        theme: ThemeData(
          fontFamily: 'Open Sans',
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.black87,
          ),
          primaryColor: Colors.deepPurpleAccent,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 18),
            bodyText2: TextStyle(fontSize: 16),
            button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
            headline1: TextStyle(fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.grey),
          ),
          buttonTheme: ButtonThemeData(
            height: 100.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 50.0,
            ),
          ),
          cardTheme: CardTheme(
            elevation: 12.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
