import 'package:brain_stacks/models/models.dart';
import 'package:brain_stacks/screens/card_stack/widgets/card_item.dart';
import 'package:brain_stacks/screens/card_stack/widgets/card_stack_bottom_nav.dart';
import 'package:brain_stacks/screens/screens.dart';
import 'package:brain_stacks/services/services.dart';
import 'package:flutter/material.dart';

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
  int _currentIndex = 0;

  void _nextIndex() {
    setState(() {
      _currentIndex++;
    });

    if (_currentIndex == widget.stack.cards!.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => CardStackNextScreen(
            currentStack: widget.stack,
          ),
        ),
      );
    }
  }

  void _prevIndex() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _resetIndex() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Collection<ContentCard>(path: 'stacks/${widget.stack.id}/cards')
          .getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          widget.stack.cards = snap.data;
          if (widget.stack.cards!.length == 0) {
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => CardStackNextScreen(
                    currentStack: widget.stack,
                  ),
                ),
              );
            });
          }
          widget.stack.cards!.sort((a, b) => a.order.compareTo(b.order));
          return Scaffold(
              body: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: _buildCardStack(widget.stack.cards!),
                ),
              ),
              bottomNavigationBar: CardStackBottomNav(
                text: '${_currentIndex + 1}/${widget.stack.cards!.length}',
                onPrev: _prevIndex,
                onNext: _nextIndex,
                onReset: _resetIndex,
                onCancel: () {
                  Navigator.of(context).pop();
                },
              ));
        } else {
          return LoadingScreen();
        }
      },
    );
  }

  List<Widget> _buildCardStack(List<ContentCard> cards) {
    List<Widget> cardList = [];
    int endIndex =
        cards.length - _currentIndex > 3 ? 3 : cards.length - _currentIndex;
    List<ContentCard> cardsToDisplay =
        cards.sublist(_currentIndex, _currentIndex + endIndex);

    int sizeIndex = 0;
    for (int i = cardsToDisplay.length - 1; i >= 0; i--) {
      var cardWidth =
          MediaQuery.of(context).size.width - 70.0 + ((sizeIndex + 1) * 10);
      var cardHeight = MediaQuery.of(context).size.height - 115.0;
      cardList.add(
        Positioned(
          bottom: ((sizeIndex + 1) * 10),
          child: Draggable(
            onDragEnd: (drag) {
              if (drag.offset.dx.abs() > 50) {
                _nextIndex();
              }
            },
            childWhenDragging: Container(),
            feedback: CardItem(
              card: cardsToDisplay[i],
              width: cardWidth,
              height: cardHeight,
            ),
            child: CardItem(
              card: cardsToDisplay[i],
              width: cardWidth,
              height: cardHeight,
            ),
          ),
        ),
      );
      sizeIndex++;
    }
    return cardList;
  }
}
