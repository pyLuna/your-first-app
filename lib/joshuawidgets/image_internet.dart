import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBarBuilder('Images Demo', true),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _imageContainer(
                        NetworkImage('https://picsum.photos/250?image=9'),
                        'NetworkImage'),
                    _imageContainer(
                        NetworkImage(
                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                        'NetworkImage'),
                    _inMemoryImage('https://picsum.photos/250?image=9',
                        'FadeInImage.memoryNetwork'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _inMemoryImage(String imageProvider, String from) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, image: imageProvider),
        )
      ],
    );
  }

  Widget _imageContainer(ImageProvider imageProvider, String from) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          Text('from $from'),
        ],
      ),
    );
  }
}
