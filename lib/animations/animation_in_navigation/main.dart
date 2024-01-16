import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sep_advancedtopics/animations/animation_in_navigation/second_page.dart';

void main() {
  runApp(MaterialApp(
    home: Main_Animation(),
  ));
}

class Main_Animation extends StatefulWidget {
  const Main_Animation({super.key});

  @override
  State<Main_Animation> createState() => _Main_AnimationState();
}

class _Main_AnimationState extends State<Main_Animation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation, secondanimation) {
                            return Second_page_Animation();
                          },
                          transitionsBuilder:
                              (context, animation, animation2, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 700)));
                },
                child: Text('Fade animation')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation, asecondanimation) {
                            return Second_page_Animation();
                          },
                          transitionsBuilder:
                              (context, animation, animation2, child) {
                            return ScaleTransition(
                              scale: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.fastOutSlowIn)),
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 700)));
                },
                child: Text('Scale animation')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation, asecondanimation) {
                            return Second_page_Animation();
                          },
                          transitionsBuilder:
                              (context, animation, animation2, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(-1.0, 0.0),
                                      end: Offset(0.0, 0.0))
                                  .animate(animation),
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 700)));
                },
                child: Text('Slider animation')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(seconds: 1),
                          child: Second_page_Animation(),
                          type: PageTransitionType.topToBottomPop,
                        childCurrent: this.widget
                           ));
                },
                child: Text('using package'))
          ],
        ),
      ),
    );
  }
}
