import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_advanced_networkimage/zoomable.dart';
import 'package:qurantajweed/screens/SharedPreferencesHelper.dart';

import 'globals.dart' as globals;

class SliderWidget extends StatefulWidget {
  final List<String> imageUrls;
  final BorderRadius imageBorderRadius;
  final int idx;
  final int page;
  final int jump;
  const SliderWidget({
    Key key,
    @required this.imageUrls,
    @required this.imageBorderRadius,
    @required this.idx,
    @required this.page,
    @required this.jump,
  }) : super(key: key);
  @override
  ImageSliderWidgetState createState() {
    final imageSliderWidgetState = new ImageSliderWidgetState();

    /* if(this.page>0){
      imageSliderWidgetState._controller.jumpToPage(this.page);
    }*/
    return imageSliderWidgetState;
  }
}

class ImageSliderWidgetState extends State<SliderWidget> {
  List<Widget> _pages = [];
  PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller = PageController(
        initialPage: (widget.page + widget.jump), keepPage: false);
    _pages = widget.imageUrls.map((url) {
      return _buildImagePageItem(url);
    }).toList();
  }

  void onPageChanged(int index) {
    globals.currentPage = index - widget.jump;
  }

  @override
  Widget build(BuildContext context) {
    return _buildingImageSlider();
  }

  Widget _buildingImageSlider() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          _buildPagerViewSlider(),
        ],
      ),
    );
  }

  Widget _buildPagerViewSlider() {
    return PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _pages.length,
        onPageChanged: onPageChanged,
        // reverse: true,
        itemBuilder: (BuildContext context, int index) {
          //   globals.currentPage =index % _pages.length-widget.jump;
          return _pages[index % _pages.length];
        });
  }

  Widget _buildImagePageItem(String imgUrl) {
    return ZoomableWidget(
        maxScale: 5.0,
        minScale: 0.5,
        multiFingersPan: false,
        singleFingerPan: false,
        autoCenter: true, // placeholder: CircularProgressIndicator(),
        child: Container(
            child: TransitionToImage(
                image: AdvancedNetworkImage(imgUrl,
                    useDiskCache: true,
                    cacheRule: CacheRule(maxAge: const Duration(days: 36600))),
                placeholder: new CircularProgressIndicator())));
    // onZoomChanged: (double value) => print(value),
  }
}
