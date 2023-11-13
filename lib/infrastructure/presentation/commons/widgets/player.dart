import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../providers/audio_player_provider.dart';
import '../../providers/song_provider.dart';
import 'player_progress_bar.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    final songProvider =
        context.watch<SongProvider>(); //deberia ser read nada mas
    final playerProvider = context.watch<AudioPlayerProvider>();

    return Stack(
      children: [
        SizedBox(
          height: 80,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                height: 10,
              ),
              Container(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 24, 15, 35)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Color(0xff1de1ee),
                        ),
                        onPressed: () async {
                          await songProvider.updateCurrentSong(
                              '1774d479-f54a-4fb6-b3d4-8f64c1cdb3a4');
                          playerProvider.setPath(songProvider.currentSong!);
                          playerProvider.play();
                        },
                      ),
                      _PlayerButtom(),
                      const Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(children: [
                          Text(
                            'Song',
                          ),
                          Text('Artist')
                        ]),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            '${playerProvider.player.position.inMinutes.toString()}:${playerProvider.player.position.inSeconds.toString()}'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 47,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const PlayerProgressBar()))
      ],
    );
  }
}

class _PlayerButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<AudioPlayerProvider>();
    IconData icon;
    Color color;

    switch (playerProvider.player.processingState) {
      case (ProcessingState.idle):
        icon = Icons.play_circle_fill;
        color = Colors.blueGrey;
      case ProcessingState.loading:
        icon = Icons.circle_rounded;
        color = Colors.blueGrey;
      case ProcessingState.buffering:
        icon = Icons.circle_rounded;
        color = Colors.blueGrey;
      case ProcessingState.ready:
        icon = (playerProvider.player.playing)
            ? Icons.pause_circle_filled
            : Icons.play_circle_fill;
        color = const Color(0xff1de1ee);
      case ProcessingState.completed:
        icon = Icons.play_circle_fill;
        color = Colors.blueGrey;
    }

    return IconButton(
      icon: Icon(
        icon,
        size: 50,
        color: color,
      ),
      onPressed: () => playerProvider.playOrPause(),
    );
  }
}
