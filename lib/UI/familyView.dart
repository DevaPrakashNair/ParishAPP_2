import 'package:flutter/material.dart';
import 'package:parish_app/UI/userdetails.dart';

import '../data/model/ProfileModel.dart';

class FamilyView extends StatefulWidget {
  final int? index;
  final ProfileModel? profile;
  const FamilyView({Key? key,required this.index,required this.profile}) : super(key: key);

  @override
  _FamilyViewState createState() => _FamilyViewState();
}

class _FamilyViewState extends State<FamilyView> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family details"),
        backgroundColor: Color(0xff0098ff),
      ),
      body:SingleChildScrollView(
        child: Column(children: [
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
            height: 80,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.person)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        (widget.profile!.data![widget.index!].name =="")?
                            "Null":widget.profile!.data![widget.index!].name!
                        ,
                        style: TextStyle(
                          fontSize: 22.0, color: Colors.black,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.home)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        (widget.profile!.data![widget.index!].emailId =="")?
                        "Null":widget.profile!.data![widget.index!].emailId!,
                        style: TextStyle(
                          fontSize: 22.0, color: Colors.black,
                          // letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child: Container(
                    height: 30,
                    width: 40,
                    child: Icon(Icons.supervised_user_circle_rounded)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Ward",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        (widget.profile!.data![widget.index!].wardId ==null)?
                        "Null":widget.profile!.data![widget.index!].wardId!,
                        style: TextStyle(
                          fontSize: 22.0, color: Colors.black,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.phone)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        (widget.profile!.data![widget.index!].phoneNumber ==null)?
                        "Null":widget.profile!.data![widget.index!].phoneNumber!.toString(),
                        style: TextStyle(
                          fontSize: 22.0, color: Colors.black,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if(widget.index !=0)...[
            Align(
              alignment: Alignment.bottomRight,
              child: RawMaterialButton(
                onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Userdetails(index: widget.index!,profile: widget.profile!)));
                },
                elevation: 10,
                fillColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  size: 30.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            )
            // Center(
            //   child: MaterialButton(
            //     onPressed: (){
            //       Navigator.push(context,MaterialPageRoute(builder: (context)=>Userdetails(index: widget.index!,profile: widget.profile!)));
            //     },
            //     child: Text(
            //         "Edit"
            //     ),
            //     color: Colors.green,
            //   ),
            // )
          ]
          else...[
            SizedBox()
          ]
        ]),
      ),
    );
  }
}
