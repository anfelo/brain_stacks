import 'package:brain_stacks/models/models.dart';
import 'package:brain_stacks/screens/topics/widgets/topic_item.dart';
import 'package:brain_stacks/services/globals.dart';
import 'package:brain_stacks/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  static const String routeName = '/topics';

  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.topicsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Topic> topics = snap.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Topics'),
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: AppBottomNav(),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotLoader(
                  color: Theme.of(context).primaryColor,
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
