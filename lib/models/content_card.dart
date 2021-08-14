import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ContentType { text, orderedList, unorderedList }

ContentType parseContentType(String type) {
  switch (type) {
    case 'text':
      return ContentType.text;
    case 'unordered-list':
      return ContentType.unorderedList;
    case 'ordered-list':
      return ContentType.orderedList;
    default:
      return ContentType.text;
  }
}

IconData? parseContentIcon(String icon) {
  switch (icon) {
    case 'check':
      return FontAwesomeIcons.check;
    case 'times':
      return FontAwesomeIcons.times;
    default:
      return null;
  }
}

Color? parseContentIconColor(String color) {
  switch (color) {
    case 'success':
      return Colors.greenAccent;
    case 'danger':
      return Colors.deepOrange;
    default:
      return null;
  }
}

class ContentCard {
  final String id;
  final String? title;
  final dynamic content;
  final String? img;
  final int order;
  final ContentType contentType;
  final IconData? contentIcon;
  final Color? contentIconColor;

  ContentCard({
    required this.id,
    required this.content,
    required this.order,
    required this.contentType,
    this.title,
    this.img,
    this.contentIcon,
    this.contentIconColor,
  });

  factory ContentCard.fromMap(Map data) {
    return ContentCard(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      img: data['img'] ?? '',
      order: data['order'] ?? 0,
      contentType: parseContentType(data['contentType'] ?? ''),
      contentIcon: parseContentIcon(data['contentIcon'] ?? ''),
      contentIconColor: parseContentIconColor(data['contentIconColor'] ?? ''),
    );
  }
}
