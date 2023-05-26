import 'package:flutter/material.dart';
import 'package:untitled2/all_screen.dart';
import 'package:untitled2/movie_screen.dart';
import 'package:untitled2/mxshorts.dart';
import 'package:untitled2/mxvideos.dart';
import 'package:untitled2/newandFree_screen.dart';
import 'package:untitled2/show_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/bottomnavBar.dart';
import 'package:untitled2/gold.dart';
import 'package:untitled2/login.dart';
import 'package:untitled2/signup.dart';
import 'live.dart';
import 'local.dart';
import 'mxtube.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(),
      home: Login_screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedindex = 1;

  var screens = [Local(),MyHomePage(),live(),mxtube(),gold()];
  void onitemtapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.black,

          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                       Image.asset(
                        "images/Mx_logo.png.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          "MX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          //     Text("MX",style: GoogleFonts.oswald(),
                        ),
                        Text(
                          "PLAYER",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),

                  ]
                  ),
                  Row(
                    children: [
                      // Text("search",style:GoogleFonts.oswald(),),
                        Image.asset(
                          "images/bell.png",height: 25,width: 25,color: Colors.white
                        ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/search.png",height: 25,width: 25,color: Colors.white,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                      "images/profile-user.png",height: 25,width: 25,color: Colors.white),
                      // const SizedBox(width: 25,),
                    ],
                  )

                  ]
            ),
            ),
            elevation: 0,
            bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: "SHOWS",
                  ),
                  Tab(text: "MOVIES"),
                  Tab(text: "NEW & FREE🔥"),
                  Tab(text: "MX VIDEOS"),
                  Tab(text: "MX SHORTS"),
                ]),
          ),
          body:

          const TabBarView(children: [
            all_screen(),
            Show_screen(),
            Movie_screen(),
            newandFree_screen(),
            mxvideos(),
            mxshorts(),
            // local(),
          ]),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(icon: Column(
          //       children: [
          //         Icon(Icons.folder),
          //       ],
          //     ),label:"Local"),
          //   ],
          // ),
        ),
    );
  }
}
