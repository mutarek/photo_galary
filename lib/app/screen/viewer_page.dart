import 'package:flutter/material.dart';
import 'package:phone_galary/app/screen/video_page.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../main.dart';

class ViewerPage extends StatefulWidget {
  final Medium medium;

  ViewerPage(Medium medium) : medium = medium;

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () async {
                  // Get.bottomSheet(Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(25),
                  //       topRight: Radius.circular(25),
                  //     ),
                  //     color: Colors.white,
                  //   ),
                  //   height: 200,
                  // ));
                },
              )
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: widget.medium.mediumType == MediumType.image
                  ? FadeInImage(
                      fit: BoxFit.fitHeight, placeholder: MemoryImage(kTransparentImage), image: PhotoProvider(mediumId: widget.medium.id))
                  : VideoProvider(
                      mediumId: widget.medium.id,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
