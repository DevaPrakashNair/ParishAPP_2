
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:parish_app/bloc/addFamilyBloc.dart';

import '../bloc/jobBloc.dart';
import '../data/model/ProfileModel.dart';
import 'family.dart';

class AddFamily extends StatefulWidget {
  final ProfileModel? profile;
  const AddFamily({Key? key,required this.profile}) : super(key: key);

  @override
  _AddFamiluState createState() => _AddFamiluState();
}

enum SingingCharacter { Male, Female }

SingingCharacter? _character = SingingCharacter.Male;

class _AddFamiluState extends State<AddFamily> {
  var name = TextEditingController();
  var phone = TextEditingController();
  var dob = TextEditingController();
  var age = TextEditingController();
  var baptismName = TextEditingController();
  var emailId = TextEditingController();
  String? gender;
  String? job;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? dropdownvalue;

  @override
  void initState() {
    setState(() {

    });
    super.initState();
    BlocProvider.of<JobBloc>(context).add(CheckJob());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Add family"),
          backgroundColor: Color(0xff0098ff),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    //Text("Name:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    TextFormField(
                      controller: name,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        labelText: 'Name',
                        hintText: "Enter your name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Text("Phone Number:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    TextFormField(
                      controller: dob,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        labelText: 'Date of birth',
                        hintText: "Enter you date of birth",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Date of birth';
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dob.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    //Text("Gender:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(
                      height: 10,
                    ),

                    //Text("Age:",style: TextStyle(color: Colors.black,fontSize: 20),),

                    //Text("Age:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    TextFormField(
                      controller: baptismName,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        labelText: 'Baptism Name',
                        hintText: "Enter your baptism name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a text';
                        }
                        return null;
                      },
                    ),
                    //Text("Age:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailId,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        labelText: 'Email id',
                        hintText: "Enter your email id",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email id';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //Text("Age:",style: TextStyle(color: Colors.black,fontSize: 20),),

                    //Text("Age:",style: TextStyle(color: Colors.black,fontSize: 20),),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 3),
                        ),
                        labelText: 'Phone number',
                        hintText: "Enter your phone number",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 100,
                        child: Row(children: [
                          Text(
                            "Gender:",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Row(children: [
                            Radio<SingingCharacter>(
                              activeColor: Color(0xff0098ff),
                              value: SingingCharacter.Male,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                gender = "Male";
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            Text('Male'),
                          ]),
                          Row(children: [
                            Radio<SingingCharacter>(
                              activeColor: Color(0xff0098ff),
                              value: SingingCharacter.Female,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                gender = "Female";
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            Text('Female'),
                          ])
                        ])),
                    Container(
                      height: 50,
                      child: BlocBuilder<JobBloc, JobState>(
                        builder: (context, state) {
                          if (state is JobChecked) {
                            return DropdownButton(
                              // Initial Value
                              value: dropdownvalue,
                              hint: Text("Select Jobs"),
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              // items: item?.map(() {
                              //   return DropdownMenuItem(
                              //     value: items,
                              //     child: Text(items),
                              //   );
                              // }).toList(),
                              items: state.jobModel!.data!
                                  .map((map) =>
                                  DropdownMenuItem(
                                    child: Text(map.toString()),
                                    value: map,
                                  ))
                                  .toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                job = newValue;
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            );
                          } else if (state is JobError) {
                            return Text(state.error);
                          } else
                            return Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff0098ff),
                                ));
                        },
                      ),
                    ),
                    //job selection
                    //photo
                    Center(
                      child: MaterialButton(
                          onPressed: () =>
                          {
                            BlocProvider.of<AddFamilyBloc>(context).add(
                                CheckAddFamily(
                                    name: name.text,
                                    phone: phone.text,
                                    gender: gender.toString(),
                                    emailId: emailId.text,
                                    baptismName: baptismName.text,
                                    dob: dob.text,
                                    occupation: job.toString()
                                )
                            )
                            // if (!_formkey.currentState!.validate())
                            //   {
                            //     Fluttertoast.showToast(
                            //         msg: '',
                            //         toastLength: Toast.LENGTH_SHORT,
                            //         gravity: ToastGravity.BOTTOM,
                            //         //timeInSecForIos: 1,
                            //         backgroundColor: Colors.white,
                            //         textColor: Colors.yellow),
                            //
                            //   }
                          },
                          height: 50,
                          color: Color(0xff0098ff),
                          child: Title(
                            color: Color(0xff0098ff),
                            child: BlocConsumer<AddFamilyBloc, AddFamilyState>(
                              builder: (context, state) {
                                if (state is CheckingAddFamily) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Text("Save"),
                                  );
                                }
                              },
                              listener: (context, state) {
                                if (state is AddFamilyChecked) {
                                  Fluttertoast.showToast(
                                      msg: "New member added successfully");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Family()));
                                }
                                else if (state is AddFamilyError) {
                                  Fluttertoast.showToast(msg: state.error);
                                }
                              },
                            ),
                          )),
                    ),
                  ]),
            ),
          ),
        ));
  }
}