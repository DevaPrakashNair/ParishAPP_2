import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parish_app/UI/family.dart';
import 'package:parish_app/UI/ward.dart';
import 'package:parish_app/bloc/tokenMangerbloc.dart';
import '../bloc/profileBloc.dart';
import '../helper/sharedpreferences.dart';
import 'Aboutus.dart';
import 'Login.dart';
import 'contactUs.dart';
import 'directory.dart';
import 'home_page.dart';

class OutDrawer {
  Widget build(BuildContext context, setState) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: Drawer(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff0098ff).withOpacity(0.9)
              ),
                child: BlocBuilder<ProfileBloc,ProfileState>(builder: (context, state){
                  if(state is ProfileChecked){
                    context.read<TokenManagerBloc>().name=state.profileModel!.data![0].name!;
                    print(context.read<TokenManagerBloc>().name);
                    return Center(
                      child:
                      Text(
                        "Hello "+state.profileModel!.data![0].name!,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                      ,
                    );
                  }
                  else {
                    return Center(
                      child: Text("Hello there!",
                        style: TextStyle(color: Colors.white, fontSize: 30),),
                    );
                  }

                })
            ),
            home(context),
            if (context.read<TokenManagerBloc>().token == null) ...[
              logIn(context), //LogIn
            ] else ...[
              Divider(),
              wardDetail(context),
              Divider(),
              directory(context),
              Divider(),
              add_family(context),
            ],
            Divider(),
            aboutUs(context), //About Us
            Divider(),
            contactUs(context), //Contact Us
            if (context.read<TokenManagerBloc>().token != null) ...[
              Divider(),
              InkWell(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    //backgroundColor: Color(0xff0098ff),
                    title: const Text('Log out'),
                    content: const Text('Do you want to log out?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'No',
                          //style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          TempStorage.clearToken();
                          context.read<TokenManagerBloc>().token = null;
                          setState(() {});
                          //Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_Page()),
                              (Route<dynamic> route) => false);
                          Fluttertoast.showToast(msg: "Logged out");
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.logout),
                          SizedBox(width: 10,),
                          Text(
                            "Logout",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

Widget contactUs(BuildContext context) {
  //Contact US
  return Column(
    children: [
      InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactUs()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.contact_phone),
                  SizedBox(width: 10,),
                  Text(
                    "Contact Us",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      )
    ],
  );
}

Widget aboutUs(BuildContext context) {
  //About Us
  return Column(
    children: [
      InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Aboutus()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.admin_panel_settings ),
                  SizedBox(width: 10,),
                  Text(
                    "About Us",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}

Widget logIn(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Divider(),
      InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.login),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log In",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),


                ],
              )),
        ),
      )
    ],
  );
}

Widget home(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home_Page()),
              (Route<dynamic> route) => false)
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Home",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}

Widget wardDetail(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Ward()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.connect_without_contact ),
                  SizedBox(width: 10,),
                  Text(
                    "Ward",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}

Widget directory(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Directory()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.local_phone_sharp ),
                  SizedBox(width: 10,),
                  Text(
                    "Directory",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}

Widget add_family(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Family()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.group_add),
                  SizedBox(width: 10,),
                  Text(
                    "Family",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}
