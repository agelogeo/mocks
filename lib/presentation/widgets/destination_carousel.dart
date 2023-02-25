import 'package:flutter/material.dart';
import 'package:mocks/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Destinations",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0),
                  ),
                ),
                child: const Text("See All"),
              ),
            ],
          ),
        ),
        Container(
            height: 300,
            color: Colors.blue,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(destinations[index].city);
              },
              itemCount: destinations.length,
            ))
      ],
    );
  }
}
