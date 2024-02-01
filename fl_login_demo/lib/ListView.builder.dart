import 'dart:core';
import 'dart:core';
import 'package:fl_login_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'Lion.dart';
import 'MyFlutterApp.dart';
import 'WildAnimals.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "AnimalList",
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
        home: AnimalList ());
  }
}
class AnimalType{
  late String name;
  late IconData iconData;
  late List<Animal> animals;

  AnimalType({
    required this.name,
    required this.iconData,
    required this.animals,

  });
}
class segmentbutton {
  late String name;
  late String description;

  segmentbutton({
    required this.name,
    required this.description
  });
}
class Animalvoice{
  late String voice;
  Animalvoice({
    required this.voice,
});
}

class AnimalWeight{

  late double MinimumWeight;
  late double MaximumWeight;
  late double AverageWeight;

  AnimalWeight({
    required this.MinimumWeight,
    required this.MaximumWeight,
    required this.AverageWeight
  });
}

class Animal{
  late String name;
  late IconData iconData;
  late List<String> images;
  late List<segmentbutton> segmentButtons;
  late AnimalWeight animalweight;

Animal({
  required this.name,
  required this.iconData,
  required this.images,
  required this.animalweight,
  required this.segmentButtons,
});
}

List<String> lionImages=[
  'asset/images/lion3.jpg',
  'asset/images/lion.jpg',
  'asset/images/lion4.jpg',
];
List<String> tigerImages=[
  'asset/images/tiger1.jpg',
  'asset/images/tiger2.jpg',
  'asset/images/tiger3.jpg',
];
List<String> foxImages=[
  'asset/images/fox1.jpg',
  'asset/images/fox2.jpg',
  'asset/images/fox3.jpg',
  'asset/images/fox4.jpg',
];
List<String> cheetahImages=[
  'asset/images/fox1.jpg',
  'asset/images/fox2.jpg',
  'asset/images/fox3.jpg',
  'asset/images/fox4.jpg',
];
List<String> dogImages=[
  'asset/images/dog1.jpg',
  'asset/images/dog2.jpg',
  'asset/images/dog3.jpg',
  'asset/images/dog4.jpg',
  'asset/images/dog5.jpg',
];
List<String> catImages=[
  'asset/images/cat1.jpg',
  'asset/images/cat2.jpg',
  'asset/images/cat3.jpg',
  'asset/images/cat4.jpg',
];
List<String> horseImages=[
  'asset/images/horse1.jpg',
  'asset/images/horse2.jpg',
  'asset/images/horse3.jpg',
  'asset/images/horse4.jpg',
];
List<String> rabbitImages=[
  'asset/images/rabbit1.jpg',
  'asset/images/rabbit2.jpg',
  'asset/images/rabbit3.jpg',
  'asset/images/rabbit4.jpg',
];


List<String> sunconureImages=[
  'asset/images/sunconure1.jpg',
  'asset/images/sunconure2.jpg',
  'asset/images/sunconure3.jpg',
];
List<String> africangreyImages=[
  'asset/images/africangrey1.jpg',
  'asset/images/africangrey2.jpg',
  'asset/images/africangrey3.jpg',
];
List<String> cockatooImages=[
  'asset/images/cockatoo1.jpg',
  'asset/images/cockatoo2.jpg',
  'asset/images/cockatoo3.jpg',
  'asset/images/cockatoo4.jpg',
  'asset/images/cockatoo5.jpg',

];
List<String> cockatielImages=[
  'asset/images/cockatiel1.jpg',
  'asset/images/cockatiel2.jpg',
  'asset/images/cockatiel3.jpg',
];
List<String> turtleImages=[
  'asset/images/seaturtle1.jpg',
  'asset/images/seaturtle2.jpg',
  'asset/images/seaturtle3.jpg',
];
List<String> starfishImages=[
  'asset/images/starfish1.jpg',
  'asset/images/starfish2.jpg',
  'asset/images/starfish3.jpg',
];
List<String> seaHorseImages=[
  'asset/images/seahorse1.jpg',
  'asset/images/seahorse2.jpg',
  'asset/images/seahorse3.jpg',
];
List<String> fishImages=[
  'asset/images/fish1.jpg',
  'asset/images/fish2.jpg',
  'asset/images/fish3.jpg',
];


