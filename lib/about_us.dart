import 'package:all_football/main_screen.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<StatefulWidget> createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
        title: const Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/Huzaifa pf.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: const Text(
                  "Huzaifa Malik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1),
                child: const Text(
                  "Android Developer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 0),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(color: Colors.black38, height: 20),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 25.0,
                                ),
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                          'assets/images/telephone.png'),
                                    ),
                                    InkWell(
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                          child: const Text(
                                            "+923040078017",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 21),
                                          )),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                      child: const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage('assets/images/new.png'),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5.0, bottom: 25),
                                      child: const Text("huzaifallc20@gmail.com",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 21)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
