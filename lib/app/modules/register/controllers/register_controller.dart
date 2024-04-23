import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController namalengkapController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final loading = false.obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  regist() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //nge close keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              'nama_lengkap': namalengkapController.text.toString(),
              'username': usernameController.text.toString(),
              'password': passwordController.text.toString(),
              'email': emailController.text.toString(),
              'alamat': alamatController.text.toString(),
            });
        if (response.statusCode == 200) {
          Get.toNamed(Routes.LOGIN);
        } else {
          Get.snackbar('Sorry', 'Register Gagal', backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar('Sorry', '${e.response?.data['message']}',
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}