import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:parish_app/bloc/jobBloc.dart';
import '../bloc/editBloc.dart';
import '../bloc/profileBloc.dart';
import '../data/model/ProfileModel.dart';

class Userdetails extends StatefulWidget {
  final ProfileModel? profile;
  final int? index;

  const Userdetails({Key? key, required this.index, required this.profile})
      : super(key: key);

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

enum SingingCharacter { Male, Female }


//SingingCharacter? _character = SingingCharacter.Female;

class _UserdetailsState extends State<Userdetails> {
  var name = TextEditingController();
  var dob = TextEditingController();
  var age = TextEditingController();
  var baptismName = TextEditingController();
  var emailId = TextEditingController();
  String? gender;
  String? job;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? dropdownvalue;
  File? imageFile;
  SingingCharacter? _character;

  //var? item;// =
  //
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  @override
  void initState() {
    setState(() {
      name.text = widget.profile!.data![widget.index!].name!;
      dob.text = widget.profile!.data![widget.index!].dob!;
      baptismName.text = widget.profile!.data![widget.index!].baptismName!;
      emailId.text = widget.profile!.data![widget.index!].emailId!;
    });
    super.initState();
    BlocProvider.of<JobBloc>(context).add(CheckJob());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("User Details"),
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
                        hintText: widget.profile!.data![widget.index!].name,
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
                      keyboardType: TextInputType.none,
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
                        hintText: widget.profile!.data![widget.index!].dob!,
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
                        hintText:
                            widget.profile!.data![widget.index!].baptismName!,
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
                        hintText: widget.profile!.data![widget.index!].emailId!,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email id';
                        }
                        return null;
                      },
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
                              hint: Text(widget.profile!.data![widget.index!].occupation!),
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
                                  .map((map) => DropdownMenuItem(
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
                    Container(
                        child: imageFile == null
                            ? Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ElevatedButton(
                                      //color: Color(0xff0098ff),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 120,
                                              color: Colors.white,
                                              child: Center(
                                                child: Column(

                                                    //mainAxisAlignment:
                                                    //MainAxisAlignment.center,
                                                    // mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      ListTile(
                                                        tileColor: Colors.white,
                                                        leading:
                                                            Icon(Icons.image),
                                                        title: Text("Gallery"),
                                                        onTap: () => {
                                                          _getFromGallery(),
                                                        },
                                                      ),
                                                      ListTile(
                                                        tileColor: Colors.white,
                                                        leading:
                                                            Icon(Icons.camera),
                                                        title: Text("Camera"),
                                                        onTap: () => {
                                                          _getFromCamera(),
                                                        },
                                                      )
                                                    ]),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text("UPLOAD IMAGE"),
                                    ),
                                    // Container(
                                    //  height: 40.0,
                                    //),
                                    //RaisedButton(
                                    // color: Colors.lightGreenAc  cent,
                                    // onPressed: () {
                                    // _getFromCamera();
                                    // },
                                    // child: Text("PICK FROM CAMERA"),
                                    //)
                                  ],
                                ),
                              )
                            : Container(
                                child: Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                ),
                              )),
                    //photo
                    Center(
                      child: MaterialButton(
                          onPressed: () => {
                                BlocProvider.of<EditBloc>(context).add(
                                    CheckEdit(
                                        name: name.text,
                                        gender: gender.toString(),
                                        emailId: emailId.text,
                                        baptismName: baptismName.text,
                                        id: widget
                                            .profile!.data![widget.index!].id!,
                                        dob: dob.text,
                                        occupation: job.toString()))
                              },
                          height: 50,
                          color: Color(0xff0098ff),
                          child: Title(
                            color: Color(0xff0098ff),
                            child: BlocConsumer<EditBloc, EditState>(
                              builder: (context, state) {
                                if (state is CheckingEdit) {
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
                                if (state is EditChecked) {
                                  Fluttertoast.showToast(
                                      msg: "Change saved successfully");
                                  setState(() {
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(CheckProfile());
                                  });
                                  Navigator.pop(context);
                                } else if (state is EditError) {
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

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
