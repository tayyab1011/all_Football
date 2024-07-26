import 'package:all_football/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<StatefulWidget> createState() => _Schedule();
}

class _Schedule extends State<Schedule> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(
        milliseconds: 3000,
      ),
      vsync: this)
    ..repeat();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = db.collection('schedule').orderBy('time').snapshots();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            "Schedule",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainScreen()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
        ),
        body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SpinKitFadingCircle(
                  controller: _controller, color: Colors.black, size: 50);
            } else {
              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['time'],
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14.5),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Image.network(
                                              snapshot.data!.docs[index]
                                                  ['image1'],
                                              width: 60,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['team1'],
                                              style: const TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['score1'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 17.5,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['overs1'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              snapshot.data!.docs[index]
                                                  ['versus'],
                                              style: const TextStyle(
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['score2'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 17.5,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['overs2'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                snapshot.data!.docs[index]
                                                    ['image2'],
                                                width: 60),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['team2'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Text(
                                            snapshot.data!.docs[index]['win'],
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 15)),
                                      ),
                                      Text(snapshot.data!.docs[index]['match'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
            }
          },
        ));
  }
}
