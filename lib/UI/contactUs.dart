import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/location.dart';

import '../bloc/without_login.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  void initState() {
    super.initState();
    BlocProvider.of<WithoutLogin>(context).add(CheckDisplay());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff0098ff),
              title: Text(
                'Contact Us',
                style: TextStyle(color: Colors.white),
              ),
            ),

            body: BlocBuilder<WithoutLogin, DisState>(
                builder: (context, state) {
                  if (state is DisplayChecked) {
                    return SingleChildScrollView(

                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Color(0xff0098ff),
                                  // ),
                                  borderRadius: const BorderRadius.all(Radius
                                      .circular(12)),

                                ),

                                child: Container(
                                  height: 170,
                                  width: 400,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      Text(
                                        "Address\n",
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Row(
                                        children: [
                                          Text('\t\t\t\t\t\t\t\t\t\t\t\t\t'),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.locality!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                          Text(','),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.streetAddress!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('\t\t\t\t\t\t\t\t\t\t\t\t\t'),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.streetAddress!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ), Text(','),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.city!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('\t\t\t\t\t\t\t\t\t\t\t\t\t'),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.district!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ), Text(','),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.pincode!
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('\t\t\t\t\t\t\t\t\t\t\t\t\t'),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.state!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ), Text(','),
                                          Text(
                                            state.w_loginModel!.user![0]
                                                .parishAddress!.country!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),


                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    // side: BorderSide(
                                    //   color: Color(0xff0098ff),
                                    // ),
                                    borderRadius: const BorderRadius.all(Radius
                                        .circular(12)),

                                  ),

                                  child: Container(
                                    height: 70,
                                    width: 400,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          state.w_loginModel!.user![0].email!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),

                                      ],
                                    ),
                                  )
                              ),
                              SizedBox(height: 5,),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Color(0xff0098ff),
                                  // ),
                                  borderRadius: const BorderRadius.all(Radius
                                      .circular(12)),

                                ), child: Container(
                                height: 70,
                                width: 400,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(
                                      "Office/Vicar: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      state.w_loginModel!.user![0].email!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),

                                  ],
                                ),
                              ),
                              ),

                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Color(0xff0098ff),
                                  // ),
                                  borderRadius: const BorderRadius.all(Radius
                                      .circular(12)),

                                ), child: Container(
                                height: 70,
                                width: 400,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(
                                      "Contact No. : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      state.w_loginModel!.user![0].phone!.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),

                                  ],
                                ),
                              ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Card(

                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Color(0xff0098ff),
                                  // ),
                                  borderRadius: const BorderRadius.all(Radius
                                      .circular(12)),

                                ), child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => MapSample()));
                                },
                                  child: Container(

                                  height: 70,
                                  width: 400,
                                  child:

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(100, 21, 0, 0),
                                        child: Text(
                                          "View Palampara Church ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20),
                                          ),
                                      ),

                                  ),
                                ),
                              ),



                            ]));
                  } else if (state is DisplayError) {
                    return Text(state.error);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
    );
  }
}


