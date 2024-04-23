import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:iconsax/iconsax.dart';

import 'package:get/get.dart';


import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/response/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    // final HomeController controller = Get.find();
    // var recommended = controller.getRecommended();
    // controller.getRating();

    return Scaffold(
      body: Obx(
            () => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
          backgroundColor: Color(0xFFF0F0F0),
          body: ListView(
            children: [
              Carousel(),
              Padding(
                padding:
                const EdgeInsets.only(top: 22, left: 22, bottom: 8),
                child: Text(
                  'Recommended',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    // fontWeight: FontWeight.w400,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ),
              Container(),
              Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.rekomendasiBookList.length,
                  itemBuilder: (context, index) {
                    DataBook dataBook =
                    homeController.rekomendasiBookList[index];
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
                  // separatorBuilder: (context, index) => Divider(),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 22, left: 22, bottom: 8),
                child: Text(
                  'Top Rating',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    // fontWeight: FontWeight.w400,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ),
              Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                  homeController.ratingTertinggiBookList.length,
                  itemBuilder: (context, index) {
                    DataBook dataBook =
                    homeController.ratingTertinggiBookList[index];
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
                  // separatorBuilder: (context, index) => Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              // width: 125,
              // color: Colors.white,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                      "${bookImage}",
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
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
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

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    final List<Image> imgList = [
      Image.asset('assets/milea.png', fit: BoxFit.cover),
      Image.asset('assets/dilan.png', fit: BoxFit.cover),
      Image.asset('assets/robot.jpg', fit: BoxFit.cover),
      Image.asset('assets/prahu.jpg', fit: BoxFit.cover),
    ];
    return Stack(
      children: [
        FlutterCarousel(
          options: CarouselOptions(
            height: 240.0,
            // aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            slideIndicator: CircularWaveSlideIndicator(),
          ),
          items: imgList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: .0),
                  // decoration: BoxDecoration(
                  //     color: Colors.amber
                  // ),
                  child: item,
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 7.0, right: 7.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Icon(
                  Iconsax.profile_circle5,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SearchBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _showSearchMenu = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showSearchMenu = true;
          });
          // Navigasi ke halaman pencarian buku
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xDAFFFFFF),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              SizedBox(width: 23),
              Icon(
                Iconsax.search_normal_14,
                size: 17,
                color: Color(0x7F2D2D2D),
              ),
              SizedBox(width: 80),
              Expanded(
                child: Text(
                  'Cari judul buku',
                  style: GoogleFonts.inter(
                    color: Color(0x7F444444),
                    fontSize: 13,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final controller = TextEditingController();

    return Scaffold(
      body: Obx(() {
        return ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        homeController.getSearch(value);
                      },
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        hintText: "Cari judul buku",
                        hintStyle: GoogleFonts.inter(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        prefixIcon: Icon(Iconsax.search_normal_14, color: Colors.black, size: 20,),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                      ),
                      style: TextStyle(fontSize: 13.0, ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: homeController.filteredList.length,
              itemBuilder: (context, index) {
                DataBook dataBook = homeController.filteredList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text("${dataBook.judul}"),
                    leading: Image.network("${dataBook.image}"),
                    subtitle: Text("${dataBook.penulis}"),
                    onTap: () {
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
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    height: 1,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}