import 'package:all_football/main_screen.dart';
import 'package:all_football/man_of_the_match.dart';
import 'package:flutter/material.dart';

import 'most_runs.dart';
import 'most_sixes.dart';
import 'most_wickets.dart';

class League extends StatefulWidget {
  const League({super.key});

  @override
  State<League> createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey.shade300,
        title: const Text(
          'League Info',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),


      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 195,
            child: Image.asset("assets/images/psl.png"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                       MaterialPageRoute(builder: (context) => const MostRuns()));
                  },
                  child: Container(
                    margin:const EdgeInsets.only(top: 55, right: 15),
                    width: 120,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/score.png',
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
                                "Most Runs",
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
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  MostSixes()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 55, left: 20),
                      width: 120,
                      height: 100,
                      child: Material(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset('assets/images/cricket_ball.png'),
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
                                  "Most Sixes",
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MostWickets()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40,),
                  width: 120,
                  height: 100,
                  child: Material(
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child:
                            Image.asset('assets/images/wicket.png'),
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
                              "Most Wickets",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
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
                onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ManOfTheMatch()));
                },
                child: Container(
                   margin:const EdgeInsets.only(top: 40, left: 35),
                  width: 120,
                  height: 100,
                  child: Material(
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child:
                            Image.asset('assets/images/score.png'),
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
                              "Man of Match",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
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

        ],
      ),
    );
  }
}
