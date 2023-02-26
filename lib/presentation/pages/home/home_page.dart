import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocks/models/popular_model.dart';
import 'package:mocks/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController =
      PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: 57.6,
                margin:
                    const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: const Color(0x080a0928),
                        ),
                        child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
                      ),
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: const Color(0x080a0928),
                        ),
                        child: SvgPicture.asset('assets/svg/icon_search.svg'),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Explore\nthe Nature',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 30,
                margin: const EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 14.4),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 14.4),
                    isScrollable: true,
                    labelColor: const Color(0xFF000000),
                    unselectedLabelColor: const Color(0xFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    indicatorColor: const Color(0xFF000000),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(
                        child: Container(child: const Text('Recommended')),
                      ),
                      Tab(
                        child: Container(child: const Text('Popular')),
                      ),
                      Tab(
                        child: Container(child: const Text('New Destination')),
                      ),
                      Tab(
                        child: Container(child: const Text('Hidden Gems')),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 218.4,
                margin: const EdgeInsets.only(top: 16),
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => Container(
                      margin: const EdgeInsets.only(right: 28.8),
                      width: 333.6,
                      height: 218.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(recommendations[index].image),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 19.2,
                            left: 19.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.8),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaY: 19.2, sigmaX: 19.2),
                                child: Container(
                                  height: 36,
                                  padding: const EdgeInsets.only(
                                      left: 16.72, right: 14.4),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/icon_location.svg',
                                      ),
                                      const SizedBox(
                                        width: 9.52,
                                      ),
                                      Text(
                                        recommendations[index].name,
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 16.8,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFF8a8a8a),
                    dotColor: Color(0xFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  children: [
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 28.8, right: 9.6),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 19.2),
                      height: 45.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].color),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 19.2,
                          ),
                          Image.asset(
                            populars[index].image,
                            height: 16.8,
                          ),
                          const SizedBox(
                            width: 19.2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
