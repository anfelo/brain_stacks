import 'package:brain_stacks/models/card_stack.dart';
import 'package:brain_stacks/screens/screens.dart';
import 'package:brain_stacks/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardStackNextScreen extends StatelessWidget {
  final CardStack currentStack;

  const CardStackNextScreen({
    Key? key,
    required this.currentStack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nextStack = context.read<CardStackService>().getNextStack(currentStack);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (nextStack != null)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.arrowCircleRight,
                        color: Colors.grey[500],
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'UP NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.grey[300],
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CardStackScreen(
                                stack: nextStack,
                              ),
                            ),
                          );
                        },
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
                              padding: const EdgeInsets.fromLTRB(
                                  50.0, 20.0, 20.0, 20.0),
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
                                    nextStack.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('BACK TO ALL STACKS'),
                    style: ElevatedButton.styleFrom(
                      padding: Theme.of(context).buttonTheme.padding,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
