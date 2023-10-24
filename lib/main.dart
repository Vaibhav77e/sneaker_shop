import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/admin_screen/admin.dart';
import './models/cart.dart';
import 'pages/EntryScreen/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'services/shoerepo/shoes_repo.dart';
// import 'package:sneaker_shop/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoeRepo()),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
