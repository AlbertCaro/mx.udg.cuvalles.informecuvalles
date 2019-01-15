class Message { // Molde para los mensajes.
  String subject, content, url;

  Message(this.subject, this.content);

  Message.fromJson(Map json)
      : subject = json['asunto'],
        content = json['descripcion'],
        url = json['url'];

  Map toJson() {
    return {'asunto': subject, 'descripcion': content, 'url': url};
  }
}