List<segmentbutton> liondetails= [
      new segmentbutton(name: 'Overview_1',
      description: 'Overview _ The lion (Panthera leo) is a large cat of the genus Panthera native to Africa and India. It has a muscular, broad-chested body; short, rounded head; round ears; and a hairy tuft at the end of its tail.'
          'It is sexually dimorphic; adult male lions are larger than females and have a prominent mane.'
          'It is a social species, forming groups called prides.'
          'A lions pride consists of a few adult males, related females, and cubs. Groups of female lions usually hunt together'
          'preying mostly on large ungulates. The lion is an apex and keystone predator; although some lions '
          'scavenge when opportunities occur '
          'and have been known to hunt humans, lions typically do not actively seek out and prey on humans.'),
  new segmentbutton(name: 'Detail_1',
      description: 'Detail _ The lion (Panthera leo) is a large cat of the genus Panthera native to Africa and India. It has a muscular, broad-chested body; short, rounded head; round ears; and a hairy tuft at the end of its tail.'
          'It is sexually dimorphic; adult male lions are larger than females and have a prominent mane.'
          'It is a social species, forming groups called prides.'
          'A lions pride consists of a few adult males, related females, and cubs. Groups of female lions usually hunt together'
          'preying mostly on large ungulates. The lion is an apex and keystone predator; although some lions '
          'scavenge when opportunities occur '
          'and have been known to hunt humans, lions typically do not actively seek out and prey on humans.'),
  new segmentbutton(name: 'Weight_1',
      description: 'Weight _ The lion (Panthera leo) is a large cat of the genus Panthera native to Africa and India. It has a muscular, broad-chested body; short, rounded head; round ears; and a hairy tuft at the end of its tail.'
      'It is sexually dimorphic; adult male lions are larger than females and have a prominent mane.'
          'It is a social species, forming groups called prides.'
          'A lions pride consists of a few adult males, related females, and cubs. Groups of female lions usually hunt together'
          'preying mostly on large ungulates. The lion is an apex and keystone predator; although some lions '
          'scavenge when opportunities occur '
          'and have been known to hunt humans, lions typically do not actively seek out and prey on humans.')

];
List<segmentbutton> tigerdetails= [
  new segmentbutton(name: 'Overview_1',
      description: 'The tiger (Panthera tigris) is the largest living cat species and a member of the genus Panthera.'
          ' It is most recognisable for its dark vertical stripes on orange fur with a white underside. An apex predator,'
          ' it primarily preys on ungulates, such as deer and wild boar. It is territorial and generally a solitary but social predator,'
          ' requiring large contiguous areas of habitat to support its requirements for prey and rearing of its offspring.'
          ' Tiger cubs stay with their mother for about two years and then become independent, leaving their mother home range to establish their own.'),
  new segmentbutton(name: 'Detail_1',
      description:' The tiger was first scientifically described in 1758.'
          ' It once ranged widely from the Eastern Anatolia Region in the west to the Amur River basin in the east,'
          ' and in the south from the foothills of the Himalayas to Bali in the Sunda Islands. Since the early 20th century,'
          ' tiger populations have lost at least 93% of their historic range and have been extirpated from Western and Central '
          'Asia, the islands of Java and Bali, and in large areas of Southeast and South Asia and China. What remains of the range'
          ' where tigers still roam free is fragmented, stretching in spots from Siberian temperate forests to subtropical and tropical'
          ' forests on the Indian subcontinent, Indochina and a single Indonesian island, Sumatra.'),
  new segmentbutton(name: 'Weight_1',
      description: 'The tiger is listed as Endangered on the IUCN Red List. '
          'As of 2015, the global wild tiger population was estimated to number between 3,062 and 3,948'
          ' mature individuals, with most populations living in small isolated pockets.'
          ' India currently hosts the largest tiger population. Major reasons for population decline '
          'are habitat destruction, habitat fragmentation and poaching. Tigers are also victims of '
          'human–wildlife conflict, due to encroachment in countries with a high human population density.')

];
List<segmentbutton> foxdetails= [
  new segmentbutton(name: 'Overview_1',
      description: ' Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae.'
          ' They have a flattened skull, upright, triangular ears, a pointed, slightly upturned snout, and a long bushy tail ("brush").'
'Twelve species belong to the monophyletic "true fox" group of genus Vulpes. Approximately another 25 current or extinct species are always '
          'or sometimes called foxes; these foxes are either part of the paraphyletic group of the South American foxes, or of the outlying '
          'group, which consists of the bat-eared fox, gray fox, and island fox.[1]'
'Foxes live on every continent except Antarctica. The most common and widespread species of fox is the red fox '
          '(Vulpes vulpes) with about 47 recognized subspecies.[2] The global distribution of foxes, together with their widespread reputation '
          'for cunning, has contributed to their prominence in popular culture and folklore in many societies around the world. The hunting of '
          'foxes with packs of hounds, long an established pursuit in Europe, especially in the British Isles, was exported by European settlers '
          'to various parts of the New World.'),
  new segmentbutton(name: 'Behaviour',
      description:'In the wild, the typical lifespan of a fox is one to three years, although individuals may live up to ten years.'
          ' Unlike many canids, foxes are not always pack animals. Typically, they live in small family groups, but some'
          ' (such as Arctic foxes) are known to be solitary.[2][9]'
      'Foxes are omnivores.[13][14] Their diet is made up primarily of invertebrates such as insects and small vertebrates such as'
          ' reptiles and birds. They may also eat eggs and vegetation. Many species are generalist predators, but some (such as the '
          'crab-eating fox) have more specialized diets. Most species of fox consume around 1 kg (2.2 lb) of food every day. '
          'Foxes cache excess food, burying it for later consumption, usually under leaves, snow, or soil.[9][15] While hunting, '
          'foxes tend to use a particular pouncing technique, such that they crouch down to camouflage themselves in the terrain and '
          'then use their hind legs to leap up with great force and land on top of their chosen prey.[2] Using their pronounced canine teeth,'
          ' they can then grip the prey s neck and shake it until it is dead or can be readily disemboweled.[2]'),
  new segmentbutton(name: 'Hunting',
      description: 'Fox hunting originated in the United Kingdom in the 16th century. Hunting with dogs is now banned in the United Kingdom,'
          '[41][42][43][44] though hunting without dogs is still permitted. Red foxes were introduced into Australia in the early 19th century '
          'for sport, and have since become widespread through much of the country. They have caused population decline among many native species '
          'and prey on livestock, especially new lambs.[45] Fox hunting is practiced as recreation in several other countries including Canada, '
          'France, Ireland, Italy, Russia, United States and Australia.')

];

