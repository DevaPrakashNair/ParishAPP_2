import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/familyView.dart';
import 'package:parish_app/bloc/profileBloc.dart';
import 'addFamily.dart';

class Family extends StatefulWidget {
  @override
  _FamilyState createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  void initState() {
    super.initState();
    setState(() {
      BlocProvider.of<ProfileBloc>(context).add(CheckProfile());
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff0098ff),
            title:Text("Family")
        ),

        body:BlocBuilder<ProfileBloc,ProfileState>(builder: (context,state){
          if(state is ProfileChecked){
            return GridView.builder(
              shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30
                ),
                itemCount: state.profileModel!.data!.length+1,

                itemBuilder: (BuildContext ctx, int index) {
                  if(index!=state.profileModel!.data!.length){
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>FamilyView(index:index,profile: state.profileModel!,)));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius:25,
                                  child: Icon(Icons.person,size: 40,),
                                  backgroundColor: Color(0xff0098ff),
                                  foregroundColor: Colors.white,
                                ),
                                Text((state.profileModel!.data![index].name =="")?"Null":state.profileModel!.data![index].name!)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  else{
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>AddFamily(profile: state.profileModel!,)));
                          },

                          child: Column(
                            children: [
                              CircleAvatar(
                                radius:25,
                                child: Icon(Icons.add,size: 50,),
                                backgroundColor: Color(0xff0098ff),
                                foregroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }
            );
          }
          else if(state is ProfileError){
            return Text(state.error);
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ),
    );
  }
}