import 'package:all_football/about_us.dart';
import 'package:all_football/points.dart';
import 'package:flutter/material.dart';
import 'package:all_football/schedule.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'fixture.dart';
import 'league_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future(() => false);
      },

      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.grey.shade300,
          title: const Text(
            "PSL 2024",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade300,
                width: double.infinity,
                height: 193,
                child: Image.asset("assets/images/psl.png"),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Schedule()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 32, left: 65),
                      width: 110,
                      height: 90,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Image.asset(
                                  'assets/images/icon_schedule.png',
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.green,
                              ),
                              width: 190,
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "Schedule",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Fixture()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30, left: 40),
                        width: 110,
                        height: 90,
                        child: Material(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Image.asset(
                                      'assets/images/icon_team.png'),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  color: Colors.green,
                                ),
                                width: 190,
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    "Squad",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Points()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 40, left: 65),
                      width: 110,
                      height: 90,
                      child: Material(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child:
                                    Image.asset('assets/images/points.png'),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.green,
                              ),
                              width: 190,
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "Points Table",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => League()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 40, left: 40),
                      width: 110,
                      height: 90,
                      child: Material(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child:
                                    Image.asset('assets/images/league.png'),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.green,
                              ),
                              width: 190,
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "League Info",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 40, left: 65),
                        width: 110,
                        height: 90,
                        child: Material(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Image.asset(
                                        'assets/images/icon_info.png')),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  color: Colors.green,
                                ),
                                width: 190,
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    "About Us",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 40, left: 40),
                      width: 110,
                      height: 90,
                      child: Material(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Image.asset(
                                    'assets/images/icon_send.png'),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.green,
                              ),
                              width: 190,
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "Share",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
