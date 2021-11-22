import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konachan_viewer/models/post.dart';
import 'package:konachan_viewer/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class PostViewPreview extends StatelessWidget {
  const PostViewPreview({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return NetworkImageView(imgUrl: post.previewUrl!);
  }
}

class PostViewSample extends StatelessWidget {
  const PostViewSample({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: post.sampleWidth! > post.sampleHeight! ? 1 : 0,
      // todo hero animation doesn't work Orz
      child: Hero(
        tag: post.id!,
        child: InteractiveViewer(
          child: NetworkImageView(imgUrl: post.sampleUrl!),
        ),
      ),
    );
  }
}

class PostViewDetail extends StatelessWidget {
  const PostViewDetail({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ...post.tags!.split(' ').map((e) => Chip(label: Text(e))),
          ],
        ),
        Text('Source'),
        InkWell(
          child: Text(post.source.toString()),
          onTap: () async {
            await launch(post.source.toString());
          },
        ),
      ],
    );
  }
}
