import 'package:flutter/material.dart';

class gallery extends StatefulWidget {
  const gallery({Key? key}) : super(key: key);

  @override
  State<gallery> createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Gallery"),
          backgroundColor: Color(0xff0098ff),

        ),
        body:  GridView.builder(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,childAspectRatio: 0.8,
            ),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Column(
                  children: [
                    //Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Chandanappally_Valiyapally.jpg/1200px-Chandanappally_Valiyapally.jpg"),fit: BoxFit.fill,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 9.0, 3.5, 3.8),
                      child: Card(child: Container(
                          height:MediaQuery.of(context).size.height/6 ,
                          width:MediaQuery.of(context).size.width/2 ,
                          child:Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Chandanappally_Valiyapally.jpg/1200px-Chandanappally_Valiyapally.jpg"),fit: BoxFit.cover,)

                      )
              ),
                      ),
                     ],
                    ),

                );
            }
        ),

      ),

    );
  }
}
