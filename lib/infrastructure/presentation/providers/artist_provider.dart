import 'package:flutter/material.dart';
import 'package:sound_space/domain/artist.dart';
import '../../repositories/api_repository.dart';

class ArtistProvider extends ChangeNotifier {
  final ApiRepository repository;
  late String bannerImgUrl;
  List<Artist>? trendingArtists;
  Artist? currentArtist;

  ArtistProvider({required this.repository});

  Future<void> loadInitState() async {
    //bannerImgUrl = await getPromotionalBanner();
    trendingArtists = await getTrendingArtists();
    notifyListeners();
  }

  Future<List<Artist>?> getTrendingArtists() async {
    return await repository.getTrendingArtists();
  }

  //Future<String> getPromotionalBanner() async {
  //  return await _repository.getPromotionalBanner();
  //}

  void updateCurrentArtist(Artist artist) {
    currentArtist = artist;
    notifyListeners();
  }
}
