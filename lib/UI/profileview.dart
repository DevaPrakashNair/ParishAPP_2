import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/ChangePassWordWithPhoneNo.dart';
import 'package:parish_app/bloc/profileBloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void initState() {
    super.initState();
    //BlocProvider.of<ProfileBloc>(context).add(CheckProfile());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Profile", style: TextStyle(fontWeight: FontWeight.w800)),
              MaterialButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PassWithPhone()));
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 10,
                color: Colors.red,
                child: Text("Change password",style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),),
              )
            ],
          ),
          backgroundColor: Color(0xff0098ff),

        ),
        body: SafeArea(

            child:SingleChildScrollView(
              child: BlocBuilder<ProfileBloc,ProfileState>(builder: (context, state){
                if(state is ProfileChecked){
                  return Container(
                    child: Column(
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
                                    state.profileModel!.data![0].name!,
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
                                    state.profileModel!.data![0].emailId!,
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
                                    state.profileModel!.familyDetails!.wardId!.wardname!,
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
                                    state.profileModel!.data![0].phoneNumber!.toString(),
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
                        width: 10,
                        height: 20,
                      ),

                    ]),
                  );
                }
                else if(state is ProfileError){
                  return Center(
                    child: Text(state.error),
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            )

        )
    );
  }
}
