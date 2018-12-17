class Message { // Molde para los mensajes.
  String subject, content;

  //Message(this.subject, this.content);

  factory Message(Map jsonMap){
    return new Message.deserialize(jsonMap);
  }

  Message.deserialize(Map json){
    subject = json["subject"];
    content = json["content"];
  }

}