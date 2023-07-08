import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/bloc/AllUserBloc.dart';
import 'package:parish_app/bloc/WardBloc.dart';
import 'package:parish_app/bloc/addFamilyBloc.dart';
import 'package:parish_app/bloc/directoryBloc.dart';
import 'package:parish_app/bloc/passChangeBloc.dart';
import 'package:parish_app/bloc/profileBloc.dart';
import 'package:parish_app/bloc/tokenMangerbloc.dart';
import 'package:parish_app/bloc/newsBloc.dart';
import 'package:parish_app/bloc/without_login.dart';
import 'bloc/LoginBloc.dart';
import 'bloc/editBloc.dart';
import 'bloc/jobBloc.dart';
import 'UI/home_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var a=await FirebaseMessaging.instance.getToken();
  print("Device token: ${a}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WithoutLogin>(create: (context)=>WithoutLogin()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<JobBloc>(create: (context) => JobBloc()),
        BlocProvider<TokenManagerBloc>(create: (context) => TokenManagerBloc()),
        BlocProvider<NewsBloc>(create: (context) => NewsBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<WardBloc>(create: (context) => WardBloc()),
        BlocProvider<AllUserBloc>(create: (context) => AllUserBloc()),
        BlocProvider<ChangeBloc>(create: (context) => ChangeBloc()),
        BlocProvider<EditBloc>(create: (context) => EditBloc()),
        BlocProvider<AddFamilyBloc>(create: (context) => AddFamilyBloc()),
        BlocProvider<DirectoryBloc>(create: (context) => DirectoryBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parish',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: 'Font',
        ),
        home:  Home_Page(),
      ),
    );
  }
}


