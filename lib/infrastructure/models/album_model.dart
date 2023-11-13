import '../../domain/album.dart';

class AlbumModel {
  final String id;
  final String name;
  final String imageURL;

  AlbumModel({
    required this.id,
    required this.name,
    required this.imageURL,
  });

  factory AlbumModel.fromJSON(Map<String, dynamic> json) => AlbumModel(
        id: json["id"],
        name: json["name"],
        imageURL: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageURL": imageURL,
      };

  Album toAlbumEntity() => Album(
        id: id,
        name: name,
        imageURL: imageURL,
      );
}
