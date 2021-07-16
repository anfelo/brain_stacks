import 'package:brain_stacks/models/models.dart';

class Topic {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Stack> stacks;

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
    required this.stacks,
  });

  factory Topic.fromMap(Map data) {
    return Topic(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      img: data['img'] ?? 'default.png',
      stacks: (data['stacks'] as List).map((v) => Stack.fromMap(v)).toList(),
    );
  }
}
