import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocks/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.recommendation});

  final RecommendedModel recommendation;

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recommendation.images.length,
                (int index) => Hero(
                  tag: recommendation.images[index],
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            recommendation.images[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                height: 57.6,
                margin:
                    const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 57.6,
                        width: 57.6,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: const Color(0x10000000),
                        ),
                        child:
                            SvgPicture.asset('assets/svg/icon_left_arrow.svg'),
                      ),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color(0x10000000),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_heart_fill.svg'),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin:
                    const EdgeInsets.only(bottom: 48, right: 28.8, left: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: recommendation.images.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFFFFFFF),
                        dotColor: Color(0xFFababab),
                        dotHeight: 4.8,
                        dotWidth: 6,
                        spacing: 4.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19.2),
                      child: Text(
                        recommendation.tagLine,
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 42.6,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19.2),
                      child: Text(
                        recommendation.description,
                        maxLines: 3,
                        style: GoogleFonts.lato(
                          fontSize: 19.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start from',
                              style: GoogleFonts.lato(
                                fontSize: 16.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$ ${recommendation.price.toString()} / person',
                              style: GoogleFonts.lato(
                                fontSize: 21.6,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 62.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 28.8, right: 28.8),
                              child: Text(
                                'Explore Now',
                                style: GoogleFonts.lato(
                                  fontSize: 19.2,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
