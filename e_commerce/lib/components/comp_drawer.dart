import 'package:e_commerce/components/comp_drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return  Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: EdgeInsets.all(25),
          child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    DrawerHeader(
                      child: Icon(
                        Icons.shopping_bag,
                        size: 60,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
            
                      CompDrawerTile(icon:Icons.home, title:"Home", onTap: ()=>Navigator.pushNamed(context, '/shop_page')),
            
                      CompDrawerTile(icon:Icons.shopping_cart, title:"Cart", onTap: ()=>Navigator.pushNamed(context, '/cart_page')),
            
                      CompDrawerTile(icon:Icons.info, title:"About", onTap: ()=>Navigator.pushNamed(context, '/about_page')),
                  ],
                ),
            
                CompDrawerTile(icon:Icons.logout, title:"Exit", onTap: ()=>Navigator.pushNamed(context, '/intro_page')),
              ],
            ),
        ),
      );
  }
}