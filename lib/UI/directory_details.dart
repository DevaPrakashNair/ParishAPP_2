import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/directoryOfFamily.dart';
import 'package:parish_app/bloc/directoryBloc.dart';

class Directory_details extends StatefulWidget {
  final String? wardId;
  final String? wardName;
  const Directory_details({Key? key,required this.wardId,required this.wardName}) : super(key: key);

  @override
  State<Directory_details> createState() => _DirectorydetailsState();
}

class _DirectorydetailsState extends State<Directory_details> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DirectoryBloc>(context).add(CheckDirectory(wardId: widget.wardId!));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff0098ff),
          title:Text("Families in "+widget.wardName!)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<DirectoryBloc,DirectoryState>(
            builder: (context, state) {
              if(state is DirectoryChecked){
                if(state.directoryModel.data!.length!=0){
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.directoryModel.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DOfFamily(directory: state.directoryModel,index: index,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Family Name ",style: TextStyle(color: Colors.blueGrey,fontSize: 20),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(state.directoryModel.data![index].familyName!,style: TextStyle(color: Colors.green,fontSize: 20),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(color: Colors.black,),
                        ],
                      );
                    },
                  );
                }
                else{
                  return Center(
                    child: Text(
                      "Ward is empty"
                    ),
                  );
                }
              }
              else{
                return Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
            listener:(context,state){

            }
            ),
        ),
        )
      );
  }
}
