import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mocks/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopRowWithSeeAll(),
        ListCarousel(),
      ],
    );
  }
}

class ListCarousel extends StatelessWidget {
  const ListCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Destination destination = destinations[index];
          return Container(
            margin: const EdgeInsets.all(10),
            width: 210,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                WhiteContainerWithText(destination: destination),
                ImageSection(destination: destination),
              ],
            ),
          );
        },
        itemCount: destinations.length,
      ),
    );
  }
}

class TopRowWithSeeAll extends StatelessWidget {
  const TopRowWithSeeAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top Destinations",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).primaryColor,
              ),
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
    );
  }
}

class WhiteContainerWithText extends StatelessWidget {
  const WhiteContainerWithText({
    super.key,
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      child: Container(
        height: 120,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${destination.activities.length} activities",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                destination.description,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6,
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              height: 180,
              width: 180,
              image: AssetImage(destination.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 10,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      destination.country,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
