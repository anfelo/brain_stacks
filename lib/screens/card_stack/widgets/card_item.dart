import 'package:flutter/material.dart';
import 'package:brain_stacks/models/models.dart';

class CardItem extends StatelessWidget {
  final ContentCard card;
  final double width;
  final double height;

  const CardItem({
    Key? key,
    required this.card,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (card.img != '')
              Container(
                width: double.infinity,
                height: 100.0,
                child: Image.asset(
                  'assets/covers/${card.img}',
                  fit: BoxFit.cover,
                ),
              ),
            if (card.title != '')
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  top: 10.0,
                ),
                child: Text(
                  card.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                card.content,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
