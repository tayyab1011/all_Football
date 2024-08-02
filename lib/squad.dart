import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'fixture.dart';

class Squad extends StatefulWidget {
  final teamName;

  const Squad({super.key, this.teamName});

  @override
  State<Squad> createState() => _SquadState();
}

class _SquadState extends State<Squad> with TickerProviderStateMixin {
  
  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      milliseconds: 4000,
    ),
    vsync: this,
  )
    ..repeat();
  int selectedIndex = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    
    super.initState();
    stream = db
        .collection('squad')
        .where(
      'team',
      isEqualTo: widget.teamName,
    )
        .snapshots();
  }

  @override
  void dispose() {
    _controller.dispose();  // Make sure to dispose of the controller
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.teamName,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Fixture()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
            child: TextFormField(
              onChanged: (value){
                setState(() {
                });
              },
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                hintText: 'Search Player',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21)
                )
              ),
            ),
          ),
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SpinKitFadingCircle(
                    controller: _controller,
                    size: 50,
                    color: Colors.black,
                  );
                } else {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          String name = snapshot.data!.docs[index]['name'];
                          if(searchController.text.isEmpty){
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 9,),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: snapshot.data!.docs[index]['image'].isEmpty? const CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 28,
                                  child: Icon(Icons.person,size: 40),): CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['image'],
                                  ),
                                  radius: 28,),
                                title: Text(
                                    (snapshot.data!.docs[index]['name']),
                                    style: const TextStyle(fontSize: 19)),
                                subtitle: Text(
                                    (snapshot.data!.docs[index]['position']),
                                    style: const TextStyle(fontSize: 15)),
                              ),
                            );
                          }
                          else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 9,),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: snapshot.data!.docs[index]['image'].isEmpty? const CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 28,
                                  child: Icon(Icons.person,size: 40),): CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['image'],
                                  ),
                                  radius: 28,),
                                title: Text(
                                    (snapshot.data!.docs[index]['name']),
                                    style: const TextStyle(fontSize: 19)),
                                subtitle: Text(
                                    (snapshot.data!.docs[index]['position']),
                                    style: const TextStyle(fontSize: 15)),
                              ),
                            );
                          }
                          else{
                            return Container();
                          }
                        },
                      ));
                }
              })
        ],
      ),
    );
  }
}
