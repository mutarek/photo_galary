import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_galary/app/controller/album_controller.dart';
import 'package:phone_galary/app/screen/viewer_page.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumPage extends StatelessWidget {
  Album album;

  AlbumPage(this.album);

  final albumCon = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    albumCon.initAsync(album);
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name.toString()),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          ...?albumCon.media?.map(
            (medium) => GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewerPage(medium)),
              ),
              child: Container(
                color: Colors.grey[300],
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: ThumbnailProvider(
                    mediumId: medium.id,
                    mediumType: medium.mediumType,
                    highQuality: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
