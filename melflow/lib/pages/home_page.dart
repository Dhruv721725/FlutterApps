import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melflow/components/comp_drawer.dart';
import 'package:melflow/components/comp_song_bar.dart';
import 'package:melflow/models/playlist_provider.dart';
import 'package:melflow/models/song.dart';
import 'package:melflow/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playListProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get playlist provider
    playListProvider=Provider.of<PlaylistProvider>(context, listen: false);

  }
  
  // go to a song
  void goToSong(int index){
    // update current song index
    playListProvider.currentSongIndex = index;

    List<Song> playlist=playListProvider.playlist ;
    
    Navigator.push(context, 
      MaterialPageRoute(
        builder: (context)=>SongPage(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("P L A Y L I S T"),
        ),
        drawer: CompDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Consumer<PlaylistProvider>(builder: (context,value,child){
                final List<Song> playlist=value.playlist;
              
                return ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context,index){
                    final Song song=playlist[index];
                    return ListTile(
                      leading: Image.asset(
                        song.albumArtImagePath,
                      ),
                      title: Text(song.songName),
                      subtitle: Text(song.artistName),
                        
                      onTap: ()=>goToSong(index),
                    );
                  }
                );
              }
              ),
            ),
            Provider.of<PlaylistProvider>(context).currentSongIndex!=null? CompSongBar():SizedBox(),
          ],
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: Provider.of<PlaylistProvider>(context).currentSongIndex!=null? CompSongBar():SizedBox(),
        // ),
      ),
    );
  }
}