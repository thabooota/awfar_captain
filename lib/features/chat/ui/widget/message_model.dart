class MessageModel {
  late String receiverId;
  late String senderId;
  late String content;
  late String dateTime;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.content,
    required this.dateTime,
  });
}