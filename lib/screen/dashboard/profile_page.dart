import 'dart:io';

import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../auth/login_screen.dart';
import 'edit_profile_seeker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<Map<String,dynamic>> experienceList=[
    {
      'image':'assets/images/experience1.png',
      'job':'Senior Product Designer',
      'company':'Google',
      'time':'Full-time',
      'month':'Jan 2021 - Present • 3 yrs 4 mos'
    },
    {
      'image':'assets/images/experience1.png',
      'job':'Product Designer',
      'company':'Airbnb',
      'time':'Full-time',
      'month':'Jun 2018 - Dec 2020 • 2 yrs 7 mos'
    },
  ];

  List<String> skills = [
    'Product Design',
    'UI/UX',
    'Figma',
    'Prototyping',
    'User Research',
    'Design Systems'
  ];           //// main screen use wrap=========================================================================
  List<String> skillList = [
    ' flutter',
    'UI/UX',
    'Dart',
    'c++',
    ' java',
    ' react',
    'Product Design',
    'Prototyping',
    'User Research',
    'Design Systems',
    'Figma',
  ];       ////dialog screen use============================================================================


  bool filePicked=false;
  String fileName='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: CColors.secondarybackground,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: CColors.text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
        actions: [Icon(Icons.settings, color: CColors.text, size: 20)],
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

  ///profile image========================================================================================
                            Stack(
                  children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaAsJaTD22xdCgfrjTCJzLQmODiZ-tYaXisA&s',
                  ),
                ),
                    Positioned(
                        child: IconButton(onPressed: () {
                      
                    },
                            icon: CircleAvatar(
                          radius: 17,
                            backgroundColor: CColors.button,
                            child: Icon(Icons.edit,color: CColors.text,))),
                      bottom: -8,
                      left: 55,
                    )
                  ],
                ),
                // Center(
                //   child:
                //   CircleAvatar(
                //     radius: 50,
                //     backgroundImage: NetworkImage(
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaAsJaTD22xdCgfrjTCJzLQmODiZ-tYaXisA&s',
                //     ),
                //   ),
                // ),
                SizedBox(height: 16),

                Text(
                  'Marcus Chen',
                  style: TextStyle(
                    color: CColors.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Senior Product Designer',
                  style: TextStyle(
                    color: CColors.hinttext,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: CColors.hinttext,
                      size: 11,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'San Francisco, CA',
                      style: TextStyle(color: CColors.hinttext, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                ///edit profile  button=======================================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileSeeker(),));
                          },
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: CColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CColors.button,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      height: 42,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: CColors.hinttext,
                      ),
                      child: Icon(Icons.share, size: 20, color: CColors.text),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                ///resume card=======================================================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: CColors.hinttext),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.file_present_outlined,
                                  size: 20,
                                  weight: 20,
                                  color: CColors.button,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Resume',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Update',
                              style: TextStyle(
                                color: CColors.button,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Container(
                          height: 62,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff1132D40D),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: CColors.cardbackground,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    Icons.picture_as_pdf_outlined,
                                    color: CColors.button,
                                    size: 20,
                                    weight: 20,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: TextButton(onPressed: () async{
                                          FilePickerResult? result = await FilePicker.platform.pickFiles();

                                          if (result != null) {
                                            File file = File(result.files.single.path!);
                                            print('printing file');
                                            print(file);
                                            setState(() {
                                              filePicked=true;
                                            });
                                          } else {
                                          }

                                        },
                                            child: Text('Upload image',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                        ),
                                    ),
                                    Visibility(
                                        visible: filePicked,

                                        child: Text(''))

                                    // Text(
                                    //   'Uploaded Oct 12, 2023',
                                    //   style: TextStyle(
                                    //     color: CColors.hinttext,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Icon(
                                  Icons.file_download_outlined,
                                  color: CColors.hinttext,
                                  size: 20,
                                  weight: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 28),

                ///skill  card============================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: CColors.hinttext),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.psychology_outlined,
                                  size: 20,
                                  weight: 20,
                                  color: CColors.button,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Skills',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => showDialog(
                                context:  context , 
                                builder: (context) => Dialog(
                                  constraints: BoxConstraints(maxHeight: 450,maxWidth: 342),
                                  backgroundColor: CColors.secondarybackground,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child:Column(
                                      children: [
                                        Text('Add skill',style: TextStyle(color: CColors.text,fontSize: 20,fontWeight: FontWeight.w700),),
                                        SizedBox(height: 20,),
                                        Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          children: skillList.map((skill) => Chip(
                                            elevation: 4,
                                            backgroundColor: Colors.white10,
                                            side: BorderSide(color: CColors.button),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            label: Text(skill,style: TextStyle(color: CColors.button),),
                                          )).toList(),


                                        ),
                                        SizedBox(height: 20,),
                                        ElevatedButton(onPressed: () {

                                        }, child: Text('Submit',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: CColors.button
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                weight: 20,
                                color: CColors.hinttext,
                              ),
                            ),
                          ],
                        ),

                       SizedBox(height: 16,),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: skills.map((skill) => Chip(
                            elevation: 4,
                            backgroundColor: CColors.borderside,
                            side: BorderSide(color: CColors.button),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            label: Text(skill,style: TextStyle(color: CColors.button),),
                          )).toList(),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24),

                ///experience  card=======================================================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: CColors.hinttext),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 20,
                                  weight: 20,
                                  color: CColors.button,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.add,
                              size: 20,
                              weight: 20,
                              color: CColors.hinttext,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Image.asset(
                              'assets/images/experience1.png',
                              height: 48,
                              width: 48,
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Senior Product Designer',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Senior Product Designer',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Jan 2021 - Present • 3 yrs 4 mos',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),

                            Spacer(),
                            Icon(
                              Icons.edit,
                              size: 20,
                              weight: 20,
                              color: CColors.hinttext,
                            ),
                          ],
                        ),

                        SizedBox(height: 24),

                        Row(
                          children: [
                            Image.asset(
                              'assets/images/experience1.png',
                              height: 48,
                              width: 48,
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Senior Product Designer',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Senior Product Designer',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Jan 2021 - Present • 3 yrs 4 mos',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),    //space using................................................
                            Icon(
                              Icons.edit,
                              size: 20,
                              weight: 20,
                              color: CColors.hinttext,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24),

                ///education card3=============================================================================================================================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: CColors.hinttext),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.school_outlined,
                                  size: 20,
                                  weight: 20,
                                  color: CColors.button,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Education',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.add,
                              size: 20,
                              weight: 20,
                              color: CColors.hinttext,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Image.asset(
                              'assets/images/education.png',
                              height: 48,
                              width: 48,
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stanford University',
                                  style: TextStyle(
                                    color: CColors.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'B.S. in Interaction Design',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '2014 - 2018',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),  //space use.................................
                            Icon(
                              Icons.edit,
                              size: 20,
                              weight: 20,
                              color: CColors.hinttext,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),

                ///button==================================================================================================================================
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(0xFF6E1515),
                        size: 18,
                        weight: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF6E1515),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: CColors.Card,
                    side: BorderSide(color: Color(0xFF6E1515)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
