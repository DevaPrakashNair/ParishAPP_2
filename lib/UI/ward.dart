import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/ward_display.dart';
import 'package:parish_app/bloc/WardBloc.dart';

class Ward extends StatefulWidget {
  @override
  _WardState createState() => _WardState();
}

class _WardState extends State<Ward> {
  void initState() {
    super.initState();
    BlocProvider.of<WardBloc>(context).add(CheckWard());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0098ff),
        title: Text("Ward"),
      ),
      body: BlocBuilder<WardBloc, WardState>(builder: (context, state) {
        if (state is AllChecked) {
          return ListView.builder(
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,4.0,8.0,4.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute (builder:(context)=>Ward_display(ward: state.ward!,index: index,)));},

                      child: Card(

                        color: Colors.white70,
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.09,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.church,
                                size: 22,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              (

                                  Text(state.ward!.user![index].wardname!,style: TextStyle(color: Colors.black, fontSize: 18 ))
                              ),
                            ],
                          ),
                        ),


                      ),
                    ),
                  ),],);
              });
        } else if (state is AllError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xff0098ff),
            ),
          );
        }
      }),
      // body: ListView.builder(
      //     itemCount: 9,
      //     itemBuilder: (BuildContext context,int index){
      //       return ListTile(
      //           leading: Icon(Icons.list),
      //           title: (Text("ward $index")),

      //       );
      //     }
      // ),
    );
  }
}
