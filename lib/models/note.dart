class Note {
  String id;        // Firebase key
  String title;
  String content;

  Note({
    required this.id,
    required this.title,
    required this.content,
  });

  // Convert a Note to a Map for Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }

  // Create a Note from Firebase data
  factory Note.fromJson(String id, Map<String, dynamic> json) {
    return Note(
      id: id,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
