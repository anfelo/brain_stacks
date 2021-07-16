class Stack {
  final String id;
  final String title;
  final String description;

  Stack({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Stack.fromMap(Map data) {
    return Stack(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
