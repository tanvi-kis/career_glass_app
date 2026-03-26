import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: CColors.secondarybackground,
        centerTitle: true,
        title: Text('Profile',style: TextStyle(color: CColors.text,fontSize: 18,fontWeight: FontWeight.w700,),),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
        actions: [
          Icon(Icons.settings,color: CColors.text,size: 20,)
        ],
        
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaAsJaTD22xdCgfrjTCJzLQmODiZ-tYaXisA&s'),
                  ),
                ),
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
                          onPressed: () {},
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
                    ), SizedBox(width: 6,),
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
                    side: BorderSide(color: CColors.hinttext)
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
                                Icon(Icons.file_present_outlined,size: 20,weight: 20,color: CColors.button,),
                                SizedBox(width: 8,),
                                Text('Resume',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),

                              ],
                            ),
                            Text('Update',style: TextStyle(color: CColors.button,fontSize: 14,fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 16,),

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
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                     color: CColors.cardbackground,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(Icons.picture_as_pdf_outlined,color: CColors.button,size: 20,weight: 20,),
                                ),
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.center ,
                                  children: [
                                    Text('Uploaded Oct 12, 2023',style: TextStyle(color: CColors.hinttext,fontSize: 14),)

                                  ],
                                ),
                               Icon(Icons.file_download_outlined,color: CColors.hinttext,size: 20,weight: 20,)

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 28,),
///skill  card============================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: CColors.hinttext)
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
                                Icon(Icons.psychology_outlined,size: 20,weight: 20,color: CColors.button,),
                                SizedBox(width: 8,),
                                Text('Skills',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),
                              ],
                            ),
                            Icon(Icons.add,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24,),
///experience  card=======================================================================================
                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: CColors.hinttext)
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
                                Icon(Icons.shopping_bag_outlined,size: 20,weight: 20,color: CColors.button,),
                                SizedBox(width: 8,),
                                Text('Experience',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),
                              ],
                            ),
                            Icon(Icons.add,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),
                        SizedBox(height: 16,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Image.asset('assets/images/experience.png',height: 48,width: 48,),
                            SizedBox(width: 16,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Senior Product Designer',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text('Senior Product Designer',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
                                Text('Jan 2021 - Present • 3 yrs 4 mos',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            SizedBox(width: 140,),
                            Icon(Icons.edit,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),

                        SizedBox(height: 24,),

                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/experience.png',height: 48,width: 48,),
                            SizedBox(width: 16,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Senior Product Designer',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text('Senior Product Designer',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
                                Text('Jan 2021 - Present • 3 yrs 4 mos',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            SizedBox(width: 140,),


                            Icon(Icons.edit,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),

                      ],
                    ),
                  ),

                ),

                SizedBox(height: 24,),
 ///education card3=============================================================================================================================================================

                Card(
                  elevation: 2,
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: CColors.hinttext)
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
                                Icon(Icons.school_outlined,size: 20,weight: 20,color: CColors.button,),
                                SizedBox(width: 8,),
                                Text('Education',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),
                              ],
                            ),
                            Icon(Icons.add,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),
                        SizedBox(height: 16,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Image.asset('assets/images/education.png',height: 48,width: 48,),
                            SizedBox(width: 16,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Stanford University',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text('B.S. in Interaction Design',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
                                Text('2014 - 2018',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            SizedBox(width: 140,),
                            Icon(Icons.edit,size: 20,weight: 20,color: CColors.hinttext,),
                          ],
                        ),

                      ],
                    ),
                  ),

                ),

                SizedBox(height: 40,),
///button==================================================================================================================================
                OutlinedButton(onPressed:  () {
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout,color: Colors.red,size: 18,weight: 18,),
                    SizedBox(width: 8,),
                    Text('Logout',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16),),
                  ],
                ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: CColors.Card,
                    side: BorderSide(
                     // color: Color(0xffbEF444433)
                     color: Colors.red,
                    )

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
