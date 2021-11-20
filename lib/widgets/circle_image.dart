import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;

  CircleImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder:  (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            )
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
