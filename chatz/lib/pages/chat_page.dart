import 'package:chatz/components/comp_textfieldd.dart';
import 'package:chatz/services/auth/auth_service.dart';
import 'package:chatz/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  final String receiverName;
  final String receiverID;
  const ChatPage({
    super.key, 
    required this.receiverName,
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

  // for textField focus
  FocusNode myFocusNode=FocusNode();

  @override 
  void initState(){
    super.initState();

    myFocusNode.addListener((){
      if (myFocusNode.hasFocus) {
        // cause a delay so that key board has a time to show up
        // then the amount of the remaining space will e calculated
        // then scroll down
        Future.delayed(Duration(milliseconds: 500),
          ()=>scrollDown());
      }
    });
    // wait for a list view to be built
    Future.delayed(Duration(milliseconds: 500),()=>scrollDown());
  } 
  @override
  void dispose(){
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }
  // scroll controller
  final ScrollController _scrollController=ScrollController();
  void scrollDown(){
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, 
      duration: Duration(seconds: 1), 
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async{
    if (_messageController.text.trim().isNotEmpty) {
      // send message
      _chatService.sendMessage(
        widget.receiverID, 
        _messageController.text.trim(),
      );
      _messageController.clear();
    }
    Future.delayed(Duration(milliseconds: 250),()=>scrollDown());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName),
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
          controller: _scrollController,
          children:snapshot.data!.docs.map((doc)=>_buildMessageItem(doc)).toList(),
        );
      }
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data=doc.data() as Map<String, dynamic>;
     
    bool sender_message = _authService.getCurrentUser()!.uid == data["senderID"]?true:false;
    Alignment alignment= sender_message? Alignment.bottomRight:Alignment.bottomLeft;
    Color color=sender_message?Colors.grey:Colors.grey.shade400;

    DateTime date=data["timeStamp"].toDate();

    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.fromLTRB(
          sender_message?55:10,
          5,
          sender_message?10:55,
          5),
        alignment: alignment,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(data["message"])
                ),
              SizedBox(width: 10,),
              Text(
                "${date.hour}:${date.minute}",
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.primary
                ),)           
            ],
          )
        )
      );
  }

  Widget _buildUserInput(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: CompTextfield(
            controller: _messageController, 
            pass: false, 
            hintText: "Type message here...",
            focusNode: myFocusNode,
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