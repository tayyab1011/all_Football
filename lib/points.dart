import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {

  Reference ref = FirebaseStorage.instance.ref().child('Capture.png');
 late String imageUrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl='';
    getImage();
  }
  Future<void> getImage()async {
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Points Table',
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
        child:imageUrl.isEmpty?const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              const SizedBox(height: 1,),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  child: Image.network(imageUrl,fit: BoxFit.fill,height: 275,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
