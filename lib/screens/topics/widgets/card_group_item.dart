import 'package:flutter/material.dart';
import 'package:brain_stacks/models/models.dart';

class CardGroupItem extends StatelessWidget {
  final CardStack stack;
  final bool isActive;
  final Function onPressed;

  const CardGroupItem({
    Key? key,
    required this.stack,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Card(
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CARDS STACK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        stack.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('START LEARNING'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: 50.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              onPressed(stack.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CARDS STACK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        stack.title,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}