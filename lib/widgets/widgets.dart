/// This file contains reusable components.
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({Key? key, required this.imgUrl}) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      // by default the image will fill the available space.
      // fit: BoxFit.fitWidth,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, chunkInfo) {
        if (chunkInfo!=null) {
          if (chunkInfo.expectedTotalBytes == null) {
            return const CircularProgressIndicator();
          } else {
            return AspectRatio(
              aspectRatio: 1,
              child: FractionallySizedBox(
                heightFactor: 0.2,
                widthFactor: 0.2,
                child: CircularProgressIndicator.adaptive(
                    value: chunkInfo.cumulativeBytesLoaded /
                        chunkInfo.expectedTotalBytes!),
              ),
            );
          }
        }
        return child;
      },
    );
  }
}
