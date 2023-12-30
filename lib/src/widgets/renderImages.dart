import "package:flutter/material.dart";
import "../models/image.dart";

class RenderImages extends StatelessWidget {
  final List<ImageModel> fecthedImages;
  const RenderImages(this.fecthedImages);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: fecthedImages.length,
      itemBuilder: (context, int index) {
        // A widget to display an image from a URL
        return buildImage(fecthedImages[index]);
      },
    );
  }

  // A method that shows only one image card.
  Widget buildImage(ImageModel image) {
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 2.0)),
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.network(image.url),
            ),
            Text(image.title)
          ],
        ));
  }
}
