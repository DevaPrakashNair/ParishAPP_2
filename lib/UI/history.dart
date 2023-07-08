import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final String history;

  const History({Key? key, required this.history}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Color(0xff0098ff),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                    child: Container(
                        child: Image(image: AssetImage('assets/h1.JPG')),
                        height: MediaQuery.of(context).size.height / 4)),
                SizedBox(
                  width: 30,
                  height: 30,
                ),
                Text(
                  widget.history,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
