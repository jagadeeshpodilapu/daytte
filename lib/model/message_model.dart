class ChatModel {
  final String? name;
  final int? roomId;
  final String? lastMessage;
  final int? messageCount;
  final String? time;
  final String? userId;

  ChatModel(
      {this.name,
      this.roomId,
      this.lastMessage,
      this.messageCount,
      this.time,
      this.userId});
}

class MessageModel {
  final String? type;
  final String? message;
  final String? time;
  final String? userId;

  MessageModel({this.type, this.message, this.time, this.userId});
}
