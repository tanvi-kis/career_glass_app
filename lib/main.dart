import 'package:career_glass_app/screen/onboarding_screen1.dart';
import 'package:flutter/material.dart';

import 'helpar/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
void initState(){
super.initState();
Future.delayed(Duration(seconds: 5),(){
  Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen1(),));

});
}


  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.25, 0.45, 0.7, 1.0],
              colors: [
                Color(0xFF251DC6),
                Color(0xFF322F8D),
                Color(0xFF2E2A84),
                Color(0xFF1E2057),
                Color(0xFF131426),
              ],
            ),

          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Center(
                  child: SizedBox(
                    height: 128,
                    width: 128,
                    child:
                    Card(
                      color: Color(0xff062C53FF),
                      child: Center(
                          child: Icon(Icons.remove_red_eye_outlined,size: 32,weight: 49,color: Color(
                              0xffF1F5F9),)),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                Center(
                  child: Text.rich(
                    TextSpan(
                        text: 'Career',
                        style: TextStyle(color: Colors.white, fontSize: 48,fontWeight: FontWeight.w700),

                        children: [
                          TextSpan(
                            text: 'Glass',
                            style: TextStyle(color: Color(0xFF0F67C1), fontSize: 48,fontWeight: FontWeight.w700),)
                        ]
                    ),
                  ),
                ),
                Center(
                  child: Text('Finding your next career move',style: TextStyle(color: Color(0xff94A3B8),fontSize:14 ),),
                ),

                SizedBox(height: 120,),
                ///button-==
                Center(
                  child: Container(
                    height: 50,
                    width:250,
                    decoration: BoxDecoration(
                        color: Color(0xff12183e),  ///0xff94A3B8
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xff94A3B8))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            // backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToK3s_MU9QNJ0vVIgU7rK1sDPd_k5QHK5mrA&s',),
                            backgroundImage: AssetImage('assets/images/splash_image.png'),
                          ),
                          Text.rich(
                              TextSpan(
                                  text: 'Welcome back, ',
                                  style: TextStyle(color: CColors.primarytext, fontSize: 12,fontWeight: FontWeight.w700),
                                  children: [
                                    TextSpan(
                                      text: 'Julian',
                                      style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w700),

                                    )
                                  ]

                              ))
                        ],
                      ),
                    ),

                  ),
                )

              ],
            ),
          ),

        ),

      );
  }
}
