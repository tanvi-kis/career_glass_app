import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

import '../../model/app_theme.dart';


class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  List<Map<String,dynamic>> jobList=[
    {
      'Image':'assets/images/job_save1.png',
      'title':'Senior Product \nDesigner',
      'location':'Stripe • Global',
      'time':'Applied by 24 others',
      'icon1':'location_on_outlined',
      'icon2':'access_time',
      'isSaved': false,
    },
    {
      'Image':'assets/images/job_image2.png',
      'title':'Lead UI Engineer',
      'location':'Vercel • San Francisco',
      'time':'Saved 2 days ago',
      'icon1':'map_outlined',
      'icon2':'currency_rupee',
      'isSaved': false,


    },
    {
      'Image':'assets/images/job_image3.png',
      'title':'Motion Designer',
      'location':'Airbnb • New York',
      'time':'Closing in 4h',
      'icon1':'location_on_outlined',
      'icon2':'access_time',
     'isSaved': false,
    },{
      'Image':'assets/images/job_image4.png',
      'title':'Data Visualization \nExpert',
      'location':'Palantir • Denver',
      'time':'Posted 1 week ago',
      'icon1':'map_outlined',
      'icon2':'currency_rupee',
      'isSaved': false,
    }
  ];

  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CColors.secondarybackground,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: CColors.secondarybackground,
          centerTitle: true,
          title: Text(' Saved Jobs',style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700,),),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
          actions: [
            Icon(Icons.search,color: CColors.text,size: 20,),
            SizedBox(width: 7,),
            Icon(Icons.menu,color: CColors.text,size: 20),

          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight( 1),
            child:
            //Column(
          //     children: [
          //       TabBar(
          //         indicatorColor: Colors.blue,
          //         labelColor: Colors.blue,
          //         unselectedLabelColor: Colors.grey,
          //         labelStyle: TextStyle(fontWeight: FontWeight.bold),
          //         tabs: [
          //           Tab(text: 'All Jobs (${jobList.length})'),
          //           Tab(text: 'Remote'),
          //           Tab(text: 'Design'),
          //           Tab(text: 'Engineering'),
          //         ],
          //       ),
                Container(
                  height: 1,
                  color: Colors.grey[700],
                ),
          //     ],
          //   ),
           ),

        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount:jobList.length ,
                  itemBuilder: (context, index) {
                    return  Card(
                      color: CColors.Card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: CColors.hinttext),
                      ),

                      child:
                      Padding(
                        padding: const EdgeInsets.all(19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(jobList[index]['Image'],height: 56,width: 56,),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(jobList[index]['title'],style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700),),
                                      Text(jobList[index]['location'],style: TextStyle(color: CColors.button,fontSize: 14,fontWeight: FontWeight.w500),),
                                      SizedBox(height: 8,),
                                      Row(

                                        children: [
                                          Row(

                                            children: [
                                              Icon(getIcon(jobList[index]['icon1']), size: 13, color: CColors.hint1text),
                                              Text('Remote',style: TextStyle(color: CColors.hinttext,fontSize: 12),)
                                                ],
                                          ),
                                          SizedBox(width: 10,),
                                          Row(
                                            children: [
                                              //Icon(jobList[index]['icon2'],size: 13,color: CColors.hint1text,),
                                              Text('Full-time',style: TextStyle(color: CColors.hinttext,fontSize: 12),)
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobList[index]['isSaved'] =
                                      !(jobList[index]['isSaved'] ?? false);
                                    });
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Color(0xff1E293B),
                                      borderRadius: BorderRadius.circular(24),
                                      //border: Border.all(color: AppColors.cardBorder, width: 0.5),
                                    ),
                                    child: Icon(
                                      jobList[index]['isSaved'] == true
                                          ? Icons.bookmark_rounded
                                          : Icons.bookmark_border_rounded,
                                      color: jobList[index]['isSaved'] == true
                                          ? AppColors.accent
                                          : AppColors.textSecondary,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(jobList[index]['time'],style: TextStyle(color: CColors.hinttext,fontSize: 12,fontWeight: FontWeight.w400),),

                                SizedBox(width: 10,),
                                SizedBox(
                                  height: 36,
                                  child: ElevatedButton(onPressed:() =>
                                      showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            constraints: BoxConstraints(maxHeight: 420,maxWidth: 342),

                                            backgroundColor: CColors.secondarybackground,
                                            child: Padding(
                                              padding: const EdgeInsets.all(30),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/check.png',
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Text(
                                                    'Application Sent!',
                                                    style: TextStyle(
                                                      color: CColors.text,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      style: TextStyle(color: CColors.text, fontSize: 14),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                          "Your resume has been successfully sent to ",
                                                        ),
                                                        TextSpan(
                                                          text: "CareerGlass Inc.",
                                                          style: TextStyle(
                                                            color: CColors.button,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                          ". We'll notify you when they view your profile.",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 32,),
                                                  ///button===================================================================
                                                  SizedBox(
                                                    height: 50 ,
                                                    width: double.infinity,
                                                    child: ElevatedButton(onPressed: () {

                                                    },
                                                      child: Text('View Application Status',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: CColors.hinttext
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 24,),

                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage(),));
                                                      },
                                                      child: Text('Back to Job Search',style: TextStyle(color: CColors.hinttext),)),



                                                ],
                                              ),
                                            ),
                                          ),
                                      ),
                                    child: Text('Apply Now',style: TextStyle(color: CColors.text,fontSize: 14,fontWeight: FontWeight.w700),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CColors.button,

                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                },
                ),
              ),

            ],
          ),
        ),


      ),

    );
  }

  IconData? getIcon(jobList) {}
}

