import 'package:flutter/material.dart';

class Family extends StatefulWidget {
  @override
  _FamilyState createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0098ff),
        title:Text("family")
        ),
        
         body:
         
         GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30),
                itemCount: 40,
                
                itemBuilder: (BuildContext ctx, index) {
                  
                  return CircleAvatar(
                    
                                backgroundImage:NetworkImage("https://media-exp1.licdn.com/dms/image/C5603AQF6IJUyyvW7QQ/profile-displayphoto-shrink_200_200/0/1651246166434?e=1658361600&v=beta&t=myncWJJzh0-9-G7giRxRX_-NSvU2ApkX9D7a1eYbiMk"),
                               backgroundColor: Colors.transparent,
);
                }
                ),
         
        
      
      
    );
  }
}