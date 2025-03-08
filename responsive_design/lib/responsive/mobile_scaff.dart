import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_design/constants.dart';
import 'package:responsive_design/util/comp_box.dart';
import 'package:responsive_design/util/comp_tile.dart';

class MobileScaff extends StatefulWidget {
  @override
  State<MobileScaff> createState() => _MobileScaffState();
}

class _MobileScaffState extends State<MobileScaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: compAppbar,
      drawer: CompDrawer,
      body: Column(
        children: [
          // 4 boxes on top
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              height: double.infinity,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), 
                itemBuilder: (context,index){
                  return CompBox();
                }
              ),
            ),
          ),

          // tiles below it
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index){
                  return CompTile();
                }
              ),
            ),
        ],
      ),
    );
  }
}