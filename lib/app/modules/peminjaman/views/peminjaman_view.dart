import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/model/response/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PeminjamanController peminjamanController =
    Get.put(PeminjamanController());
    final PeminjamanController controller = Get.find<PeminjamanController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Buku',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E1E1E),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF1E1E1E), Color(0xFF424242)],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF2f3d7e),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Color(0xFFfaeaeb),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        '${Get.parameters['image']}',
                        width: 120,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tentang Buku',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Judul Buku: ${Get.parameters['judul']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Penulis: ${Get.parameters['penulis']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Kategori: ${Get.parameters['nama_kategory']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              controller.getDetailBuku();
                              Get.toNamed(
                                Routes.ADD_PEMINJAMAN,
                                parameters: {
                                  'id': '${Get.parameters['id'].toString()}',
                                  'judul': '${Get.parameters['judul']}',
                                  'image': '${Get.parameters['image']}',
                                  'penulis': '${Get.parameters['penulis']}',
                                  'penerbit': '${Get.parameters['penerbit']}',
                                  'tahun_terbit': '${Get.parameters['tahun_terbit']}',
                                  'deskripsi_buku': '${Get.parameters['deskripsi_buku']}',
                                  'nama_kategory': '${Get.parameters['nama_kategory']}',
                                  'rating': '${Get.parameters['rating']}',
                                },
                              );
                            },
                            child: Text("Pinjam"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffa5ffd6),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Color(0xFFfaeaeb),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Detail Buku',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tahun Terbit:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${Get.parameters['tahun_terbit']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Penerbit:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${Get.parameters['penerbit']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rating:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffffb500),
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${Get.parameters['rating']}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.black),
                    SizedBox(height: 20),
                    Text(
                      'Deskripsi Buku',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ExpandableText(
                      text: '${Get.parameters['deskripsi_buku']}',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recommended',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Obx(
                  () => controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                  peminjamanController.rekomendasiBookList.length,
                  itemBuilder: (context, index) {
                    DataBook dataBook =
                    peminjamanController.rekomendasiBookList[index];
                    return BookCover(
                      bookTitle: '${dataBook.judul}',
                      bookImage: '${dataBook.image}',
                      onPressed: () {
                        Get.toNamed(Routes.PEMINJAMAN, parameters: {
                          'id': (dataBook.id ?? 0).toString(),
                          'judul': '${dataBook.judul}',
                          'image': '${dataBook.image}',
                          'penulis': '${dataBook.penulis}',
                          'penerbit': '${dataBook.penerbit}',
                          'tahun_terbit': '${dataBook.tahunTerbit}',
                          'deskripsi_buku': '${dataBook.deskripsi_buku}',
                          'nama_kategory': '${dataBook.namaKategory}',
                          'rating': '${dataBook.rating}',
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Obx(
      //       () => AnimatedOpacity(
      //       opacity: controller.isScrollingDown.value ? 0.0 : 1.0,
      //       duration: Durations.medium1),
      // ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({
    required this.text,
    this.maxLines = 8,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.breeSerif(
              fontSize: 12,
            ),
          ),
          secondChild: Text(
            widget.text,
            style: GoogleFonts.breeSerif(
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Show Less' : 'Show More',
            style: TextStyle(
              color: Color(0xff0088ff),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class BookCover extends StatelessWidget {
  final String bookTitle;
  final String bookImage;
  final VoidCallback onPressed;

  const BookCover({
    Key? key,
    required this.bookTitle,
    required this.bookImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              // width: 125,
              // color: Colors.white,
              decoration: BoxDecoration(color: Color(0xFFfaeaeb), boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(141, 141, 141, 1.0),
                  blurRadius: 2,
                  offset: Offset(2, 2),
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      bookImage,
                      width: 130,
                      height: 180,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 40,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 120,
                      height: 30,
                      // color: Colors.red,
                      child: Text(
                        bookTitle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}