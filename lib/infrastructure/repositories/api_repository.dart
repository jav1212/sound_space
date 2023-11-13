import 'package:dio/dio.dart';
import '../../domain/album.dart';
import '../../domain/artist.dart';
import '../../domain/playlist.dart';
import '../../domain/song.dart';

class ApiRepository {
  final Dio dio = Dio();

  // @override
  // Future<String> getPromotionalBanner() async {
  //   final String bannerImgURL = (await _dio.get("")).data["d"];
  //   return bannerImgURL;
  // }

  // @override
  Future<List<Playlist>?> getPlaylists() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/top_playlists?type=playlist");

      if (response.statusCode == 200) {
        final playlistJson = response.data["data"];

        List<Playlist> newPlaylists = playlistJson
            .map<Playlist>((playlist) => Playlist(
                id: playlist['codigo_playlist'],
                name: playlist['nombre'],
                iconPath: playlist['referencia_imagen']))
            .toList();

        return newPlaylists;
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print("$e");
    }

    return null;
  }

  Future<List<Album>?> getTrendingAlbums() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/top_playlists?type=album");

      if (response.statusCode == 200) {
        final playlistJson = response.data["data"];

        List<Album> newPlaylists = playlistJson
            .map<Album>((album) => Album(
                id: album['codigo_playlist'],
                name: album['nombre'],
                imageURL: album['referencia_imagen']))
            .toList();

        return newPlaylists;
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<List<Artist>?> getTrendingArtists() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/artists/top_artists");

      if (response.statusCode == 200) {
        final artistsJson = response.data["data"];

        List<Artist> newArtists = artistsJson
            .map<Artist>((artist) => Artist(
                  id: artist['codigo_artista'],
                  name: artist['nombre_artista'],
                  imageURL: artist['referencia_imagen'],
                ))
            .toList();

        return newArtists;
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<List<Album>?> getAlbumsByArtist(String id) async {
    return null;
  }

  Future<List<Song>?> getSongsByArtist(String id) async {
    return null;
  }

  // @override
  // Future<List<Song>> getSongsByAlbum(String id) async {
  //   final response = (await _dio.get("")).data[""];

  //   final List<Song> newSongs =
  //       response.map((song) => SongModel.fromJSON(song).toSongEntity());

  //   return newSongs;
  // }

  // @override
  // Future<List<Song>> getTracklist() async {
  //   final response = (await _dio.get("")).data[""];

  //   final List<Song> newSongs =
  //       response.map((song) => SongModel.fromJSON(song).toSongEntity());
  //   return newSongs;
  // }

  // @override
  // Future<Artist> getArtist(String id) async {
  //   final response = (await _dio.get("")).data[""];
  //   return ArtistModel.fromJSON(response).toArtistEntity();
  // }

  Future<String?> getSong(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/songs/link/$id");

      if (response.statusCode == 200) return response.data['data'];
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
