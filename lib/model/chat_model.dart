class ChatModel {
  final String content;
  final bool sendByMe;

  ChatModel({required this.content, required this.sendByMe});
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(content: json['content'], sendByMe: json['sendByMe']);
  }
  toMap() {
    return {'content': content, 'sendByMe': sendByMe};
  }
}
