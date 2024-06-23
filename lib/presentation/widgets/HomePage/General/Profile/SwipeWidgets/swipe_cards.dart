import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/SwipeWidgets/cards_details.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/SwipeWidgets/row_swipe_buttons.dart';

class SwipeCards extends StatelessWidget {
  const SwipeCards({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> companyLogos = [
      'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg',
      'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.jpg',
      'https://blogs.microsoft.com/wp-content/uploads/prod/2012/08/8867.Microsoft_5F00_Logo_2D00_for_2D00_screen.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa9Mdeo4S4YXDOaI4Xm53DaaHVlccVG_j7Yg&s',
      'https://as1.ftcdn.net/v2/jpg/05/43/99/34/1000_F_543993425_MHEjNzFuemuEzA29DyhbXnwkyAdmscBB.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmyLJ2v4bct5tys85j1Y9WJplxP0rhJSBkKA&s',
    ];
    return Stack(
      children: [
        CupertinoPageScaffold(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AppinioSwiper(
              onSwipeEnd: (previousIndex, targetIndex, activity) =>
                  _swipeEnd(previousIndex, targetIndex, activity, context),
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
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            companyLogos[index % companyLogos.length],
                          ),
                          fit: BoxFit.cover,
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

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity,
      BuildContext context) {
    switch (activity.direction) {
      case AxisDirection.up:
        log('Swiped up');
        break;
      case AxisDirection.down:
        log('Swiped down');
        break;
      case AxisDirection.left:
        showModalBottomSheet(
          context: context,
          builder: (context) => const CardsDetails(),
        );
        break;
      case AxisDirection.right:
        log('Swiped right');
        break;
    }
  }
}
