import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return VideoCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  'assets/images/santorini.jpg',
  'assets/images/paris.jpg',
  'assets/images/venice.jpg',
  'assets/images/saopaulo.jpg',
  'assets/images/newyork.jpg',
  'assets/images/murano.jpg',
  'assets/images/newdelhi.jpg',
  'assets/images/stmarksbasilica.jpg',
];

class VideoCard extends StatefulWidget {
  final int index;

  const VideoCard(this.index, {super.key});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 8,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: _imageKey,
          ),
          children: [
            Image.asset(
              images[widget.index],
              key: _imageKey,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      // VERTICAL SCROLL width: constraints.maxWidth,
      // FOR HORIZONTAL SCROLL
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        // VERTICAL SCROLL centerLeft
        // FOR HORIZONTAL SCROLL TOP CENTER
        listItemBox.size.topCenter(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        // VERTICAL SCROLL listItemOffset.dy
        // FOR HORIZONTAL SCROLL listItemOffset.dx
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    // VERTICAL SCROLL 0.0, scrollFraction * 2 - 1
    // FOR HORIZONTAL SCROLL scrollFraction * 2 - 1, 0.0
    final verticalAlignment = Alignment(scrollFraction * 2 - 1, 0.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          // VERTICAL SCROLL Offset(0.0, childRect.top))
          // FOR HORIZONTAL SCROLL Offset(childRect.left, 0.0)
          Transform.translate(offset: Offset(childRect.left, 0.0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

// class Parallax extends SingleChildRenderObjectWidget {
//   const Parallax({
//     super.key,
//     required Widget background,
//   }) : super(child: background);

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderParallax(scrollable: Scrollable.of(context));
//   }

//   @override
//   void updateRenderObject(
//       BuildContext context, covariant RenderParallax renderObject) {
//     renderObject.scrollable = Scrollable.of(context);
//   }
// }

// class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

// class RenderParallax extends RenderBox
//     with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
//   RenderParallax({
//     required ScrollableState scrollable,
//   }) : _scrollable = scrollable;

//   ScrollableState _scrollable;

//   ScrollableState get scrollable => _scrollable;

//   set scrollable(ScrollableState value) {
//     if (value != _scrollable) {
//       if (attached) {
//         _scrollable.position.removeListener(markNeedsLayout);
//       }
//       _scrollable = value;
//       if (attached) {
//         _scrollable.position.addListener(markNeedsLayout);
//       }
//     }
//   }

//   @override
//   void attach(covariant PipelineOwner owner) {
//     super.attach(owner);
//     _scrollable.position.addListener(markNeedsLayout);
//   }

//   @override
//   void detach() {
//     _scrollable.position.removeListener(markNeedsLayout);
//     super.detach();
//   }

//   @override
//   void setupParentData(covariant RenderObject child) {
//     if (child.parentData is! ParallaxParentData) {
//       child.parentData = ParallaxParentData();
//     }
//   }

//   @override
//   void performLayout() {
//     size = constraints.biggest;

//     // Force the background to take up all available width
//     // and then scale its height based on the image's aspect ratio.
//     final background = child!;
//     final backgroundImageConstraints =
//         BoxConstraints.tightFor(width: size.width);
//     background.layout(backgroundImageConstraints, parentUsesSize: true);

//     // Set the background's local offset, which is zero.
//     (background.parentData as ParallaxParentData).offset = Offset.zero;
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     // Get the size of the scrollable area.
//     final viewportDimension = scrollable.position.viewportDimension;

//     // Calculate the global position of this list item.
//     final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
//     final backgroundOffset =
//         localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

//     // Determine the percent position of this list item within the
//     // scrollable area.
//     final scrollFraction =
//         (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

//     // Calculate the vertical alignment of the background
//     // based on the scroll percent.
//     final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

//     // Convert the background alignment into a pixel offset for
//     // painting purposes.
//     final background = child!;
//     final backgroundSize = background.size;
//     final listItemSize = size;
//     final childRect =
//         verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

//     // Paint the background.
//     context.paintChild(
//         background,
//         (background.parentData as ParallaxParentData).offset +
//             offset +
//             Offset(0.0, childRect.top));
//   }
// }
