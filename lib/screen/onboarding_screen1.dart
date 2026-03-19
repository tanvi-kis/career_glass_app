import 'package:career_glass_app/helpar/color.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {

  PageController controller = PageController();


  List<Map<String,dynamic>>pages=[
    {
      "image":"assets/images/careerglass1.png",
      "title":"Find Your Dream \nJob",
      "description":"Discover thousands \n opportunities tailored to your\n skills and preferences.",
     "title_button":'Next'
    },
    {
      "image":"assets/images/careerglass2.png",
      "title":"Showcase Your Talent",
      "description":"Build a professional profile that gets \n noticed by top companies\nworldwide. Let your skills speak for\nthemselves.",
      "title_button":'Next'
    },
    {
      "image":"assets/images/carrerglass3.png",
      "title":"Get Hired Fast",
      "description":"Connect directly with employers and track\nyour applications in real-time.",
      "title_button":'Get Started',
    }
    ];


  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: CColors.onboarding1background,
        iconTheme: IconThemeData(color: Colors.white),
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CareerGlass',style: TextStyle(color: CColors.text,fontSize: 20,fontWeight: FontWeight.w700)),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
              child: Text('Skip',style: TextStyle(color: CColors.primarytext,fontSize: 14,fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ) ,

      body:
      Container(
        decoration: BoxDecoration(
            color: CColors.onboarding1background
          // gradient: LinearGradient(
          //   colors: [
          //     CColors.onboarding1background,
          //     CColors.onboarding2background
          //
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(), ///  swip close use

                  onPageChanged: (index) {
                    setState(() {
                      currentPage=index;
                    });

                  },
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ///image=
                          Image.asset(pages[index]['image'],height: 342,width: 342,),

                          SizedBox(
                            height: 350,
                            width: double.infinity,
                            child:
                            ///card
                            Expanded(
                              child: Card(
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    side: BorderSide(color: CColors.borderside)
                                ),
                                color: CColors.cardbackground,
                                elevation: 5.0,
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(pages[index]['title'],textAlign:TextAlign.center,style: TextStyle(color: CColors.text,fontSize: 30,fontWeight: FontWeight.w700),),
                                      SizedBox(height: 20,),

                                      Text(pages[index]['description'],textAlign:TextAlign.center,style: TextStyle(color: CColors.primarytext,fontSize: 16),),
                                      SizedBox(height: 10,),

                                      ///icon=
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          pages.length,
                                              (index) => Container(
                                            margin: EdgeInsets.all(5),
                                            width: currentPage == index ? 12 : 8,
                                            height: currentPage == index ? 12 : 8,
                                            decoration: BoxDecoration(
                                              color: currentPage == index
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // SizedBox(height: 20,),
                                      Spacer(),

                                      ///button
                                      SizedBox(
                                        height: 56,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {

                                            if(currentPage<pages.length -1){     /// if use o last page nhi to next page jse
                                              controller.nextPage(
                                                  duration: Duration(milliseconds: 300),
                                                  curve: Curves.easeIn);
                                            }
                                            else {                             /// onboarding par  nhi ave login screen pr next
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen(),),);
                                            }
                                          },
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(pages[index]['title_button'],style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w500),),
                                              Icon(Icons.arrow_forward,color:CColors.text,size: 16 ,)
                                            ],
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: CColors.button,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16)
                                              )
                                          ),


                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
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
}
