import 'package:career_glass_app/seeker/dash_screen/company_applicant.dart';
import 'package:career_glass_app/seeker/company_dashboard.dart';
import 'package:career_glass_app/seeker/dash_screen/company_job.dart';
import 'package:career_glass_app/seeker/dash_screen/company_profile.dart';

import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

class MainDashscreen extends StatefulWidget {
  const MainDashscreen({super.key});

  @override
  State<MainDashscreen> createState() => _MainDashscreenState();
}

class _MainDashscreenState extends State<MainDashscreen> {

  List<Widget> widgetList=[
    CompanyDashboard() ,
    CompanyJob() ,
    CompanyApplicant(),
    CompanyProfile() ,
  ];

  int myIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,
      appBar: AppBar(

        // Left side (logo)==================================================================================
        backgroundColor: CColors.secondarybackground,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.business_sharp, color: Colors.white, size: 18),
          ),
        ),

        //  Center Title======================================================================================

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("CareerGlass", style: TextStyle(color:CColors.text, fontSize: 18, fontWeight: FontWeight.w500,),),
            Text("Employer Hub", style: TextStyle(color: CColors.hinttext, fontSize: 12, fontWeight: FontWeight.w500,),),

          ],
        ),
        // Right side icons================================================================================================
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: CColors.text,size: 25,),
          ),
          const SizedBox(width: 10),
        ],
      ),

///bottom nav bar====================================================================================
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CColors.secondarybackground,
          selectedItemColor: CColors.button,
          unselectedItemColor: CColors.hinttext,
          type:BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
            myIndex=index;
            });
          },
          currentIndex: myIndex,

          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
          label: 'Dashboard',
        ),
            BottomNavigationBarItem(
                icon: Icon(Icons.work_history_outlined),
                label: 'Jobs',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined),
                label: 'Applicants',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_outlined ),
                label: 'Profile',
            )
      ]
      ),
      body: Center(
        child: widgetList[myIndex],

      ),
    );
  }
}

