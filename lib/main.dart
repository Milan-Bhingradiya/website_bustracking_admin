import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: home());
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation =
        Tween<double>(begin: 0, end: 2 * 3.14).animate(animationController!);
    animationController!.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(animation!.value),
                    child: CircleAvatar(
                        radius: size.width / 8, // Image radius
                        backgroundImage: AssetImage("assets/milan.png")));
              },
            ),
            SizedBox(
              width: size.width / 18,
            ),
            Flexible(
              child: Text(
                "hello Milan Bhingradiya",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: size.width / 18,
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(animation.value),
                    child: CircleAvatar(
                        radius: size.width / 8, // Image radius
                        backgroundImage: AssetImage("assets/milan.png")));
              },
            ),
          ],
        ),
      ),
    );
    //s
  }
}
