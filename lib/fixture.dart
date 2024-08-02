import 'package:all_football/squad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'main_screen.dart';

class Fixture extends StatefulWidget {
  const Fixture({super.key});

  @override
  State<StatefulWidget> createState() => _Fixture();
}

class _Fixture extends State<Fixture> with TickerProviderStateMixin {

  int selectedCity = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      milliseconds: 3000,
    ),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = db.collection('teams').snapshots();
  }
  
  @override
  void dispose() {
    _controller.dispose();  // Make sure to dispose of the controller
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teams',
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
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SpinKitFadingCircle(
              controller: _controller,
              size: 50,
              color: Colors.black,
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Squad(teamName: snapshot.data!.docs[index]['name'],)));
                      },
                      child: Card(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            Image.network(
                              snapshot.data!.docs[index]['image'],
                              width: 130,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(16),
                                          bottomLeft: Radius.circular(16)),
                                      color: Colors.green,
                                    ),
                                    child: Text(
                                      snapshot.data!.docs[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
