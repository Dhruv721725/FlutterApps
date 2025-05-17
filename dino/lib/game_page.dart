import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static double dinoY = 1; // bottom
  double time = 0;
  double height = 0;
  double initialHeight = dinoY;

  bool isGameStarted = false;
  double obstacleX = 1; // right
  int score = 0;
  Timer? gameTimer; 

  void jump(){
    time = 0;
    initialHeight = dinoY;

    Timer.periodic(Duration(milliseconds: 50), (timer){
      time += 0.05;
      height = -3 * time * time + 3 * time;

      setState(() {
        dinoY = initialHeight - height;
      });

      if (dinoY > 1) {
        dinoY = 1;
        timer.cancel();
      }
    });
  }

  void startGame(){
    isGameStarted = true;
    gameTimer = Timer.periodic(Duration(milliseconds: 30), (timer){
      setState(() {
        obstacleX -= 0.02;
      });
      
      if (obstacleX<-1.2) {
        obstacleX = 1.0;
        score++ ;
      }

      if (obstacleX < 0.1 && obstacleX > -0.1 && dinoY > 0.9) {
        timer.cancel();
        showGameOverDialog();
      }
    });
  }

  void resetGame(){
    Navigator.pop(context);
    setState(() {
      dinoY = 1;
      obstacleX = 1;
      isGameStarted = false;
      score = 0;
    });
  }

  void showGameOverDialog(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text("Game Over"),
      content:  Text("Score: $score"),
      actions: [
        TextButton(onPressed: resetGame, child: Text("Restart"))
      ],
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isGameStarted ? jump : startGame,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        
        body: Column(
          children: [
            
            Expanded(
              flex: 3,
              
              child: Stack(
                children: [
                  
                  AnimatedContainer(
                    alignment: Alignment(0,dinoY),
                    duration: Duration(microseconds: 0),
                    child: Text("🏀", style: TextStyle(fontSize: 50),), // dino icon
                  ),

                  AnimatedContainer(
                    alignment: Alignment(obstacleX, 1),
                    duration: Duration(milliseconds: 0),
                    child: Text("🌵", style: TextStyle(fontSize: 50),), // cactus icon
                  )

                ],
              ),
            ),

            Container(
              height: 15,
              color: Colors.grey[700],
            ),

            Expanded(
              child: Center(
                child: Text(
                  isGameStarted ? "Score : $score" :  "TAP TO START",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}