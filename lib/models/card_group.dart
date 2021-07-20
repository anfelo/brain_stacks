class CardGroup {
  final String name;
  final String title;

  CardGroup({
    required this.name,
    required this.title,
  });

  factory CardGroup.fromMap(Map data) {
    return CardGroup(
      name: data['name'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
