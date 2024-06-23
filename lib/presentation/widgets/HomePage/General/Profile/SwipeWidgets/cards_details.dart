import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/SwipeWidgets/match_page.dart';

class CardsDetails extends StatefulWidget {
  const CardsDetails({super.key});

  @override
  _CardsDetailsState createState() => _CardsDetailsState();
}

class _CardsDetailsState extends State<CardsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(255, 34, 33, 33)
          : Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.60,
                floating: true,
                pinned: true,
                snap: true,
                collapsedHeight: 116,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                toolbarHeight: 56,
                titleSpacing: 0,
                centerTitle: false,
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(0),
                  title: Container(
                    height: 67,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 34, 33, 33)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 2),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      const Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.pink,
                                  size: 14,
                                ),
                                Text(
                                  'New York . 25km',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  '9.2',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 86),
                            child: Image.network(
                              "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/2400x1600/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24016885/STK093_Google_04.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 60),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                end: Alignment(0.0, 0.4),
                                begin: Alignment(0.0, -1),
                                colors: <Color>[
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            margin: const EdgeInsets.only(bottom: 100),
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AspectRatio(
                                    aspectRatio: 1.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        "https://www.keyweo.com/wp-content/uploads/2022/03/google-logo-history.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AspectRatio(
                                    aspectRatio: 1.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        "https://storage.googleapis.com/gweb-uniblog-publish-prod/images/PxG_GVE_Blog_Header-bike_1.width-1300.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AspectRatio(
                                    aspectRatio: 1.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsnf1ddVCGusjqJ5rQP9fjMg6fBWIQdqBqSg&s",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 32,
                      endIndent: 32,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Interests',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            '3 Similar',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.science,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Science',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.computer_rounded,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Technology',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Sales',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.money_off,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Marketing',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.airplanemode_active,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Travel',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.construction,
                                  color: Colors.deepOrange,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Painting',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'At our company, we strive to provide innovative solutions to our clients. With a team of talented professionals, we are dedicated to delivering high-quality products and services.',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    margin: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.deepOrange,
                        size: 28,
                      ),
                    ),
                  ),
                  Container(
                    height: 64,
                    width: 64,
                    margin: const EdgeInsets.fromLTRB(10, 16, 16, 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        end: Alignment(0.0, 0.4),
                        begin: Alignment(0.0, -1),
                        colors: <Color>[
                          Colors.pink,
                          Colors.deepOrange,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MatchPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
