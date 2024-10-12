class GetMessageResponse {
  final MessageInfo messages;

  GetMessageResponse({required this.messages});

}

class MessageInfo {
  final int id;
  final String sender;
  final String message;

  MessageInfo({required this.sender, required this.id, required this.message});

}
