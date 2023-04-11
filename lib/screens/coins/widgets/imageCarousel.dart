import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final List<String> subtitles;
  final List<String> body;
  final List<IconData> icon;

  ImageCarousel({
    required this.imageUrls,
    required this.titles,
    required this.subtitles,
    required this.body,
    required this.icon,
  });

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.9,
              initialPage: _currentIndex,
            ),
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        _buildTitleAndSubtitle(),
      ],
    );
  }

  Widget _buildTitleAndSubtitle() {
    final isEvenIndex = _currentIndex % 2 == 0;
    final title = widget.titles[_currentIndex];
    final subtitle = widget.subtitles[_currentIndex];
    final body = widget.body[_currentIndex];
    final icon = widget.icon[_currentIndex];

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISizedBox.gapH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: UIColors.redMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  UISizedBox.gapW10,
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 2.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              UISizedBox.gapH20,
              Text(
                body,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
      onEnd: () {
        if (isEvenIndex) {
          setState(() {
            _buildTitleAndSubtitle();
          });
        }
      },
    );
  }
}
