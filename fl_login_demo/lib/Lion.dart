import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'ListView.builder.dart';
import 'circularprogressbar.dart';



enum lion { Overview, Diet ,Evolution ,Grouporganisation,FossilRecords }

class Lion extends StatefulWidget {

   final Animal animals;

  const Lion({super.key, required this.animals, required Animal segmentedButtons});

  @override
  _Lion createState() => _Lion(animals);
}


Map<int, Widget> RetrieveSegmentedButtons(List<segmentbutton> segmentedButtons){
  List<Widget> widgets = [];
  List<int> numbers = [];
  for(int i = 0; i < segmentedButtons.length; i++)
  {
    numbers.add(i);
    widgets.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          segmentedButtons[i].name,
          style: TextStyle(color: CupertinoColors.white),
        ),
    ));
  }

  return Map.fromIterable(numbers, key: (k) => k, value: (v) => widgets[v]);
}


class _Lion extends State<Lion> {
  final Animal animals;

  _Lion(this.animals);

  int selectedsegementindex = 0;

int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
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
      body:SafeArea(child:
       SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
           child: Row( children: [
             Text(animals.name, textAlign: TextAlign.left, style:TextStyle(fontSize: 30,), textDirection: TextDirection.ltr),
                  Padding(padding: EdgeInsets.fromLTRB(200 , 0, 0, 0), child: IconButton(

                      icon:const Icon(Icons.scale),
                   onPressed: () {
                                      Navigator.push(
                                        context,
                                       MaterialPageRoute(builder: (context) => SfRadialGaugeSample(animalweight: animals.animalweight)));}))])),
                    IconButton(icon: Icon( Icons.volume_up),onPressed: (){

                    },),
                    Container(
                       padding: EdgeInsets.all(0),
                       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                       decoration:BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(25)),
                       child:
                      Column(children:<Widget>[
                          CarouselSlider(options: CarouselOptions(autoPlay: true,
                        onPageChanged: (finalimagepaths, reason) {
                          setState(() {
                            currentIndex = finalimagepaths;
                          });
                        },
                      ),
                     items: animals.images.map((imagepath) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB( 5,25,5,10),
                                child: Image.asset(imagepath),
                              );
                            }
                            ).toList(),
                          ),
                        DotsIndicator(
                          dotsCount: animals.images.length,
                          position:  currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            color: Colors.black,
                            activeColor: Colors.white,
                          ),
                        ),
                          CupertinoSlidingSegmentedControl<int>(
                              backgroundColor: Colors.white54,
                              groupValue:selectedsegementindex ,
                              thumbColor: Colors.blue,
                              onValueChanged: (int? newvalue) {
                                setState(() {
                                  selectedsegementindex = newvalue!;
                                });
                              },
                            children: RetrieveSegmentedButtons(animals.segmentButtons)),
                               Padding(padding: EdgeInsets.all(15),
                                  child: Text(animals.segmentButtons[selectedsegementindex].description,
                               textAlign: TextAlign.justify,
                                 style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
          )
          ]
    )
    )
    ],
    )
    )
    )
    );
  }
}

  // Holds all indices of children to be disabled.
  // Set this list either null or empty to have no children disabled.











