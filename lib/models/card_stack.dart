import 'package:brain_stacks/models/models.dart';

class CardStack {
  final String id;
  final String title;
  final String description;
  final String group;
  List<ContentCard>? cards;

  CardStack({
    required this.id,
    required this.title,
    required this.description,
    required this.group,
    this.cards,
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
