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
      "discription":'Your application for Product \nManager at Stripe has been moved\n to "Intervie…',
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

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: CColors.secondarybackground,
        centerTitle: true,
        title: Text('Notification page',style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700,),),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
        actions: [
          Icon(Icons.more_vert,color: CColors.text,size: 20,)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: CColors.borderside, // line color
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today',style: TextStyle(color: CColors.hinttext,fontSize: 18,fontWeight: FontWeight.w700),),
        
        
        ///card1=======================================================================================================
        
              ListView.builder(
                shrinkWrap: true, // ✅ add this
                itemCount:todayList.length ,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
        
                    child: Card(
                      color:selectedIndex == index
                          ? CColors.Card
                          : CColors.borderside,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          color: selectedIndex==index
                              ?CColors.hinttext
                              :Colors.transparent
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Image.asset(todayList[index]['image'],height: 48,width: 48,),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(todayList[index]['title'],style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 8,),
                                      Text(todayList[index]['discription'],textAlign:TextAlign.justify,style: TextStyle(color: CColors.hinttext,fontSize: 14,fontWeight: FontWeight.w400),),
                                     SizedBox(height: 8,),
                                      Text(todayList[index]['time'],style: TextStyle(color: CColors.hinttext,fontSize: 12,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
        
                    ),
                  );
        
                  },),
              SizedBox(height: 24,),
        
              Text('Yesterday',style: TextStyle(color: CColors.hinttext,fontSize: 18,fontWeight: FontWeight.w700),),
        ///card2============================================================================================
              ListView.builder(
                shrinkWrap: true, // ✅ add this
                physics: NeverScrollableScrollPhysics(),

                itemCount:yesterdayList.length ,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      color:selectedIndex == index
                          ? CColors.Card
                          : CColors.borderside,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(
                              color: selectedIndex==index
                                  ?CColors.hinttext
                                  :Colors.transparent
                          )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Image.asset(yesterdayList[index]['image'],height: 48,width: 48,),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(yesterdayList[index]['title'],style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 8,),
                                      Text(yesterdayList[index]['discription'],textAlign:TextAlign.justify,style: TextStyle(color: CColors.hinttext,fontSize: 14,fontWeight: FontWeight.w400),),
                                      SizedBox(height: 8,),
                                      Text(yesterdayList[index]['time'],style: TextStyle(color: CColors.hinttext,fontSize: 12,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
        
                    ),
                  );
        
                },),
              SizedBox(height: 50,),
        
              Center(child: Text('View Older Notifications',style: TextStyle(color: CColors.button,fontSize: 14,fontWeight: FontWeight.w600),)),
          SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
