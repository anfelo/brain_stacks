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
  List<Widget> _cardList = [];

  void _removeCard(index) {
    setState(() {
      _cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Collection<ContentCard>(path: 'stacks/${widget.stack.id}/cards')
          .getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          print(snap.data);
          return Scaffold(
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: _cardList,
              ),
            ),
          );
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

  List<Widget> _getMatchCard() {
    List<Widget> cardList = [];

    for (int x = 0; x < 3; x++) {
      cardList.add(Positioned(
        top: (x + 1) * 10,
        child: Draggable(
          onDragEnd: (drag) {
            print(drag);
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
        ),
      ));
    }

    return cardList;
  }
}
