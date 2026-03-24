import 'package:career_glass_app/screen/auth/password.dart';
import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final pinController=TextEditingController();
  final focusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.secondarybackground,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: CColors.secondarybackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
            ///card=
                Container(
                  height:700 ,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          CColors.cardbackground,
                          CColors.onboarding1background,
                        ],
                        stops: [0.0, 2.0],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: CColors.hinttext)
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              color: CColors.button,
                              borderRadius: BorderRadius.circular(24)
                          ),
                          child: Icon(Icons.email_outlined,color: CColors.text,),
                        ),
                        SizedBox(height: 5,),
                        Center(
                            child: Text('CareerGlass',style: TextStyle(color: CColors.button,fontSize: 20,fontWeight: FontWeight.w700),)),
                      SizedBox(height: 32,),
                       Text('Verify Your Email',style: TextStyle(color: CColors.text,fontWeight: FontWeight.w700,fontSize: 30),),
                      
                        Text('Enter the 4-digit code sent to your email.',style: TextStyle(color: CColors.hinttext,fontSize: 16),textAlign:TextAlign.center),
                         SizedBox(height: 32,),

                        Pinput(
                          length: 4,
                          controller: pinController,
                          obscureText: true,
                          //obscuringWidget: Text('*'),///any character use
                          //autofocus: true,///show keyboard use
                          focusNode: FocusNode(),

                        ),

                        SizedBox(height: 45,),

                        Text("Didn't receive the code?",style: TextStyle(color: CColors.hinttext,fontSize: 14),),

                        SizedBox(height:8 ,),

                        TimerCountdown(
                         // timeTextStyle: TextStyle(color: CColors.text),
                            endTime:DateTime(
                              0,0,0,2,00

                            ),
                        ),

                        SizedBox(height: 50,),
                      
///button=
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Password(),));
                            }, child: Text('Verify',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w700),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.button,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)
                            )
                          )),
                        ),


                      ],
                    ),
                  ) ,
                )
              ],
            ),
          ), 
        ),
      ),
    );

  }
}
