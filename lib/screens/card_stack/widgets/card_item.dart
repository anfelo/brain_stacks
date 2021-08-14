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
                  top: 20.0,
                ),
                child: Text(
                  card.title!.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),
            if (card.contentType == ContentType.text)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.purple,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.purple
                        ],
                        stops: [
                          0.0,
                          0.05,
                          0.9,
                          1.0
                        ], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          card.content,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (card.contentType == ContentType.orderedList)
              Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.purple
                      ],
                      stops: [
                        0.0,
                        0.05,
                        0.9,
                        1.0
                      ], // 10% purple, 80% transparent, 10% purple
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: ListView.builder(
                      itemCount: (card.content as List<dynamic>).length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: Colors.deepPurpleAccent,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    card.content[index],
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            if (card.contentType == ContentType.unorderedList)
              Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.purple
                      ],
                      stops: [
                        0.0,
                        0.05,
                        0.9,
                        1.0
                      ], // 10% purple, 80% transparent, 10% purple
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: ListView.builder(
                      itemCount: (card.content as List<dynamic>).length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (card.contentIcon == null)
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  padding: const EdgeInsets.only(top: 8.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              if (card.contentIcon != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Icon(
                                    card.contentIcon,
                                    color: card.contentIconColor,
                                    size: 20.0,
                                  ),
                                ),
                              SizedBox(
                                width: 7.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    card.content[index],
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
