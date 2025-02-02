import 'package:chatz/components/comp_textfieldd.dart';
import 'package:chatz/services/auth/auth_service.dart';
import 'package:chatz/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  final String receiverEmail;
  final String receiverID;
  const ChatPage({
    super.key, 
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  State<ChatPage> createState()=>_ChatPageState();
}

class _ChatPageState extends State <ChatPage>{
  // text controller
  final TextEditingController _messageController =new TextEditingController();

  // chat & auth service
  final ChatService _chatService=ChatService();
  final AuthService _authService=AuthService();

  void sendMessage() async{
    if (_messageController.text.trim().isNotEmpty) {
      // send message
      _chatService.sendMessage(
        widget.receiverID, 
        _messageController.text
      );
      _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverID),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(child:_buildMessageList()),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream:_chatService.getMessages(senderID, widget.receiverID), 
      builder: (context,snapshot){
        if (snapshot.hasError) {
          return Text("Error");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Loading...")
              ],
            ),
          );
        }
        return ListView(
          children:snapshot.data!.docs.map((doc)=>_buildMessageItem(doc)).toList(),
        );
      }
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data=doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildUserInput(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          Expanded(child: CompTextfield(
            controller: _messageController, 
            pass: false, 
            hintText: "Type message here..."
            )
          ),
          IconButton(
            onPressed:sendMessage , 
            icon: Icon(Icons.send_rounded,)
          )
        ],
      ),
    );
  }
}