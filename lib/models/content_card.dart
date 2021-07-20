class ContentCard {
  final String id;
  final String? title;
  final String content;
  final String? img;
  final int order;

  ContentCard({
    required this.id,
    required this.content,
    required this.order,
    this.title,
    this.img,
  });

  factory ContentCard.fromMap(Map data) {
    return ContentCard(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      img: data['img'] ?? '',
      order: data['order'] ?? 0,
    );
  }
}
