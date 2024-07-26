import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MostRuns extends StatefulWidget {
  const MostRuns({super.key});

  @override
  State<MostRuns> createState() => _MostRunsState();
}

class _MostRunsState extends State<MostRuns> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  final List<String> categoryList = [
    "Player",
    'Match',
    'Inn',
    'Runs',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = db.collection('runs').orderBy('index').snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Most Runs',
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
                  Text('Player',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                  Text('Match',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                  Text('Inns',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                  Text('Runs',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                ],
              ),
            ),
          ),

          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
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
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 98,
                                    child: Text(
                                      snapshot.data!.docs[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      snapshot.data!.docs[index]['match'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 98,
                                    child: Text(
                                      snapshot.data!.docs[index]['inn'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                  width: 62,
                                    child: Text(
                                      snapshot.data!.docs[index]['runs'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}
