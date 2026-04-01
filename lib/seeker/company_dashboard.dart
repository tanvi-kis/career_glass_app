import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({super.key});

  @override
  State<CompanyDashboard> createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends State<CompanyDashboard> {
  List<Map<String, dynamic>> appList = [
    {
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRgEYjmxbtUvj_lFZq3EsS2thfNZMEkv89iw&s',
      "name": 'Alex Rivera',
      "job_type": 'Senior UX Designer',
      'type': 'New',
      'time': '2h ago',
    },
    {
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF2yaox2cALIq_yyd-9qEyovEsficJr7X9QQ&s',
      "name": 'Jordan Smith',
      "job_type": 'Product Manager',
      'type': 'Reviewed',
      'time': '5h ago',
    },
    {
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScMFTFjYCu6HWnfspcstISJx39q5Ur1F936Q&s',
      "name": 'Casey Chen',
      "job_type": 'Frontend Engineer',
      'type': 'New',
      'time': 'Yesterday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back, Sarah',
                style: TextStyle(
                  color: CColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Here is what's happening with your listings today.",
                style: TextStyle(
                  color: CColors.hinttext,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              ///card=====================================================================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: CColors.Card,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/co_dash1.png',
                                  height: 32,
                                  width: 32,
                                ),
                                Text(
                                  '+2',
                                  style: TextStyle(
                                    color: Color(0xff34D399),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Active Jobs',
                              style: TextStyle(
                                color: CColors.hinttext,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                color: CColors.text,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///card2================================================================================================
                  Expanded(
                    child: Card(
                      color: CColors.Card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/co_dash2.png',
                                  height: 32,
                                  width: 32,
                                ),
                                Text(
                                  '+15%',
                                  style: TextStyle(
                                    color: Color(0xff34D399),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Applications',
                              style: TextStyle(
                                color: CColors.hinttext,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '458',
                              style: TextStyle(
                                color: CColors.text,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),

              ///card3================================================================
              SizedBox(
                height: 54,
                width: double.infinity,
                child: Card(
                  color: CColors.Card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: CColors.button,
                              size: 20,
                            ),
                            SizedBox(width: 12),

                            Text(
                              'Post a new job opening',
                              style: TextStyle(
                                color: CColors.text,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: CColors.hinttext,
                          size: 12,
                          weight: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),

              ///recent application==============================================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Applicants',
                    style: TextStyle(
                      color: CColors.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: CColors.button,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              ///card=================================================================
              ListView.builder(
                itemCount: appList.length,
                shrinkWrap: true, // ✅ add this
                physics:
                    NeverScrollableScrollPhysics(), // ✅ disable inner scroll
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Card(
                      color: CColors.Card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // Profile Image=========================================================
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                appList[index]['image'],
                              ),
                            ),
                            //  IMPORTANT FIX============================================================
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appList[index]['name'],
                                      style: TextStyle(
                                        color: CColors.text,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      appList[index]['job_type'],
                                      style: TextStyle(
                                        color: CColors.hinttext,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right side=============================================================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  appList[index]['type'],
                                  style: TextStyle(
                                    color: CColors.button,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  appList[index]['time'],
                                  style: TextStyle(
                                    color: CColors.hinttext,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
