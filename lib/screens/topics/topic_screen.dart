import 'package:brain_stacks/models/models.dart';
import 'package:brain_stacks/screens/topics/widgets/card_group_item.dart';
import 'package:brain_stacks/screens/topics/widgets/card_group_title.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  final Topic topic;

  TopicScreen({
    required this.topic,
  });

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  String _selectedStack = '';

  @override
  void initState() {
    super.initState();
    _selectedStack = widget.topic.stacks[0].id;
  }

  _buildGroups() {
    var widgets = [];
    widget.topic.groups.forEach((group) {
      List<CardStack> stacks = widget.topic.stacks
          .where((stack) => stack.group == group.name)
          .toList();
      if (stacks.length > 0) {
        widgets.add(
          CardGroupTitle(title: group.title),
        );
        for (var i = 0; i < stacks.length; i++) {
          var nextStack = i < stacks.length - 1 ? stacks[i + 1] : null;
          widgets.add(
            CardGroupItem(
              stack: stacks[i],
              nextStack: nextStack,
              isActive: _selectedStack == stacks[i].id,
              onPressed: (String selected) {
                setState(() {
                  _selectedStack = selected;
                });
              },
            ),
          );
        }
      }
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.topic.title),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 35,
            child: Container(
              width: 8,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[800],
            ),
          ),
          ListView(
            children: [
              Hero(
                tag: widget.topic.id,
                child: Image.asset(
                  'assets/covers/${widget.topic.img}',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              ..._buildGroups(),
            ],
          ),
        ],
      ),
    );
  }
}
