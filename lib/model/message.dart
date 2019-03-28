class Message {
  final String text;
  final bool incoming;
  int createdAt;

  Message(this.text, this.incoming) {
    this.createdAt = DateTime.now().millisecondsSinceEpoch;
  }
}
