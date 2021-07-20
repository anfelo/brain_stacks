class CardStack {
  final String id;
  final String title;
  final String description;
  final String group;

  CardStack({
    required this.id,
    required this.title,
    required this.description,
    required this.group,
  });

  factory CardStack.fromMap(Map data) {
    return CardStack(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      group: data['group'] ?? '',
    );
  }
}
