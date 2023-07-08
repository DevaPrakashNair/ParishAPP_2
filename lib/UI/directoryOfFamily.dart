import 'package:flutter/material.dart';
import 'package:parish_app/data/model/DirectoryModel.dart';

class DOfFamily extends StatefulWidget {
  final DirectoryModel? directory;
  final int? index;
  const DOfFamily({Key? key,required this.directory,required this.index}) : super(key: key);

  @override
  _DOfFamilyState createState() => _DOfFamilyState();
}

class _DOfFamilyState extends State<DOfFamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff0098ff),
            title:Text("Members in "+widget.directory!.data![widget.index!].familyName!)
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.directory!.data![widget.index!].users!.length,
                    itemBuilder: (context, index) {
                      if(widget.directory!.data![widget.index!].users![index].phoneNumber !=null){
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Member Name ",style: TextStyle(color: Colors.blueGrey,fontSize: 20),),
                                      Text("Phone Number ",style: TextStyle(color: Colors.blueGrey ,fontSize: 20),),
                                      Text("Job                    ",style: TextStyle(color: Colors.blueGrey,fontSize: 20),textAlign: TextAlign.left,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(widget.directory!.data![widget.index!].users![index].name!,style: TextStyle(color: Colors.green,fontSize: 20),),
                                      Text(widget.directory!.data![widget.index!].users![index].phoneNumber!.toString(),style: TextStyle(color: Colors.green,fontSize: 20),),
                                      Text((widget.directory!.data![widget.index!].users![index].occupation!=null)?widget.directory!.data![widget.index!].users![index].occupation!:"Null",style: TextStyle(color: Colors.green,fontSize: 20),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(color: Colors.black,),
                          ],
                        );
                      }
                      else{
                        return SizedBox();
                      }
                    },
                  )
          ),
        );
  }
}
