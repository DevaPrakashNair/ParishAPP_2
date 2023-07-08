import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parish_app/UI/pass_change.dart';

import '../bloc/LoginBloc.dart';
import '../bloc/tokenMangerbloc.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var phoneController = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0098ff),
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Color(0xff6889AB), fontSize: 15),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 290,
              height: 44,
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(CheckOTP(
                      phone: phoneController.text,
                      otpNumber: passwordcontroller.text));
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                },
                color: Color(0xff0098ff),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is CheckingOtp) {
                      return CircularProgressIndicator(
                        color: Colors.white,
                      );
                    } else {
                      return Text(
                        "Log in",
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is OtpChecked) {
                      Fluttertoast.showToast(msg: "Login successful");
                      context.read<TokenManagerBloc>().id=state.loginModel.data!.id!;
                      if (state.loginModel.data?.ispasswordChanged == true) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Page()),
                                (Route<dynamic> route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PassChange(phone: phoneController.text,)),
                                (Route<dynamic> route) => false);
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PassChange()));
                      }
                    } else if (state is OtpError) {
                      Fluttertoast.showToast(
                        msg: state.error,
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),

          ],
        ),
      ),
    );
  }
}