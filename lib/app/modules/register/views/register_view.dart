import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galih_123/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff68AEBD),
      body: SafeArea(
        child: Center(

          child: Column(
            children: <Widget>[
              SizedBox(height: 70,),
              Text("Perpusku",style: TextStyle(color: Colors.black,fontSize: 40),),
              Image.asset('assets/buku.png',),
              SizedBox(height: 20,),
              Text("Welcome to PERPUSKU login page",style: TextStyle(color: Colors.blueAccent),),
              Text("open-source intergrated library system", style: TextStyle(color: Colors.black,fontSize: 15,),),
              SizedBox(height: 20,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.namalengkapController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            prefixIcon: Icon(Iconsax.direct_down5),
                            labelText: 'nama lengkap',
                            //password

                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controller.usernameController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            prefixIcon: Icon(Iconsax.direct1),
                            labelText: 'username',
                            //password

                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            prefixIcon: Icon(Iconsax.password_check),
                            labelText: 'password',
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            prefixIcon: Icon(Iconsax.direct),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: controller.alamatController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            prefixIcon: Icon(Iconsax.location),
                            labelText: 'Alamat',
                          ),
                        ),
                        SizedBox(height: 20,),
                        // GestureDetector(
                        //   child: Container(
                        //     height: 50,
                        //     width: 300,
                        //     decoration: BoxDecoration(
                        //         color: Color(0xff86B5D8),
                        //         borderRadius: BorderRadius.circular(10)
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         SizedBox(height: 8,),
                        //         Text('REGISTER',style: TextStyle(fontSize: 25,color: Colors.black,),),
                        //       ],
                        //     ),
                        //
                        //   ),
                        //   onTap: (){
                        //     controller.regist();
                        //   },
                        // ),
                        Obx(
                              () => controller.loading.value
                              ? CircularProgressIndicator()
                              : Row(
                            children: [
                              ElevatedButton(onPressed: (){
                                controller.regist();
                              }, child: Text("Sign Up")
                              )
                              // ElevatedButton(
                              //   onPressed: () {
                              //     controller.regist();
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //
                              //   child: Text('Sign Up'),
                              // ),
                              //                               )
                                                              ],
                          ),
                        ),

                      ],
                    ),
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
