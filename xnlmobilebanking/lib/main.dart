import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xnlmobilebanking/SplashScreen.dart';
import 'package:xnlmobilebanking/providers/auth_provider.dart';
import 'package:xnlmobilebanking/screens/AccountScreen.dart';
import 'package:xnlmobilebanking/screens/DashboardScreen.dart';
import 'package:xnlmobilebanking/screens/LoginScreen.dart';
import 'package:xnlmobilebanking/screens/PaymentScreen.dart';
import 'package:xnlmobilebanking/screens/ProfileScreen.dart';
import 'package:xnlmobilebanking/screens/SignUpScreen.dart';
import 'package:xnlmobilebanking/screens/TransactionScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //checking
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