List<Animal> wildAnimals = [
  Animal(name: "Lion", iconData: MyFlutterApp.lion,images: lionImages,segmentButtons:liondetails,animalweight: AnimalWeight(MinimumWeight:170,AverageWeight:200,MaximumWeight: 230  )),
  new Animal(name: "Tiger", iconData: MyFlutterApp.lion,images: tigerImages,segmentButtons:tigerdetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:200,MaximumWeight: 230 )),
  new Animal(name: "Fox", iconData: MyFlutterApp.fox,images: foxImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:200,MaximumWeight: 230 )),
  new Animal(name: "Cheetah", iconData: MyFlutterApp.lion,images: cheetahImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:200,MaximumWeight: 230 ))
];

List<Animal> domesticsAnimals = [
  new Animal(name: "Dog", iconData: MyFlutterApp.dog,images: dogImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "Cat", iconData: MyFlutterApp.cat,images: catImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "Horse", iconData: MyFlutterApp.horse,images: horseImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "Rabbit", iconData: MyFlutterApp.rabbit,images: rabbitImages,segmentButtons:liondetails,animalweight:AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ))
];
List<Animal> birds=[
  new Animal(name: "Sun conure", iconData: MyFlutterApp.gauge,images: sunconureImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "african grey", iconData: MyFlutterApp.gauge,images: africangreyImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "cockatoo", iconData: MyFlutterApp.gauge,images: cockatooImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "cockatiel", iconData: MyFlutterApp.gauge,images: cockatielImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ))
];
List<Animal> reptiles=[
  new Animal(name: "Lizards", iconData: MyFlutterApp.dog,images: lionImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "Cat", iconData: MyFlutterApp.cat,images: lionImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "Horse", iconData: MyFlutterApp.horse,images: lionImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "Rabbit", iconData: MyFlutterApp.rabbit,images: lionImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ))
];
List<Animal> seacreatures =[
  new Animal(name: "Sea turtle", iconData: MyFlutterApp.dog,images: turtleImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "Star fish", iconData: MyFlutterApp.cat,images: starfishImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) ),
  new Animal(name: "sea Horse", iconData: MyFlutterApp.horse,images: seaHorseImages,segmentButtons:liondetails,animalweight: new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 )),
  new Animal(name: "Fish", iconData: MyFlutterApp.rabbit,images: fishImages,segmentButtons:liondetails,animalweight:new AnimalWeight(MinimumWeight:170,AverageWeight:230,MaximumWeight: 230 ) )
];


List<AnimalType> animalTypes = [
  AnimalType(name: "Wild Animals", iconData:(MyFlutterApp.fox), animals: wildAnimals),
  AnimalType(name: " Domestic Animals", iconData:(MyFlutterApp.cat), animals: domesticsAnimals),
  AnimalType(name: "Birds", iconData:(MyFlutterApp.gauge), animals: birds),
  AnimalType(name: "Reptiles", iconData:(MyFlutterApp.snake), animals: reptiles),
  AnimalType(name: "sea creatures", iconData:(MyFlutterApp.duckduckgo), animals: seacreatures),
];

class AnimalList extends StatelessWidget {
   AnimalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue),
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
      body:Container(
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
        children: animalTypes.map((value) {
          return Card(
         shape: RoundedRectangleBorder(side:BorderSide(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(50)),
         child: ListTile(
             shape: RoundedRectangleBorder(side:BorderSide(width: 2),borderRadius: BorderRadius.circular(50)),
            leading: Icon(value.iconData),
            title:Text(value.name),
            tileColor: Colors.white24,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WildAnimals(animals: value.animals)),
              );}
             ));
        }).toList(),
           ),
    )]
    ),
      ),
    ),
    );
  }
}