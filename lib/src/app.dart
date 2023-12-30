import "package:flutter/material.dart";
import "dart:convert";
import 'package:http/http.dart' show get;
import "./models/image.dart";
import "./widgets/renderImages.dart";

// custom stateful widget class
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // returns a state object which is an instance of a state class
    return AppState();
  }
}

// state class
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> fetchedImages = [];
  // making an asynchronous api requests.
  void fetchImage() async {
    // we need the counter property to query the images by their id.
    counter++;
    // fetching photos from jsonplaceholder api by building a uri with uri.parse.
    final result = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final response = json.decode(result.body);
    final image = ImageModel.fromJson(response);
    // re-render the widegt when a new image is fetched.
    setState(() {
      fetchedImages.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    // The MatrialApp widget let's us render diffrent composition of widgets for different pages like home, about .....
    return MaterialApp(
      // scafold is a Layout widget provided by flutter
      home: Scaffold(
        body: RenderImages(fetchedImages),
        // floating action button
        floatingActionButton: FloatingActionButton(
            onPressed: fetchImage, child: const Icon(Icons.add)),
        // The Top blue bar
        appBar: AppBar(
          title: const Text("Let's see some images"),
        ),
      ),
    );
  }
}
