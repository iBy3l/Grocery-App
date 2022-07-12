import 'package:flutter/material.dart';

class CarouselBanner extends StatefulWidget {
  CarouselBanner({Key? key}) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final PageController _controller = PageController();

  List<String> imgCarousel = [
    'https://i.ibb.co/8B3rL4V/carousel1.png',
    'https://i.ibb.co/0sNNFHR/carousel2.png',
    'https://i.ibb.co/8B3rL4V/carousel1.png',
    'https://i.ibb.co/0sNNFHR/carousel2.png',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateState());
  }

  void _animateState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      int nextPage = _controller.page!.round() + 1;
      if (nextPage == imgCarousel.length) {
        nextPage = 0;
      }
      _controller
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.linear)
          .then((_) => _animateState());
    });
  }

  int activePage = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .22,
      child: PageView.builder(
        controller: _controller,
        pageSnapping: true,
        itemCount: imgCarousel.length,
        itemBuilder: (context, pagePositioned) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Image.network(
              imgCarousel[pagePositioned],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
