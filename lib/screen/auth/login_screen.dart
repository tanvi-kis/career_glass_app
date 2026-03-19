import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';

// test 
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formKey=GlobalKey<FormState>();

  final emailController=TextEditingController();

  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.secondarybackground,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_appbar.png',height: 32,width: 32,),
            SizedBox(width: 8,),
            Text('CareerGlass',style: TextStyle(color: CColors.text,fontSize: 20,fontWeight: FontWeight.w700),),

          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: CColors.secondarybackground,

        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              ///card=

              Container(
                height:600 ,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      CColors.card2background,
                      CColors.cardbackground,
                    ],
                    stops: [0.0, 1.0],

                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Text('Welcome Back',style: TextStyle(color: CColors.text,fontSize: 30,fontWeight: FontWeight.w700),),
                      SizedBox(height: 8,),
                      Text('Please enter your details to sign in',style: TextStyle(color: CColors.primarytext,fontSize: 16,),),

                      SizedBox(height: 30,),
                      ///email=
                      Form(
                        key:_formKey ,
                        child: Column(
                          children: [
                            Text('Email Address',style: TextStyle(color: CColors.text,fontSize: 14),),

                            SizedBox(height: 8,),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'name@company.com',
                                  hintStyle: TextStyle(color: CColors.hinttext,fontSize: 16),
                                  prefixIcon: Icon(Icons.email_outlined,size: 20,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  )

                              ),
                              validator: (value) {


                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
