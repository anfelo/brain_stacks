import 'package:brain_stacks/services/services.dart';
import 'package:brain_stacks/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:brain_stacks/models/models.dart';

class CardStackScreen extends StatefulWidget {
  final CardStack stack;

  CardStackScreen({
    Key? key,
    required this.stack,
  }) : super(key: key);

  @override
  _CardStackScreenState createState() => _CardStackScreenState();
}

class _CardStackScreenState extends State<CardStackScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Collection<ContentCard>(path: 'stacks/${widget.stack.id}/cards')
          .getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          print(snap.data);
          return Scaffold();
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotLoader(
                  color: Colors.deepPurple,
                  duration: Duration(milliseconds: 800),
                  size: 25,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
