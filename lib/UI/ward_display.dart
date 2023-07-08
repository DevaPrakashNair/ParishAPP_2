import 'package:flutter/material.dart';

import '../data/model/WardModel.dart';

class Ward_display extends StatefulWidget {
  final WardModel? ward;
  final int? index;
  const Ward_display({Key? key,required this.ward,required this.index}) : super(key: key);

  @override
  State<Ward_display> createState() => _Ward_displayState();
}

class _Ward_displayState extends State<Ward_display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0098ff),
        title: Text("Ward Details"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            child: Container(
              alignment: Alignment(0.0, 2.5),
              child: CircleAvatar(
                backgroundColor: Color(0xff0098ff),
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
                //backgroundImage: AssetImage("assete/c3.JPG"),
                radius: 70.0,
              ),
            ),
          ),
          SizedBox(
            width: 20,
            height: 70,
          ),
          Text("Patron: "+widget.ward!.user![widget.index!].patreon!,style: TextStyle(
            fontSize: 22.0, color: Colors.black,),),
          SizedBox(
            width: 20,
            height: 40,
          ),
          Text("Ward Name: "+widget.ward!.user![widget.index!].wardname!,style: TextStyle(
            fontSize: 22.0, color: Colors.black,),),
        ],
      ),
    );
  }
}
