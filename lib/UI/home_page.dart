import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/UI/history.dart';
import 'package:parish_app/UI/profileview.dart';
import 'package:parish_app/UI/descriptionPage.dart';
import 'package:parish_app/bloc/newsBloc.dart';
import 'package:parish_app/bloc/tokenMangerbloc.dart';
import 'package:parish_app/bloc/without_login.dart';
import 'package:parish_app/helper/sharedpreferences.dart';
import '../bloc/profileBloc.dart';
import 'Aboutus.dart';
import 'Login.dart';
import 'contactUs.dart';
import 'drawer.dart';
import 'gallery.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  void initState() {
    super.initState();
    BlocProvider.of<WithoutLogin>(context).add(CheckDisplay());
    BlocProvider.of<ProfileBloc>(context).add(CheckProfile());
    BlocProvider.of<NewsBloc>(context).add(CheckNews());
    initFunc();
    setState(() {});
  }

  initFunc() async {
    context.read<TokenManagerBloc>().token = await TempStorage.getToken();
    //context.read<TokenManagerBloc>().id=await TempStorage.getId();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Color(0xff0098ff),
            actions: [
              if (context.read<TokenManagerBloc>().token != null) ...[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileView()));
                      },
                      // child: CircleAvatar(
                      //   child: Icon(Icons.group),
                      //
                      // ),

                      child: CircleAvatar(
                        backgroundColor: Color(0xff0098ff),
                        child: Icon(Icons.person),
                      ),
                    ))
              ],
            ]),
        drawer: OutDrawer().build(context, setState),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                gallery_display(context),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                history(context, setState),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                _latestNews(context),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//FUNCTIONS
Widget _latestNews(BuildContext context) //Latest news
{
  return Column(
    children: [
      Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 5, 5),
            child: Text(
              "Latest News",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
          )),
      SizedBox(
        height: 10,
      ),
      BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsChecked) {
          return CarouselSlider.builder(
              itemCount: state.newsModel!.data!.length,
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enableInfiniteScroll: true),
              itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.black,
                        child: InkWell(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Text(
                                    state.newsModel!.data![i].news!,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Desc(
                                        details: state
                                            .newsModel!.data![i].description!,
                                        news: state.newsModel!.data![i].news!)))
                          },
                        ),
                      )));
        } else if (state is NewsError) {
          return Text(state.error);
        } else
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: CircularProgressIndicator(
              color: Color(0xff0098ff),
            )),
          );
      }),
    ],
  );
}

Widget gallery_display(BuildContext context) {
  // Gallery
  List<Image> images = [
    Image(
      image: AssetImage('assets/2.JPG'),
      fit:  BoxFit.fill,
    ),
    Image(image: AssetImage('assets/c1.JPG'), fit: BoxFit.cover),
    Image(image: AssetImage('assets/c3.JPG'), fit: BoxFit.cover)
  ];

  return Column(
    children: [
      InkWell(
        onTap: () => {
          // Navigator.push(context,MaterialPageRoute(builder: (context)=>gallery()))
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => gallery()))
        },
        child: CarouselSlider(
          options: CarouselOptions(
            height: 308,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
          items: [0, 1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  color: Colors.white.withOpacity(0),
                  elevation: 11,
                  child: Container(
                    color: Colors.black.withOpacity(0),
                      width: MediaQuery.of(context).size.width/1.5,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            child: images[i],
                          )
                          //Things to be in the slider given here
                        ],
                      )),
                );
              },
            );
          }).toList(),
        ),
      ),
    ],
  );
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
          child: Text(
            "Contact Us",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
          child: Text(
            "About Us",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
          child: Text(
            "Log In",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home_Page()))
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Home",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ],
  );
}

Widget history(BuildContext context, setState) //History
{
  //var _scrollParent = false;
  return Column(
    children: [
      Container(
          //color: Color(0xff0098ff),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "History",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
          )),
      BlocBuilder<WithoutLogin, DisState>(
        builder: (context, state) {
          if (state is DisplayChecked) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              shadowColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16,20, 16, 16),
                  child: DescriptionTextWidget(
                    text: state.w_loginModel!.user![0].parishHistory!,
                    // style:
                    // TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          } else if (state is DisplayError) {
            return Text(state.error);
          } else
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: CircularProgressIndicator(
                color: Color(0xff0098ff),
              )),
            );
        },
      ),
    ],
  );
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    firstHalf = widget.text.substring(0, 375);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
      child: new Column(
        children: [
          Text(
            firstHalf!,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.justify,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flag ? "show more" : "show less",
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => History(history: widget.text)));
            },
          ),
        ],
      ),
    );
  }
}
