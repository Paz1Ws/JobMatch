import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/widgets/HomePage/SwipeView/bottom_shet_details.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: AppinioSwiper(
          onSwipeEnd: _swipeEnd,
          cardCount: 100,
          cardBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const DetailsPage(),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(index.toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
  switch (activity.direction) {
    case AxisDirection.up:
      log('Swiped up');
      break;
    case AxisDirection.down:
      log('Swiped down');
      break;
    case AxisDirection.left:
      log('Swiped left');
      break;
    case AxisDirection.right:
      log('Swiped right');
      break;
  }
}
