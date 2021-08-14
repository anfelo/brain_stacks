import 'package:brain_stacks/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:brain_stacks/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                child: Stack(
                  children: [
                    Positioned(
                      left: -10,
                      top: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.deepPurple.withOpacity(0.5),
                        ),
                        child: Icon(
                          FontAwesomeIcons.layerGroup,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(50.0, 20.0, 20.0, 20.0),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Future.delayed(Duration.zero, () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CardStackScreen(stack: stack),
                                      ),
                                    );
                                  });
                                },
                                child: Text('START LEARNING'),
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      Theme.of(context).buttonTheme.padding,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.greenAccent,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CodeSnippetScreen(),
                                        ),
                                      );
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.code,
                                    size: 20.0,
                                  ),
                                  color: Colors.black54,
                                  iconSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    child: Icon(
                      FontAwesomeIcons.layerGroup,
                      color: Colors.grey[800],
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
