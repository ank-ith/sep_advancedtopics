import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: HeroMain(),));
}
class HeroMain extends StatelessWidget {
  const HeroMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Main Page'),
        elevation: 5,
        backgroundColor: Colors.red,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HeroDetails()));
        },
        child: Hero(
          tag: 'imageHero',
          child: Container(
            height: 100,
            width: 100,
            child: Icon(Icons.touch_app),
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(50),),
          ),
        ),
      ),
    );
  }
}

class HeroDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero details Page'),
        elevation: 5,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HeroMain()));
          },
          child: Hero(
            tag: 'imageHero',
            child: Container(
              height: 200,
              width: 200,
              child: Icon(Icons.arrow_back,size: 100,),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.purpleAccent,),

            ),
          ),
        ),
      ),
    );
  }
}
