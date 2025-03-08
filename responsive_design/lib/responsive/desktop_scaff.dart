import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_design/constants.dart';
import 'package:responsive_design/util/comp_box.dart';
import 'package:responsive_design/util/comp_tile.dart';

class DesktopScaff extends StatefulWidget {
  @override
  State<DesktopScaff> createState() => _DesktopScaffState();
}

class _DesktopScaffState extends State<DesktopScaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: compAppbar,
      body: Row(
        children: [
          
          CompDrawer,
          
          Expanded(
            child: Column(
              children: [
                // 4 boxes on top
                AspectRatio(
                  aspectRatio: 4,
                  child: SizedBox(
                    height: double.infinity,
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4), 
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300
              ),
            )
          ),
        ],
      ),
    );
  }
}