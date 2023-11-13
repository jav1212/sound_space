import '../../domain/playlist.dart';

class PlaylistModel {
  final String id;
  final String name;
  final String iconPath;

  PlaylistModel({required this.id, required this.name, required this.iconPath});

  factory PlaylistModel.fromJSON(Map<dynamic, dynamic> json) => PlaylistModel(
      id: json["codigo_playlist"],
      name: json["nombre"],
      iconPath: json["referencia_imagen"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "iconPath": iconPath};

  Playlist toPlaylistEntity() => Playlist(
        id: id,
        name: name,
        iconPath: iconPath,
      );
}
