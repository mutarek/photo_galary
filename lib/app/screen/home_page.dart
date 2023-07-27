import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'album_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeCon = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Null Galary"),
      ),
      body: homeCon.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                double gridWidth = (constraints.maxWidth - 20) / 3;
                double gridHeight = gridWidth + 33;
                double ratio = gridWidth / gridHeight;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(5),
                  child: GridView.count(
                    childAspectRatio: ratio,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: <Widget>[
                      ...?homeCon.albums?.map(
                        (album) => GestureDetector(
                          onTap: () => Get.to(AlbumPage(album)
                          ),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Container(
                                  color: Colors.grey[300],
                                  height: gridWidth,
                                  width: gridWidth,
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: AlbumThumbnailProvider(
                                      album: album,
                                      highQuality: true,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 2.0),
                                child: Text(
                                  album.name ?? "Unnamed Album",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 2.0),
                                child: Text(
                                  album.count.toString(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
