import 'package:career_glass_app/screen/auth/password.dart';
import 'package:career_glass_app/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:career_glass_app/helpar/color.dart';

import '../dashboard/dashscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = true;
  bool? license = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.secondarybackground,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login_appbar.png',
              height: 32,
              width: 32,
            ),
            SizedBox(width: 8),
            Text(
              'CareerGlass',
              style: TextStyle(
                color: CColors.text,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: CColors.secondarybackground),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ///card=
                Container(
                  height: 670,
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
                    border: Border.all(color: CColors.hinttext),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: CColors.text,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please enter your details to sign in',
                          style: TextStyle(
                            color: CColors.primarytext,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 30),

                        ///email=
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email Address',
                                style: TextStyle(
                                  color: CColors.text,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(height: 8),

                              TextFormField(
                                style: TextStyle(color: CColors.text),
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'name@company.com',
                                  hintStyle: TextStyle(
                                    color: CColors.hinttext,
                                    fontSize: 18,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                    color: CColors.hinttext,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Enter Email or Mobile';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),

                              ///password=
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                      color: CColors.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Password(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        color: CColors.button,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),

                              TextFormField(
                                style: TextStyle(color: CColors.text),
                                controller: passwordController,
                                obscureText: _isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: '........',
                                  hintStyle: TextStyle(
                                    color: CColors.hinttext,
                                    fontSize: 18,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    size: 20,
                                    color: CColors.hinttext,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 20,
                                      color: CColors.hinttext,
                                    ),
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

                              SizedBox(height: 30),

                              ///login button=
                              SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashScreen(),));
                                    }
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: CColors.text,
                                      fontSize: 16,
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
                              SizedBox(height: 32),
                            ///divider
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: CColors.hinttext,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      color: CColors.hinttext,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: CColors.hinttext,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 32),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 54,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: CColors.secondarybackground,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/google.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                            ' Google',
                                            style: TextStyle(
                                              color: CColors.text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      height: 54,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: CColors.secondarybackground,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/google.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                            ' Apple',
                                            style: TextStyle(
                                              color: CColors.text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                        color: CColors.text,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color: CColors.button,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
