
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

final ChatUser drRasha = ChatUser(
  id : 0,
  name: 'Rasha Badry',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser drBassma = ChatUser(
  id : 1,
  name: 'Bassma Hassan',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser abdalrahman = ChatUser(
  id : 2,
  name: 'Abdalrahman Ahmed',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser asmaa = ChatUser(
  id : 3,
  name: 'Asmaa Khaled',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser badr = ChatUser(
  id : 4,
  name: 'Badr Mohamed',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser hassan= ChatUser(
  id : 5,
  name: 'Hassan ELshimy',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);
final ChatUser kyrolls = ChatUser(
  id : 6,
  name: 'Kyrolls Girgis',
  image:'assets/images/Sheka.jpeg',
  isOnline: true,
);
final ChatUser youmna = ChatUser(
  id : 7,
  name: 'Youmna Hosny',
  image:'assets/images/Sheka.jpeg',
  isOnline: false,
);