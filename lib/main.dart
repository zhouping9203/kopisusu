import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kopisusu/hometab/IndexLoanPage.dart';
import 'package:kopisusu/hometab/IndexProfilePage.dart';

import 'hometab/IndexHomePage.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,  // Material 组件本地化
        GlobalCupertinoLocalizations.delegate,  // iOS 组件本地化
        GlobalWidgetsLocalizations.delegate,   // 基础组件本地化
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Image.asset(_currentIndex == 0 ? "assets/images/homeselected.webp" : "assets/images/homeno.webp"),label: "Home"),
            BottomNavigationBarItem(icon: Image.asset(_currentIndex == 1 ? "assets/images/myloanselect.webp" : "assets/images/myloanno.webp"),label: "Loan"),
            BottomNavigationBarItem(icon: Image.asset(_currentIndex == 2 ? "assets/images/meselectt.webp" : "assets/images/meno.webp"),label: "Profile")
          ],
          activeColor: const Color(0xff123157),
          inactiveColor: const Color(0xffCCCCCC),
          currentIndex: _currentIndex,
          onTap: (index){
            if(index == 1) return;
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        tabBuilder: (context,index) {
          switch (_currentIndex) {
            case 0:
              return const IndexHomePage();
            case 1:
              return const IndexLoanPage();
            case 2:
              return const IndexProfilePage();
            default:
              return const IndexHomePage();
          }
        },
        controller: CupertinoTabController(

        ),
    );
  }
}
