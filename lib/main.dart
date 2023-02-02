import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:master/Screens/Home.dart';

import 'package:master/Screens/Welcome.dart';
import 'package:master/Screens/demo.dart';
import 'package:master/Screens/login.dart';




 Future <void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      name: 'flutter',
      options:FirebaseOptions(
          apiKey: "AIzaSyAdOs080q_fMZ3sc5Pgj-i4RMhYO051s2M",
          authDomain: "somaster-af5d3.firebaseapp.com",
          projectId: "somaster-af5d3",
          storageBucket: "somaster-af5d3.appspot.com",
          messagingSenderId: "919597937899",
          appId: "1:919597937899:web:11c99060b098a991307aae",
          measurementId: "G-FVDN9593H1"
      )
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('es'),
        const Locale('de'),
        const Locale('fr'),
        const Locale('el'),
        const Locale('et'),
        const Locale('nb'),
        const Locale('nn'),
        const Locale('pl'),
        const Locale('pt'),
        const Locale('ru'),
        const Locale('hi'),
        const Locale('ne'),
        const Locale('uk'),
        const Locale('hr'),
        const Locale('tr'),
        const Locale('lv'),
        const Locale('lt'),
        const Locale('ku'),
        const Locale('nl'),
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates:[
        CountryLocalizations.delegate,
      ],
      home: demo(),
      // home: FirebaseAuth.instance.currentUser==null?welcome():Home(),
    );
  }
}


