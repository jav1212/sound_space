import 'package:flutter/material.dart';
import 'package:sound_space/infrastructure/repositories/api_repository.dart';

import '../../../domain/album.dart';

class AlbumProvider extends ChangeNotifier {
  final ApiRepository repository;
  List<Album>? trendingAlbums;
  List<Album>? albumsByArtist;

  AlbumProvider({required this.repository});

  Future<void> loadInitState() async {
    trendingAlbums = await getTrendingAlbums();
    notifyListeners();
  }

  Future<List<Album>?> getTrendingAlbums() async {
    return await repository.getTrendingAlbums();
  }

  // Future<void> updateAlbumsByArtist(String id) async {
  //   albumsByArtist = await repository.getAlbumsByArtist(id);
  //   notifyListeners();
  // }
}
