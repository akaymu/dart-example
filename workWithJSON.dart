import 'dart:convert';

void main () {
  var rawJson = '{ "albumId": 1, "id": 1, "title": "accusamus beatae ad facilis cum similique qui sunt", "url": "https://via.placeholder.com/600/92c952", "thumbnailUrl": "https://via.placeholder.com/150/92c952"}';
  
  var parsedJson = json.decode(rawJson);
  var imageModel = new ImageModel.fromJson(parsedJson);
  print(imageModel.url);
}

class ImageModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  
  ImageModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
  
  ImageModel.fromJson(parsedJson) {
    albumId = parsedJson['albumId'];
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
    thumbnailUrl = parsedJson['thumbnailUrl'];
  }
}
