import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image(
                image: AssetImage(widget.destination.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 25.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          )
        ])
      ],
    ));
  }
}
