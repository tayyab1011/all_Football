import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class MostSixes extends StatefulWidget {
  const MostSixes({super.key});

  @override
  State<MostSixes> createState() => _MostSixesState();
}

class _MostSixesState extends State<MostSixes> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<String> categoryList = [
    "Player",
    'Match',
    'Inn',
    'Sixes',

  ];

  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = db.collection('sixes').orderBy('index').snapshots();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Most Sixes', style: TextStyle(color: Colors.black),),
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
                  Text('Sixes',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),



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
                                      snapshot.data!.docs[index]['player'],
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
                                    width: 65,
                                    child: Text(
                                      snapshot.data!.docs[index]['sixes'],
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
      )
    );
  }
}
