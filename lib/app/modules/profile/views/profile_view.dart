import 'package:flutter/material.dart';
import 'package:galih_123/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
      UserAccountsDrawerHeader(
      accountName: Text('Galih Surya'),
      accountEmail: Text('glhsya@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.asset('assets/profile.png',
            width: 90,
            height: 90,
            fit: BoxFit.cover,),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        /* image: DecorationImage(image: Image.asset('assets/dilan.png'),*/
      ),
    ),
            ListTile(
              leading: Icon(Icons.file_upload),
              title: Text('Upload shot'),
            ),  ListTile(
              leading: Icon(Icons.message),
              title: Text('pesan dengan admin'),
            ),ListTile(
              leading: Icon(Icons.line_axis),
              title: Text('daftar peminjaman'),
            ),  ListTile(
              leading: Icon(Icons.collections_bookmark),
              title: Text('daftar koleksi'),
            ),  ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            ),ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Get.toNamed(Routes.HOME);
              },
            ),

          ],
        ),
    );
  }
}
