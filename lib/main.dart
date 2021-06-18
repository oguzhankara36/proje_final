import 'package:firebase/api/albums_view.dart';
import 'package:firebase/cinsiyet_erkek/balik_erkek.dart';
import 'package:firebase/erkek/erkek_animasyon.dart';
import 'package:firebase/fire_base/auth_type_selector.dart';
import 'package:firebase/fire_base/home_page.dart';
import 'package:firebase/grafik/grafikk.dart';
import 'package:firebase/login_fancy/fancy.dart';
import 'package:firebase/sqlite/sqlite_sayfam.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

/// Uygulamanın başlangıç noktası.
/// Bir [Material App] döndürür.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OĞUZHAN KARA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthTypeSelector(),
    );
  }
}
