import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {

  List<Map<String,dynamic>> detailList=[
    {
      "image":'assets/images/detail_pro1.png',
      "name":'Description',
      "title":'Leading the way in transparent care…',
    },
    {
      "image":'assets/images/detail_pro2.png',
      "name":'Website',
      "title":'careerglass.io',
    },
    {
      "image":'assets/images/detail_pro3.png',
      "name":'Company Size',
      "title":'50-200 Employees',
    },
  ];
  List<Map<String,dynamic>> detail= [
    {
      "image":'assets/images/notification.png',
      "name":'Notification Settings',
    },
    {
      "image":'assets/images/privacy.png',
      "name":'Privacy & Security',
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              ///image=====================================================================

              Center(
                  child: Image.asset('assets/images/profile_img.png',height: 128,width: 128,)
              ),
        ///text============
              Text('CareerGlass Inc.',style: TextStyle(color: CColors.text,fontSize: 24,fontWeight: FontWeight.w700),),
              Text('Tech & Software Development',style: TextStyle(color: CColors.hinttext,fontSize: 16,fontWeight: FontWeight.w500),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,color: CColors.hinttext,size: 14,),
                  Text('San Francisco, CA',style: TextStyle(color: CColors.hinttext,fontSize: 14,fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(height: 32,),
///card==================================================================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 75,
                    width: 111,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: CColors.Card,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('24',style: TextStyle(color: CColors.button,fontWeight: FontWeight.w700,fontSize: 18),),
                            Text('Active Jobs',style: TextStyle(color: CColors.hinttext,fontWeight: FontWeight.w400,fontSize: 15),),

                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 75,
                    width: 111,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: CColors.Card,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('158',style: TextStyle(color: CColors.button,fontWeight: FontWeight.w700,fontSize: 18),),
                            Text('Applicants',style: TextStyle(color: CColors.hinttext,fontWeight: FontWeight.w400,fontSize: 15),),

                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 75,
                    width: 111,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: CColors.Card,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('4.8',style: TextStyle(color: CColors.button,fontWeight: FontWeight.w700,fontSize: 18),),
                            Text('Rating',style: TextStyle(color: CColors.hinttext,fontWeight: FontWeight.w400,fontSize: 15),),

                          ],
                        ),
                      ),

                    ),
                  )
                ],
              ),
          SizedBox(height: 32,),
///company detail====================================================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Company Details',
                    style: TextStyle(
                      color: CColors.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Edit All',
                    style: TextStyle(
                      color: CColors.button,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16,),


              ListView.builder(
                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                itemCount: detailList.length,
                itemBuilder:  (context, index) {
                  return
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          child: Card(
                            color: CColors.Card,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(detailList[index]['image'],height: 40,width: 35,),
                                      SizedBox(width: 12,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(detailList[index]['name'],style: TextStyle(color: CColors.hinttext,fontSize: 12),),
                                          Text(detailList[index]['title'],style: TextStyle(color: CColors.text,fontSize: 14,fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                      Spacer(),

                                      Icon(Icons.arrow_forward_ios_outlined,color: CColors.hinttext,size: 10,)
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ),
                        ),
                      );

              },),

              SizedBox(height: 40,),


/////////////////////////////////////////////////////////////////////////////



              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: detail.length,
                itemBuilder:  (context, index) {
                  return
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child:
                        Card(
                          color: CColors.Card,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(detail[index]['image'],height: 40,width: 35,),
                                    SizedBox(width: 12,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(detail[index]['name'],style: TextStyle(color: CColors.text,fontSize: 14),),
                                      ],
                                    ),
                                    Spacer(),

                                    Icon(Icons.arrow_forward_ios_outlined,color: CColors.hinttext,size: 10,)
                                  ],
                                )
                              ],
                            ),
                          ),

                        ),
                      ),
                    );

                },),


              SizedBox(height: 10,),

              Card(
                color: CColors.Card,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: Colors.red, // 👈 aa tamari border color
                    width: 1,        // optional thickness
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/logout.png',height: 40,width: 35,color: Colors.red,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sign Out',style: TextStyle(color: Colors.red,fontSize: 14),),
                            ],
                          ),
                          Spacer(),

                          Icon(Icons.arrow_forward_ios_outlined,color: CColors.hinttext,size: 10,)
                        ],
                      )
                    ],
                  ),
                ),

              ),

            ],
          ),
        ),
      ),

    );
  }
}
