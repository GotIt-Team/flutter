import 'package:flutter/material.dart';
import 'package:gotit/models/Message_model.dart';
import 'package:gotit/models/chat_user_model.dart';


class ChatRoomPage extends StatefulWidget{
  final ChatUser userChat ;
  final Message messageContent ;

  ChatRoomPage({this.userChat,this.messageContent});
  State<StatefulWidget>createState()=>ChatRoomState();
}

class ChatRoomState extends State<ChatRoomPage>{
  _chatBubble(Message message , bool isMe,bool isSameUser){
    if(isMe){
      return Padding(padding: EdgeInsets.only(right: 10),child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.80
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ]
              ),
              child: Text(widget.messageContent.text,style: TextStyle(color: Colors.white),),
            ),
          ),


        ],
      ),);
    }
    else{
      return  Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),child: Column(
            children: <Widget>[
              !isSameUser? Column(
                children: <Widget>[
                  Container(

                    padding: EdgeInsets.all(2),
                    /////////////////////////// removed condition ////////////////////
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(40)) ,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),

                    ),
                    // BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.5),
                    //         spreadRadius: 2,
                    //         blurRadius: 5,
                    //       ),
                    //     ]
                    // ),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(widget.userChat.image),

                    ),
                  ),
                  Text('12.23')
                ],
              )
                  :Container(child: null,),
              SizedBox(
                height: 10,
              ),

            ],
          ),),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.80
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ]
              ),
              child: Text(widget.messageContent.text),
            ),
          ),


        ],
      );
    }
  }
  _sendMessageArea(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      child:   Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_library,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: (){print('aa');},
          ),
          Expanded(child: TextField(
            decoration: InputDecoration(
                hintText: 'send Message',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.blue)
                )
            ),
          ),),
          IconButton(
            icon: Icon(Icons.send,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: (){print('aabb');},
          ),
        ],
      ),
    );
  }
  int previousId;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Container(

            child: Row(

              children: <Widget>[
                Padding(padding: EdgeInsets.all(5),child:  Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.userChat.image),
                  ),
                ),),
                Padding(padding: EdgeInsets.all(5),child: Container(
                  child: Column(
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: [
                              TextSpan(text: widget.userChat.name),
                              TextSpan(text: '\n'),
                              TextSpan(text: 'online',),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),),
              ],
            ),
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            Navigator.pop(context);
          },),
        ),
        body:Column(
          children: <Widget>[
            Expanded(child: ListView.builder(
                itemCount:messages.length,
                itemBuilder:(
                    BuildContext context , int index){
                  final Message message = messages[index];
                  final bool currentUser =message.sender.id == asmaa.id;
                  final bool isSameUser = previousId == message.sender.id;
                  previousId = message.sender.id;
                  return _chatBubble(message, currentUser,isSameUser);
                }
            ),),
            _sendMessageArea()




          ],
        )


    );
  }
}