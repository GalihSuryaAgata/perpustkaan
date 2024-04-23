import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response/response_book.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController  with StateMixin<List<DataBook>> {
  var rekomendasiBookList = <DataBook>[].obs;
  var ratingTertinggiBookList = <DataBook>[].obs;
  var BookList = <DataBook>[].obs;
  var filteredList = <DataBook>[].obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    loading(true);
    try {

      final responseRekomendasi = await ApiProvider.instance().get(Endpoint.recommended);
      final responseRatingTertinggi = await ApiProvider.instance().get(Endpoint.rating);

      if (responseRekomendasi.statusCode == 200 && responseRatingTertinggi.statusCode == 200) {

        final List<DataBook> booksRekomendasi = (responseRekomendasi.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();

        final List<DataBook> booksRatingTertinggi = (responseRatingTertinggi.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();

        rekomendasiBookList.assignAll(booksRekomendasi);
        ratingTertinggiBookList.assignAll(booksRatingTertinggi);

      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  getSearch(String query) async {
    loading(true);
    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final List<DataBook> responseBooks = (response.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();
        if (query.isNotEmpty) {
          filteredList.assignAll(responseBooks.where((book) => book.judul!.toLowerCase().contains(query.toLowerCase())).toList());
        } else {
          filteredList.assignAll(responseBooks);
        }
      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}