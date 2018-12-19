class Message { // Molde para los mensajes.
  String subject, content;

  Message(this.subject, this.content);

  Message.fromJson(Map json)
      : subject = json['asunto'],
        content = json['descripcion'];

  Map toJson() {
    return {'asunto': subject, 'descripcion': content};
  }
}