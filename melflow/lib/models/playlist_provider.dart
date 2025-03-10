import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:melflow/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // list of songs
  final List<Song> _playlist=[
    Song(
      songName: "Jhol", 
      artistName: "Coke Studio", 
      albumArtImagePath: "assets/images/us.jpg", 
      audioPath: "audio/jhol.mp3"
    ),
    Song(
      songName: "Safar", 
      artistName: "Coke Studio", 
      albumArtImagePath: "assets/images/art.jpg", 
      audioPath: "audio/safar.mp3"
    ),
    Song(
      songName: "I am in love", 
      artistName: "Coke Studio", 
      albumArtImagePath: "assets/images/miles.jpg", 
      audioPath: "audio/love.mp3"
    ),
    Song(
      songName: "Aa likhu", 
      artistName: "Coke Studio", 
      albumArtImagePath: "assets/images/minion.jpg", 
      audioPath: "audio/likhu.mp3"
    ),
    Song(
      songName: "Blow Up", 
      artistName: "Coke Studio", 
      albumArtImagePath: "assets/images/bot.jpg", 
      audioPath: "audio/blow.mp3"
    ),
  ];

  int? _currentSongIndex;

  /*
  A U D I O P L A Y E R
  */ 

  // audio player
  final _audioPlayer=AudioPlayer();

  // durations
  Duration _currentDuration=Duration.zero;
  Duration _totalDuration=Duration.zero;

  // constructor
  PlaylistProvider(){
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying=false;

  // play the song
  void playSong()async{
    final String path=_playlist[_currentSongIndex!].audioPath;
    print(path);
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying=true;
    notifyListeners();
  }

  // pause the song
  void pauseSong()async{
    _audioPlayer.pause();
    _isPlaying=false;
    notifyListeners();
  }

  // resume playing
  void resume()async{
    await _audioPlayer.resume();
    _isPlaying=true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume()async{
    if (_isPlaying) {
      pauseSong();
    }else{
      resume();
    }
    notifyListeners();
  }

  // seeking on slider
  void seek(Duration position)async{
    await _audioPlayer.seek(position);
  }

  // play next
  void playNextSong(){
    if (_currentSongIndex!=null) {
      if (_currentSongIndex!<_playlist.length-1) {
        _currentSongIndex=_currentSongIndex!+1;
      }else{
        _currentSongIndex=0;
      }
    }
    playSong();
    notifyListeners();
  }

  // play previous
  void playPreviousSong(){
    if (_currentSongIndex!=null) {
      if (_currentSongIndex!>0) {
        _currentSongIndex=_currentSongIndex!-1;
      }else{
        _currentSongIndex=_playlist.length-1;
      }
    }
    playSong();
    notifyListeners();
  }

  // listen to duration
  void listenToDuration(){
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration=newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration=newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event){
      playNextSong();
    });
  }

  // dispose audio player

  /* 
  G E T T E R S
  */

  List<Song> get playlist=>_playlist;
  int? get currentSongIndex=>_currentSongIndex;
  bool get isPlaying=>_isPlaying;
  Duration get currentDuration=>_currentDuration;
  Duration get totalDuration=>_totalDuration;

  /*
  S E T T E R S
  */

  set currentSongIndex(int? index){
    _currentSongIndex=index;
    if (index!=null) {
      playSong();
    }
    notifyListeners();
  }
}