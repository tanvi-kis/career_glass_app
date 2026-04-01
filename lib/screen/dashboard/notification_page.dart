import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<Map<String,dynamic>> todayList=[
    {
      "image":'assets/images/today1.png',
      "title":'New Match: Senior UI…',
      "discription":'Meta is looking for a designer with \nyour skills in San Francisco. \$180k -…',
      "time":'2 hours ago',
    },
    {
      "image":'assets/images/today2.png',
      "title":'Application Status Updated',
      "discription":'Your application for Product Manager \nat Stripe has been moved to "Intervie…',
      "time":'5 hours ago',
    }

  ];

  List<Map<String,dynamic>> yesterdayList=[
    {
      "image":'assets/images/yesterday1.png',
      "title":'Message from Recruiter',
      "discription":'"Hi Alex, I saw your portfolio and \nwould love to chat about a role at…',
      "time":'Yesterday, 4:20 PM',
    },
    {
      "image":'assets/images/yesterday2.png',
      "title":'Profile View',
      "discription":'A recruiter from Netflix viewed your\nprofile 3 times in the last 24 hours.',
      "time":'Yesterday, 11:15 PM',
    },
    {
      "image":'assets/images/yesterday3.png',
      "title":'Weekly Career Insight',
      "discription":'UI Design salaries in your area have\n increased by 12% this quarter.',
      "time":'Yesterday, 9:00 PM',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: CColors.secondarybackground,
        centerTitle: true,
        title: Text('Notification page',style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700,),),
        // title: Text('Notification page',style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700,),),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
        actions: [
          Icon(Icons.more_vert,color: CColors.text,size: 20,)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
