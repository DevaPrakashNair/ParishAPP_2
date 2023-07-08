import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Color(0xff0098ff),

      ),
      body:Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Administration",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900))),
             SizedBox(
              width: 200.0,
              height: 200.0,
             ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
