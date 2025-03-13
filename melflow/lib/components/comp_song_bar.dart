import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:melflow/components/neu_box.dart';
import 'package:melflow/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class CompSongBar extends StatefulWidget{
  @override
  State<CompSongBar> createState() => _CompSongBarState();
}

class _CompSongBarState extends State<CompSongBar> {
  @override
  Widget build(BuildContext context) {
    var song = Provider.of<PlaylistProvider>(context);
    return NeuBox(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Expanded(
              flex:1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  song.playlist[song.currentSongIndex!].albumArtImagePath,
                ),
              ),
            ),
            Expanded(
              flex:5,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height:20,
                      child: Marquee(
                        text: "${song.playlist[song.currentSongIndex!].songName} by ${song.playlist[song.currentSongIndex!].artistName}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 150,
                        pauseAfterRound: Duration(seconds: 1),
                      ),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // skip to previous
                        IconButton(
                          onPressed: (){
                            setState(() {
                              song.playPreviousSong();
                            });
                          }, 
                          icon: Icon(Icons.skip_previous)
                        ),
                      
                        // play or pause
                        IconButton(
                          onPressed: (){
                            setState(() {
                              song.pauseOrResume();
                            });
                          }, 
                          icon: Icon(song.isPlaying? Icons.pause: Icons.play_arrow)
                        ),
                      
                        // skip to next
                        IconButton(
                          onPressed: (){
                            setState(() {
                              song.playNextSong();
                            });
                          }, 
                          icon: Icon(Icons.skip_next)
                        ),
                      ],
                    ),              
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}