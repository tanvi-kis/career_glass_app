import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';

import 'login_screen.dart';


class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();

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
                  height: 500,
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
                          SizedBox(height: 5,),
                        Text('Enter your email to receive a password \nreset link.',style: TextStyle(color: CColors.hinttext,fontWeight: FontWeight.w600,fontSize: 14),),


                        SizedBox(height: 24,),

                        Text('Email Address',style: TextStyle(color: CColors.hinttext,fontSize: 12,fontWeight:FontWeight.w600),),
                        SizedBox(height: 5,),

                        Form(
                          key: _formKey,
                            child: Column(
                              children: [
  ///email=
                                TextFormField(
                                  style: TextStyle(color:CColors.text),
                                  controller:emailController ,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: CColors.hinttext,fontSize: 16),
                                    hintText: 'name@example.com',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      )
                                  ),
                                  validator: (value) {
                                    if(value==null || value.isEmpty){
                                      return 'enter valid email';
                                    }
                                    return null;
                                  },
                                )

                              ],
                            ),
                          ),

                      SizedBox(height: 24,),
 ///button=
                        SizedBox(
                          height: 56,
                          child: ElevatedButton(onPressed: () {
                            if(_formKey.currentState!.validate()){
                            }

                          }, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Send Link',style: TextStyle(color: CColors.text,fontSize: 16,fontWeight: FontWeight.w600),),
                              Icon(Icons.send,color: CColors.text,size: 12,),
                            ],
                          ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.button,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)
                                )
                            ),
                          ),
                        ),
                       SizedBox(height: 24,),
///divider=
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                        SizedBox(height: 20,),
                        
///back=
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back,size: 16,color: CColors.hinttext,weight: 16,),

                            SizedBox(width: 5,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              },
                                child: Text('Back to login',style: TextStyle(color: CColors.hinttext,fontSize: 16),)),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Having trouble? ',style: TextStyle(color: CColors.hinttext,fontSize: 16),),
                    Text('Contact Support',style: TextStyle(color: CColors.button,fontSize: 16),)
                  ],
                )
                
              ],
            ),
          ),
        ),
      )
    );
  }
}
