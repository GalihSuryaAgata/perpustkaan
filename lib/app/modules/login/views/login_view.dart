import 'package:flutter/material.dart';
import 'package:galih_123/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
              SizedBox(height: 50,),
              Text("Welcome to PERPUSKU register page",style: TextStyle(color: Colors.blueAccent),),
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

                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff86B5D8),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 8,),
                              // Text('Login',style: TextStyle(fontSize: 25,color: Colors.white,),),
                              TextButton(onPressed: () {
                                controller.login();

                              }, child:Text('Login',style: TextStyle(fontSize: 25,color: Colors.white,),),),

                            ],
                          ),
                        ),
                              SizedBox(height: 20,),
                        Text("Welcome to PERPUSKU register page",style: TextStyle(color: Colors.blueAccent),),

                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xff86B5D8),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 8,),


                              // Text('Login',style: TextStyle(fontSize: 25,color: Colors.white,),),
                              TextButton(onPressed: () {
                                Get.toNamed(Routes.REGISTER);


                              }, child:Text('Register',style: TextStyle(fontSize: 25,color: Colors.white,),),),

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
