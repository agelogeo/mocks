import 'package:flutter/material.dart';
import 'package:mocks/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Destination',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            GestureDetector(
              onTap: () {
                print('see all');
              },
              child: Text(
                'See all',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        height: 300.0,
        color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(destinations[index].city);
          },
        ),
      ),
    ]);
  }
}
