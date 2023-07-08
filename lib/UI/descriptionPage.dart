import 'package:flutter/material.dart';

class Desc extends StatefulWidget {
  final String? details;
  final String? news;

  const Desc({Key? key, required this.details, required this.news})
      : super(key: key);

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News in Detail',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Color(0xff0098ff),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xff0098ff),
                    offset: new Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.news!,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              widget.details!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
