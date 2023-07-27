import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Album>? albums;
  final RxBool loading = false.obs;

  @override
  void onInit() {
    initAsync();
    super.onInit();
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> malbums = await PhotoGallery.listAlbums();
      albums = malbums;
      loading.value = false;
    }
    loading.value = false;
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted && await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }
}
