import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sem_miniproject/components/comp_travel_tile.dart';
import 'package:sem_miniproject/pages/creation_page.dart';
import 'package:sem_miniproject/services/firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  FirestoreService _firestore = FirestoreService();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Image.asset("assets/launcher_icon.png", height: 30),
              SizedBox(width: 12),
              Text(
                "TravoGenie",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section with Slide + Fade
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage("beach.jpg"),
                    //     fit: BoxFit.cover,
                    //     colorFilter: ColorFilter.mode(
                    //       Colors.black.withOpacity(0.3),
                    //       BlendMode.darken,
                    //     ),
                    //   ),
                    // ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 250.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8, // To cover the full container width
                      ),
                      items: [
                        'beach.jpg',  // Image 1
                        'mountains.png', // Image 2
                        'paris.jpg',   // Image 3
                        'tokyo.jpg',   // Image 4
                      ].map((item) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          "Discover Your Next Adventure",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 8,
                                color: Colors.black87,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Plan Travel Now Section with InkWell
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreationPage()),
                ),
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.lightBlueAccent.withOpacity(0.4),
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.blueGrey.shade700, Colors.black87],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Plan Your Travel Now!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "TravoGenie's AI will craft your perfect travel plan with all your preferences!",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Start Now",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.lightBlueAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Suggested Travel Plans
              Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Suggested Destinations",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      suggestedPlanCard(
                        "Maldives",
                        "Luxury Beaches",
                        "beach.jpg",
                      ),
                      suggestedPlanCard(
                        "Swiss Alps",
                        "Mountains & Snow",
                        "mountains.png",
                      ),
                      suggestedPlanCard(
                        "Paris",
                        "City of Lights",
                        "paris.jpg",
                      ),
                      suggestedPlanCard(
                        "Tokyo",
                        "Tradition & Tech",
                        "tokyo.jpg",
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Your Travel Plans
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Travel Plans",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Your saved travel plans will appear here.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                height: 220,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                child: StreamBuilder(
                  stream: _firestore.getTravelPlans(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      List<dynamic> travelPlans = snapshot.data!.get("travelPlans");
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: travelPlans.length,
                        itemBuilder: (context, index) {
                          final travelPlan = travelPlans[index];
                          if (travelPlan.length > 0) {
                            return CompTravelTile(
                              destination: "${travelPlan["location"]} to ${travelPlan["destination"]}",
                              start: "${travelPlan["start"]}",
                              end: "${travelPlan["end"]}",
                              budget: "${travelPlan["budget"]}",
                              people: "${travelPlan["people"]}",
                              response: "${travelPlan["travel_plan"]}",
                            );
                          } else {
                            return Center(
                              child: Text("No Travel Plans yet."),
                            );
                          }
                        },
                      );
                    } else {
                      return Center(
                        child: Text("Error fetching data"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget suggestedPlanCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 8, color: Colors.black)],
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
