import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/cards_details.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/row_swipe_buttons.dart';

class SwipeCards extends StatelessWidget {
  const SwipeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoPageScaffold(
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
                        builder: (context) => const CardsDetails(),
                      );
                    },
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/JobMatchOrange.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.73),
          child: const RowSwipeButtons(),
        ),
      ],
    );
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
}
