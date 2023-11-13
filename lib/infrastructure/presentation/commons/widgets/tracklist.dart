import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/song.dart';
import '../../providers/audio_player_provider.dart';

class Tracklist extends StatelessWidget {
  final List<Song> songs;

  const Tracklist({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final List<_TracklistItem> tracklist = songs
        .map((song) => _TracklistItem(
              song: song,
            ))
        .toList();

    return Column(
      children: tracklist,
    );
  }
}

class _TracklistItem extends StatelessWidget {
  final Song song;
  //final String songUrl;

  const _TracklistItem({required this.song});

  @override
  Widget build(BuildContext context) {
    // final songProvider = context.watch<SongProvider>();
    final playerProvider = context.watch<AudioPlayerProvider>();

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Card(
        elevation: 2.0,
        color: const Color.fromARGB(33, 255, 255, 255),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                //imagen
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: const BoxDecoration(color: Colors.amber),
                // child: Image.network(song.imageURL, fit: BoxFit.cover,),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(14),
              child: Column(children: [
                Text(
                  'Song', //song.name
                ),
                Text('Artist') //song.artist
              ]),
            ),
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('1:00'), //duracion total de la cancion
                  SizedBox(width: 6),
                  IconButton(
                      onPressed:
                          null /*() {
                        songProvider.updateCurrentSong(song);
                        playerProvider.setPath(song.audioStreamURL);
                        playerProvider.play();
                      }*/
                      ,
                      icon: Icon(
                        Icons.play_arrow_sharp,
                        color: Color(0xff1de1ee),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
