import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/model/response/response_book.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataBook>> {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final TextEditingController user_idController = TextEditingController();
  // final TextEditingController book_idController = TextEditingController();
  // final TextEditingController tanggal_pinjamController = TextEditingController();
  // final TextEditingController tanggal_kembaliController = TextEditingController();
  // final loading = false.obs;

  // final count = 0.obs;
  var rekomendasiBookList = <DataBook>[].obs;
  var ratingTertinggiBookList = <DataBook>[].obs;

  final loading = false.obs;

  final ScrollController scrollController = ScrollController();
  var isScrollingDown = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isScrollingDown.value = false;
      } else if (direction == ScrollDirection.reverse) {
        isScrollingDown.value = true;
      }
    });
    getDetailBuku();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
    print("asdykasdyas : ${Get.parameters['id'].toString()}");
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
  // addpinjam() async {
  //   loading(true);
  //   try {
  //     FocusScope.of(Get.context!).unfocus(); //nge close keyboard
  //     formKey.currentState?.save();
  //     if (formKey.currentState!.validate()) {
  //       final response = await ApiProvider.instance().post(Endpoint.pinjam,
  //           data: {
  //             'tanggal_pinjam': tanggal_pinjamController.text.toString(),
  //             'tanggal_kembali': tanggal_kembaliController.text.toString(),
  //             'user_id': int.parse(StorageProvider.read(StorageKey.idUser)),
  //             'book_id': int.parse(Get.parameters['id'].toString())
  //           });
  //       if (response.statusCode == 201) {
  //         Get.back();
  //       } else {
  //         Get.snackbar('Sorry', 'Login Gagal', backgroundColor: Colors.orange);
  //       }
  //     }
  //     loading(false);
  //   } on dio.DioException catch (e) {
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar('Sorry', '${e.response?.data['message']}',
  //             backgroundColor: Colors.orange);
  //       }
  //     } else {
  //       Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
  //   }
  // }

//   getDetailBuku() async {
//     change(null, status: RxStatus.loading());
//     try {
//       final response = await ApiProvider.instance().get(Endpoint.book+"/${StorageProvider.read(StorageKey.idBuku)}" );
//       if (response.statusCode == 200) {
//         final ResponseBook responseBook = ResponseBook.fromJson(response.data);
//         if (responseBook.data!.isEmpty) {
//           change(null, status: RxStatus.empty());
//         } else {
//           change(responseBook.data, status: RxStatus.success());
//         }
//       } else {
//         change(null, status: RxStatus.error("Gagal mengambil data"));
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         if (e.response?.data != null) {
//           change(
//               null, status: RxStatus.error("${e.response?.data['message']}"));
//         }
//       } else {
//         change(null, status: RxStatus.error(e.message ?? ""));
//       }
//     } catch (e) {
//       change(null, status: RxStatus.error(e.toString()));
//     }
//   }
// }



  getDetailBuku() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if(responseBook.data!.isEmpty){
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error('Gagal mengambil data'));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error('cek' + (e.message ?? '')));
      }
    } catch (e) {
      change(null, status: RxStatus.error('catch'+e.toString()));
    }
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
}