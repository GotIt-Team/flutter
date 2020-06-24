import 'package:gotit/models/chat_user_model.dart';

class Message{
  final ChatUser sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.text,
    this.time,
    this.unread,
  });
}
List<Message> messageList = [
  Message (
    sender: drRasha,
    time: '4.30',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: drBassma,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: badr,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: kyrolls,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: abdalrahman,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: hassan,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: youmna,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
];
List<Message> messages = [
  Message (
    sender: drRasha,
    time: '4.30',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: drRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: drRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: drRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: drRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),

];



