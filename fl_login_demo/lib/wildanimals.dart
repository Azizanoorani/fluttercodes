
import 'package:fl_login_demo/MyFlutterApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Lion.dart';

import 'ListView.builder.dart';

class WildAnimals extends StatefulWidget {

  final List<Animal> animals;

  const WildAnimals({super.key, required this.animals});

  @override
  _WildAnimals createState() => _WildAnimals(animals);
}



class _WildAnimals extends State<WildAnimals> {

  final List<Animal> animals;

  _WildAnimals(this.animals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,),
        centerTitle:true,
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(side: BorderSide(width: 2,color: Colors.blue),borderRadius: BorderRadius.circular(25)),

        title:Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 30, 20),
            child:
            SearchBar(
              backgroundColor:MaterialStateProperty.all(Colors.white),
              trailing: [
                IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.keyboard_voice),
                  onPressed: () {
                    print('Use voice command');
                  },
                ),
                IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    print('Use image search');
                  },
                ),
              ],
              // other arguments
            )
        ),
      ),

      body:
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration( color:Colors.blue,borderRadius: BorderRadius.only(topRight:Radius.circular(25),topLeft:Radius.circular(25))),
        child:Padding(padding:EdgeInsets.all(10),
          child:
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children:animals.map((value) {
                    return Card(
                        shape: RoundedRectangleBorder(side: BorderSide(
                            width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child:
                        ListTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          leading: Icon(value.iconData),
                          title: Text(value.name),
                          tileColor: Colors.white24,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Lion(animals: value, segmentedButtons: value,))
                            );}
                        ));
                  }).toList(),
                 ),
                )
                ]
                ),
              )
          ),
        );
  }
}