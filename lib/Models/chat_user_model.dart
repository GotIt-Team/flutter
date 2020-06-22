import 'package:flutter/material.dart';

class ChatUser{
   final int id;
   final String name;
   final String image;
   final bool isOnline;

  ChatUser({
    this.id,
    this.name,
    this.image,
    this.isOnline,});
}

/* ChatUser.fromJson(Map<String,dynamic> chatList)=>ChatUser
(id:chatList['id'],name:chatList['name'],image:chatList['image'],isOnline:chatList['isOnline']);*/

final ChatUser DrRasha = ChatUser(
  id : 0,
  name: 'Rasha Badry',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser DrBassma = ChatUser(
  id : 1,
  name: 'Bassma Hassan',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser Abdalrahman = ChatUser(
  id : 2,
  name: 'Abdalrahman Ahmed',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser Asmaa = ChatUser(
  id : 3,
  name: 'Asmaa Khaled',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser Badr = ChatUser(
  id : 4,
  name: 'Badr Mohamed',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser Hassan= ChatUser(
  id : 5,
  name: 'Hassan ELshimy',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser Kyrolls = ChatUser(
  id : 6,
  name: 'Kyrolls Girgis',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser Youmna = ChatUser(
  id : 7,
  name: 'Youmna Hosny',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);