import 'package:career_glass_app/helpar/color.dart';
import 'package:career_glass_app/screen/dashboard/profile_page.dart';
import 'package:flutter/material.dart';

class EditProfileSeeker extends StatefulWidget {
  const EditProfileSeeker({super.key});

  @override
  State<EditProfileSeeker> createState() => _EditProfileSeekerState();
}

class _EditProfileSeekerState extends State<EditProfileSeeker> {
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final additionalnameController = TextEditingController();
  final pincodeController = TextEditingController();
  final countrynameController = TextEditingController();
  final citynameController = TextEditingController();

  String? selectedValue;
  String? selectedCity;

  List<String> cityList = [
    "Ahmedabad",
    "Surat",
    "Vadodara",
    "Rajkot",
    "Mumbai",
    "Delhi"
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.secondarybackground,

      appBar: AppBar(
        backgroundColor: CColors.secondarybackground,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Edit intro',
          style: TextStyle(
            color: CColors.text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Basic info',
                      style: TextStyle(color: CColors.text, fontSize: 25),
                    ),


                    SizedBox(height: 30,),


                    ///fist name==========================================================================
                    Text(
                      'First name*',
                      style: TextStyle(color: Colors.white , fontSize: 14),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      controller: firstnameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your first name',
                        hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                         )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Enter name';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

            ///second name===========================================================================================
                    Text(
                      'Second name*',
                      style: TextStyle(color: CColors.text, fontSize: 14),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      controller: secondnameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your second name',
                        hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                         )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                  ///Additional name ==========================================================
                    Text(
                      'Additional name*',
                      style: TextStyle(color: CColors.text, fontSize: 14),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      controller: additionalnameController,
                      decoration: InputDecoration(
                          hintText: 'Enter your Additional name',
                          hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Enter name';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 30),
///loation=========================================
                    Text(
                      'Location',
                      style: TextStyle(color: CColors.text, fontSize: 25),
                    ),

                    SizedBox(height: 20,),
                    Text(
                      'Country/Region*',
                      style: TextStyle(color: CColors.text, fontSize: 14),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      controller: countrynameController,
                      decoration: InputDecoration(
                          hintText: 'Enter your  country name',
                          hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
///postal code========================================================================
                    Text(
                      'Postal code',
                      style: TextStyle(color: CColors.text, fontSize: 14),
                    ),
                    SizedBox(height: 5,),


                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      controller: pincodeController,
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                          hintText: 'Enter your postal code',
                          hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                      maxLength: 6,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter PIN Code';
                        }
                        if (value.length != 6) {
                          return 'Enter valid 6-digit PIN code';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

///city====================================================================================================
                    Text(
                      'City*',
                      style: TextStyle(color: CColors.text, fontSize: 14),
                    ),
                    SizedBox(height: 5,),

                    DropdownButtonFormField<String>(
                      dropdownColor: CColors.secondarybackground,
                      value: selectedCity,
                      decoration: InputDecoration(

                        hintText: "Select City",
                        hintStyle: TextStyle(color: CColors.hint1text,fontSize: 18),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: cityList.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city,style: TextStyle(color: CColors.text),),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedCity = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select city";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 30),

///Designation=================================================================================================

                    Text('Designation', style: TextStyle(color: CColors.text, fontSize: 14)),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(color: CColors.text),
                      decoration: InputDecoration(
                        hintText: 'Enter your designation (e.g. Flutter Developer)',
                        hintStyle: TextStyle(color: CColors.hinttext, fontSize: 18),
                        prefixIcon: Icon(Icons.work_outline, size: 20, color: CColors.hinttext),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter designation';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    
                    
                    SizedBox(
                      height: 46,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));

                      }, child: Text('Save',style: TextStyle(color: CColors.text,fontWeight: FontWeight.w700,fontSize: 20),),
                                         style: ElevatedButton.styleFrom(
                       backgroundColor: CColors.button,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                         ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
