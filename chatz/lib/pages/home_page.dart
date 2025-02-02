import 'package:chatz/components/comp_drawer.dart';
import 'package:chatz/components/comp_user_tile.dart';
import 'package:chatz/pages/chat_page.dart';
import 'package:chatz/services/auth/auth_service.dart';
import 'package:chatz/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{

  final ChatService _chatService=new ChatService();
  final AuthService _authService=new AuthService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Chatz"),
      ),
      drawer: CompDrawer(),
      body: Center(
       child: _buildUserList()
      ),     
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(), 
      builder: (context,snapshot){
        // error
        if (snapshot.hasError) {
          return Text("Error");
        }

        // loading
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Column(
            children: [
              CircularProgressIndicator.adaptive(),
              Text("Loading...")
            ],
          );
        }
        print(snapshot.data!.toString());
        // list view 
        return ListView(
          children:snapshot.data!
            .map<Widget>((userData)=>_buildUserListItem(userData,context))
            .toList()
        );
      }
    );
  }

  // building individual list tile for user
  Widget _buildUserListItem(Map<String,dynamic>userData, BuildContext context){
    if (userData["email"]!=_authService.getCurrentUser()!.email.toString()) {
    return CompUserTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context) => ChatPage(
            receiverID: userData["uid"],
            receiverEmail: userData["email"]),
          )
        );
      },
      text: userData["email"],
      );
    }else{
      return SizedBox();
    }
  }
}