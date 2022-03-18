import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  final String image;

  const PhotoView({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: Image.network(image),
    );
  }
}
