import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konachan_viewer/models/post.dart';
import 'package:konachan_viewer/services/network.dart';
import 'package:konachan_viewer/views/post.dart';

class KonachanViewerHome extends StatefulWidget {
  const KonachanViewerHome({Key? key}) : super(key: key);

  @override
  _KonachanViewerHomeState createState() => _KonachanViewerHomeState();
}

class _KonachanViewerHomeState extends State<KonachanViewerHome> {
  final list = Get.find<RxList<Post>>(tag: 'home');
  final network = Get.find<Network>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemBuilder: (c, i) => ListTile(
              title: PostViewPreview(post: list[i]),
              onTap: () {
                Get.to(GestureDetector(
                  child: PostViewSample(post: list[i]),
                  onTap: () {
                    Get.bottomSheet(
                      PostViewDetail(post: list[i]),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: Colors.white,
                      enableDrag: true,
                    );
                  },
                ));
              },
            ),
            itemCount: list.length,
          )),
      floatingActionButton: FloatingActionButton(
        child: Obx(() {
          return Text('${list.length}');
        }),
        onPressed: () {
          network.updatePost(tag: 'home');
        },
      ),
    );
  }
}
