// import 'package:flutter/material.dart';
// import 'package:career_glass_app/helpar/color.dart';
//
// import 'forgot_password.dart';
// import 'login_screen.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey=GlobalKey<FormState>();
//
//   final emailController=TextEditingController();
//   final nameController=TextEditingController();
//   final passwordController=TextEditingController();
//
//   bool _isPasswordVisible = true;
//   bool?license=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CColors.secondarybackground,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             color: CColors.secondarybackground,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//  ///card=
//                 Container(
//                   height:800 ,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       gradient: RadialGradient(
//                       colors: [
//                         CColors.cardbackground,
//                         CColors.onboarding1background,
//                       ],
//                       stops: [0.0, 2.0],
//                     ),
//                     borderRadius: BorderRadius.circular(24),
//                     border: Border.all(color: CColors.hinttext)
//
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(32),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 51,
//                           width: 64,
//                           decoration: BoxDecoration(
//                               color: CColors.button,
//                               borderRadius: BorderRadius.circular(24)
//                           ),child: Icon(Icons.email_outlined,color: CColors.text),
//
//                         ),
//
//                         SizedBox(height: 25,),
//                         Text('Join CareerGlass',style: TextStyle(color: CColors.text,fontSize: 30,fontWeight: FontWeight.w700),),
//                         SizedBox(height: 8,),
//                         Text('Create your professional profile today',style: TextStyle(color: CColors.primarytext,fontSize: 16,),),
//
//                         SizedBox(height: 30,),
// ///form=
//                         Form(
//                           key:_formKey ,
//                           child:
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//   ///name=
//                               Text('Full Name',style: TextStyle(color: CColors.text,fontSize: 14),),
//                               SizedBox(height: 8,),
//                               TextFormField(
//                                 style: TextStyle(color:CColors.text),
//                                 controller: nameController,
//                                 decoration: InputDecoration(
//                                     hintText: 'Enter your full name',
//                                     hintStyle: TextStyle(color: CColors.hinttext,fontSize: 18),
//                                     prefixIcon: Icon(Icons.email_outlined,size: 20,color: CColors.hinttext,),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(24),
//                                     )
//                                 ),
//                                 validator: (value) {
//                                   if(value==null || value.isEmpty ){
//                                     return 'Enter name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 20,),
//  ///email==
//                               Text('Email Address',style: TextStyle(color: CColors.text,fontSize: 14),),
//                               SizedBox(height: 8,),
//                               TextFormField(
//                                 style: TextStyle(color:CColors.text),
//                                 controller: emailController,
//                                 decoration: InputDecoration(
//                                     hintText: 'name@company.com',
//                                     hintStyle: TextStyle(color: CColors.hinttext,fontSize: 18),
//                                     prefixIcon: Icon(Icons.email_outlined,size: 20,color: CColors.hinttext,),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(24),
//                                     )
//                                 ),
//                                 validator: (value) {
//                                   if(value==null || value.isEmpty || !value.contains('@')){
//                                     return 'Enter Email or Mobile';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 20,),
//  ///password=
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Password",style: TextStyle(color: CColors.text,fontSize: 14),),
//                                   Text('Forgot password?',style: TextStyle(color: CColors.text,fontSize: 14),)
//                                 ],
//                               ),
//                               SizedBox(height: 8,),
//
//                               TextFormField(
//                                 style: TextStyle(color:CColors.text),
//                                 controller: passwordController,
//                                 obscureText:_isPasswordVisible,
//                                 decoration: InputDecoration(
//                                     hintText: 'Create a strong password',
//                                     hintStyle: TextStyle(color: CColors.hinttext,fontSize: 18),
//                                     prefixIcon: Icon(Icons.lock_outline_rounded ,size: 20,color: CColors.hinttext,),
//                                     suffixIcon: IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             _isPasswordVisible=!_isPasswordVisible;
//                                           });
//                                         },
//                                         icon: Icon(_isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,size: 20,color: CColors.hinttext,)),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(24),
//                                     )
//                                 ),
//                                 validator: (value) {
//                                   if(value==null || value.isEmpty ){
//                                     return 'Enter password';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 30,),
//  ///signin button=
//                               SizedBox(
//                                 height: 56,
//                                 width: double.infinity,
//                                 child: ElevatedButton(onPressed: () {
//                                   if(_formKey.currentState!.validate()){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
//                                   }
//                                 }, child: Text('Sign Up',style: TextStyle(color: CColors.text,fontSize: 24),),
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: CColors.button,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(24)
//                                       )
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 32,),
//
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Divider(
//                                       color: Colors.grey,
//                                       thickness: 1,
//
//                                     ),
//                                   ),
//
//                                   Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(1),
//                                         color:CColors.borderside
//                                       ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Text('Already have an account?',style: TextStyle(color: CColors.hinttext,fontSize: 14,fontWeight: FontWeight.w700),),
//                                         )),
//
//                                   Expanded(
//                                     child: Divider(
//                                       color: Colors.grey,
//                                       thickness: 1,
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//
//                               SizedBox(height: 20,),
//
//                               Center(
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//
//                                     },
//                                       child: Text('Log in to CareerGlass',style: TextStyle(color: CColors.button,fontSize: 14,fontWeight: FontWeight.w500),)))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 30,),
//                 Text('Join 10,000+ professionals finding careers',style: TextStyle(color: CColors.hinttext,fontSize: 15,fontWeight: FontWeight.w600),)
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';

import 'forgot_password.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = true;
  bool? license = false;

  // Job Seeker / Recruiter role
  String userType = "";

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
                /// Card Container
                Container(
                  height: 850, // Adjusted height to fit Role selection
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
                      border: Border.all(color: CColors.hinttext)),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Container(
                          height: 51,
                          width: 64,
                          decoration: BoxDecoration(
                              color: CColors.button,
                              borderRadius: BorderRadius.circular(24)),
                          child: Icon(Icons.email_outlined,
                              color: CColors.text),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Join CareerGlass',
                          style: TextStyle(
                              color: CColors.text,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Create your professional profile today',
                          style: TextStyle(
                            color: CColors.primarytext,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 30),

                        /// Form
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Full Name
                              Text(
                                'Full Name',
                                style: TextStyle(
                                    color: CColors.text, fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                style: TextStyle(color: CColors.text),
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  hintStyle: TextStyle(
                                      color: CColors.hinttext, fontSize: 18),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    size: 20,
                                    color: CColors.hinttext,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),

                              /// Email
                              Text(
                                'Email Address',
                                style: TextStyle(
                                    color: CColors.text, fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                style: TextStyle(color: CColors.text),
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'name@company.com',
                                  hintStyle: TextStyle(
                                      color: CColors.hinttext, fontSize: 18),
                                  prefixIcon: Icon(Icons.email_outlined,
                                      size: 20, color: CColors.hinttext),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Enter Email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),

                              /// Password
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        color: CColors.text, fontSize: 14),
                                  ),
                                  Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: CColors.text, fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                style: TextStyle(color: CColors.text),
                                controller: passwordController,
                                obscureText: _isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Create a strong password',
                                  hintStyle: TextStyle(
                                      color: CColors.hinttext, fontSize: 18),
                                  prefixIcon: Icon(Icons.lock_outline_rounded,
                                      size: 20, color: CColors.hinttext),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 20,
                                        color: CColors.hinttext),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),

                              /// Job Role Selection (Seeker / Recruiter)
                              Text(
                                'I am a',
                                style: TextStyle(
                                    color: CColors.text, fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Column(
                                children: [
                                  RadioListTile<String>(
                                    title: Text("Job Seeker",
                                        style:
                                        TextStyle(color: CColors.text)),
                                    value: "seeker",
                                    groupValue: userType,
                                    onChanged: (value) {
                                      setState(() {
                                        userType = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: Text("Recruiter",
                                        style:
                                        TextStyle(color: CColors.text)),
                                    value: "recruiter",
                                    groupValue: userType,
                                    onChanged: (value) {
                                      setState(() {
                                        userType = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (userType.isEmpty)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 16.0, top: 4),
                                  child: Text(
                                    "Please select a role",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                                ),
                              SizedBox(height: 20),

                              /// Sign Up Button
                              SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate() &&
                                        userType.isNotEmpty) {
                                      // Proceed to next screen / save data
                                      print("Role: $userType");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword(),
                                        ),
                                      );
                                    } else if (userType.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text(
                                              "Please select Job Seeker or Recruiter")));
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: CColors.text, fontSize: 24),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CColors.button,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32),

                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(1),
                                          color: CColors.borderside),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                              color: CColors.hinttext,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    'Log in to CareerGlass',
                                    style: TextStyle(
                                        color: CColors.button,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Join 10,000+ professionals finding careers',
                  style: TextStyle(
                      color: CColors.hinttext,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}