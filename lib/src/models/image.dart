class ImageModel {
  int id = 1;
  String title = '';
  String url = '';
  ImageModel(this.id, this.title, this.url);
  ImageModel.fromJson(parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
  }
}
