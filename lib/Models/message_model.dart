import 'package:gotit/Models/chat_user_model.dart';

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
    sender: DrRasha,
    time: '4.30',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: DrBassma,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: Badr,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: Kyrolls,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: Abdalrahman,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: Hassan,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: Asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: Youmna,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
];
List<Message> messages = [
  Message (
    sender: DrRasha,
    time: '4.30',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: Asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: DrRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: DrRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: Asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: true,
  ),
  Message (
    sender: DrRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: Asmaa,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),
  Message (
    sender: DrRasha,
    time: '4.31',
    text: 'Hi Graduation Project Team',
    unread: false,
  ),

];



