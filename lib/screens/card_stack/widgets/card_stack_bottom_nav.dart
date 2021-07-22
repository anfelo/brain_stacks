import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardStackBottomNav extends StatelessWidget {
  final Function onPrev;
  final Function onNext;
  final Function onReset;
  final Function onCancel;
  final String text;

  const CardStackBottomNav({
    Key? key,
    required this.onPrev,
    required this.onNext,
    required this.onReset,
    required this.onCancel,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => onCancel(),
            icon: Icon(
              FontAwesomeIcons.times,
              color: Theme.of(context).accentColor,
            ),
          ),
          IconButton(
            onPressed: () => onPrev(),
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(text),
          IconButton(
            onPressed: () => onNext(),
            icon: Icon(
              FontAwesomeIcons.arrowRight,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () => onReset(),
            icon: Icon(
              FontAwesomeIcons.undo,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
