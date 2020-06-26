import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/models/Message_model.dart';
import 'package:gotit/views/pages/chat_room_view.dart';

class ChatListPage extends StatefulWidget{
  State<StatefulWidget> createState() => ChatListState();
}

class ChatListState extends State<ChatListPage>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (BuildContext context,int index){
          final Message chatting = messageList[index];
          return  GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(
                builder: (_)=>ChatRoomPage( userChat :chatting.sender,messageContent : chatting)
            )),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),

              child: Row(
                children: <Widget>[
                  //for image
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration:chatting.unread? BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(40)) ,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),

                    ):BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ]
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(chatting.sender.image),

                    ),
                  ),
//for messages
                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    padding: EdgeInsets.only(left: 20,),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                chatting.sender.isOnline?Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),

                                ):Container(child: null,),
                                Text(chatting.sender.name)
                              ],
                            ),
                            Text(chatting.time),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(chatting.text,
                            style:TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            maxLines: 1,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
