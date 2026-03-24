import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';


class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.secondarybackground,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: CColors.secondarybackground
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
        
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: CColors.button,
                    borderRadius: BorderRadius.circular(24)
                  ),
                ),
                SizedBox(height: 16,),
                Text('CareerGlass',style: TextStyle(color: CColors.text,fontSize: 30,fontWeight: FontWeight.w700),),
                SizedBox(height: 5,),
                Text('Recovery Assistant',style: TextStyle(color: CColors.hinttext,fontSize: 18),),
        
                SizedBox(height: 30,),
        
                ///card
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient:LinearGradient(
                          colors:[
                            CColors.cardbackground,
                            CColors.onboarding1background
                          ],
                        begin: Alignment.topCenter,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: CColors.hinttext)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Forgot password?',style: TextStyle(color: CColors.text,fontWeight: FontWeight.w600,fontSize: 20),),
                        Text('Enter your email to receive a password \nreset link.',style: TextStyle(color: CColors.hinttext,fontWeight: FontWeight.w600,fontSize: 14),)
                        
                      ],
                    ),
                  ),
                ),

        
        
                
              ],
        
            ),
          ),
        
        ),
      )

    );
  }
}
