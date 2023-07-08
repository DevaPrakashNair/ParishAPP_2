import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/directory_details.dart';
import 'package:parish_app/bloc/WardBloc.dart';

class Directory extends StatefulWidget {
  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    BlocProvider.of<WardBloc>(context).add(CheckWard());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff0098ff),
          title:Text("Directory")
      ),
      body: BlocBuilder<WardBloc,WardState>(
        builder: (context, state) {
          if(state is AllChecked){
            return ListView.builder(
                itemCount: state.ward!.user!.length,
                itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Directory_details(
                                        wardId:
                                        state.ward!.user![index].sId!,wardName: state.ward!.user![index].wardname!)));
                          },
                          child: Card(
                            color: Colors.white70,
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                  (Text(state.ward!.user![index].wardname!,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                  // child: Text(state.ward!.user![index].wardname!)
                });
        }
          else if(state is AllError){
            return Text(state.error);
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      );
  }
}