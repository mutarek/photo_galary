import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class AlbumController extends GetxController{
  List<Medium>? media;

  @override
  void onInit() {
    super.onInit();
  }

  void initAsync(Album album) async {
    MediaPage mediaPage = await album.listMedia();
      media = mediaPage.items;
      update();
  }
}