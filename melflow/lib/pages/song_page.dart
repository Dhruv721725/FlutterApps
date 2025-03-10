import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melflow/components/comp_drawer.dart';
import 'package:melflow/components/neu_box.dart';
import 'package:melflow/models/playlist_provider.dart';
import 'package:melflow/models/song.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget{
  SongPage({
    super.key,
  });
  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context,value,widg) {
        Song song=value.playlist[Provider.of<PlaylistProvider>(context).currentSongIndex!];
        int csec=value.currentDuration.inSeconds;
        int tsec=value.totalDuration.inSeconds;
        TextStyle textColor= TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // app bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      IconButton(
                        onPressed: ()=>Navigator.pop(context), 
                        icon: Icon(Icons.arrow_back)
                      ),
                      // title
                      Text(
                        "P L A Y L I S T",
                        style: TextStyle(fontSize: 20),
                      ),
                      // menu button
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.menu)
                      ),
                    ],
                  ),
                ),
            
                // album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          song.albumArtImagePath,
                        ),
                      ),

                      // song and artist name
                      Padding(
                        padding:EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  song.songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).colorScheme.inversePrimary
                                  ),
                                ),
                                
                                Text(song.artistName,style: textColor),
                              ],
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ), 
                      )
                    ],
                  ),
                ),
            
                // song duration progress
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start
                          Text("${(csec - csec % 60)/60}:${csec%60}",style: textColor),
                          // shuffle
                          IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.shuffle)
                          ),
                          // repeat
                          IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.repeat)
                          ),
                          // end
                          Text("${(tsec - tsec % 60)/60}:${tsec%60}",style: textColor)
                        ],
                      ),
                      Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(), 
                        activeColor: Colors.green,
                        inactiveColor: Theme.of(context).colorScheme.primary,
                        onChanged: (double){
                          setState(() {
                            // value.seek();
                          });
                        },
                        onChangeEnd:(double){
                          // sliding has finished, go to that position in song duration
                          value.seek(Duration(seconds: double.toInt()));
                        } ,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,), 

                // playback control buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // skip previous
                    Expanded(
                      flex: 2,
                      child: NeuBox(
                        child:IconButton(
                          onPressed: (){
                            setState(() {
                              value.playPreviousSong();
                            });
                          }, 
                          icon: Icon(Icons.skip_previous)
                        ) 
                      ),
                    ),
                    
                    // play pause
                    Expanded(
                      flex: 3,
                      child: NeuBox(
                        child:IconButton(
                          onPressed: (){
                            setState(() {
                              value.pauseOrResume();
                            });
                          }, 
                          icon: Icon(value.isPlaying?Icons.pause :Icons.play_arrow)
                        ) 
                      ),
                    ),

                    // skip next
                    Expanded(
                      flex: 2,
                      child: NeuBox(
                        child:IconButton(
                          onPressed: (){
                            setState(() {
                              value.playNextSong();
                            });
                          }, 
                          icon: Icon(Icons.skip_next)
                        ) 
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );  
  }
}