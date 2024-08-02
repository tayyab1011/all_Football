import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManOfTheMatch extends StatefulWidget {
  const ManOfTheMatch({super.key});

  @override
  State<ManOfTheMatch> createState() => _ManOfTheMatchState();
}

class _ManOfTheMatchState extends State<ManOfTheMatch> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      FirebaseFirestore.instance.collection('man').orderBy('index').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Man Of Match',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.grey.shade100,
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Team1',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Team2',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Text('Man of Match',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                ],
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 98,
                              child: Text(
                                snapshot.data!.docs[index]['team1'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: SizedBox(
                                width: 90,
                                child: Text(
                                  snapshot.data!.docs[index]['team2'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 98,
                              child: Text(
                                snapshot.data!.docs[index]['man'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
