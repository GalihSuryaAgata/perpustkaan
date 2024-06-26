import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galih_123/app/data/constant/endpoint.dart';
import 'package:galih_123/app/data/provider/api_provider.dart';
import 'package:galih_123/app/data/provider/storage_provider.dart';
import 'package:galih_123/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  bool passwordObscured = true;

  //TODO: Implement LoginController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status == 'logged') {
      Get.offAllNamed(Routes.HOME);
    }
  }

  // cek status login jika sudah login akan kedirect kemenu home

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
          data: {
            "username": usernameController.text.toString(),
            "password": passwordController.text.toString(),
          },
        );

        if (response.statusCode == 200) {
          await StorageProvider.write(StorageKey.status, "logged");
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    }  catch (e) {
      loading(false);
      print(e.toString());
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

// void increment() => count.value++;
}