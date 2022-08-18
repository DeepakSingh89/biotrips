import 'package:biotrips/route_generator.dart';
import 'package:biotrips/view/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

import 'helpers/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Biotrips',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          // brightness: Brightness.dark,
          fontFamily: 'regular',
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
              bodyColor: Colors.black,
              displayColor: Colors.black
          ),
        ),
        home: Material(
            child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Constants.height = MediaQuery.of(context).size.height;
    Constants.width = MediaQuery.of(context).size.width;
    return SplashScreen();
  }
}

