import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parish_app/UI/home_page.dart';
import 'package:parish_app/bloc/passChangeBloc.dart';

class PassChange extends StatefulWidget {
  final String? phone;
  const PassChange({Key? key,required this.phone}) : super(key: key);

  @override
  _PassChangeState createState() => _PassChangeState();
}

class _PassChangeState extends State<PassChange> {
  var pass1 = TextEditingController();
  var pass2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change password", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff0098ff),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: pass1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New password',
                ),
              ),
            ),
            Padding(

              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: pass2,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
                ),
              ),
            ),
            Divider(),
            Center(
              child: MaterialButton(
                onPressed: () {
                  if (pass1.text == pass2.text && (pass1.text.length >= 4 && pass1.text.length < 16)) {
                    BlocProvider.of<ChangeBloc>(context).add(CheckChange(
                        phone: widget.phone!,
                        password: pass1.text));
                  } else {
                    Fluttertoast.showToast(msg: "Password error");
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Page()));
                },
                height: 40,
                color: Colors.green,
                child: BlocConsumer<ChangeBloc, ChangeState>(
                  builder: (context, state) {
                    if (state is CheckingChange) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Text("Change Password");
                    }
                  },
                  listener: (context, state) {
                    if (state is ChangeChecked) {
                      Fluttertoast.showToast(msg: "Password changed successful");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home_Page()),
                          (Route<dynamic> route) => false);
                    } else if (state is OtpError) {
                      Fluttertoast.showToast(
                        msg: state.error,
                      );
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),

    );
  }
}
