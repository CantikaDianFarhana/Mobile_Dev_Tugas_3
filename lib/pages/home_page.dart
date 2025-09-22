import 'package:flutter/material.dart';
import '../models/cake.dart';
import '../models/user.dart';
import 'detail_home_page.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final primaryColor = Color(0xFFF4CEB7);


  String dummyText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nisi lacus, maximus vehicula vulputate a, aliquam in eros. Pellentesque tempus in leo viverra feugiat. Suspendisse eu suscipit metus. Sed varius fermentum dapibus. Fusce felis justo, condimentum ut ullamcorper vel, feugiat a lectus. Vestibulum libero nulla, consectetur vel lacinia ac, hendrerit id neque. Nulla vitae ultricies quam, ut porttitor ex. Ut molestie vehicula massa, ac pharetra augue venenatis quis. Nam consectetur rutrum lectus ornare luctus. Nullam tincidunt neque ut ultrices varius. Pellentesque ultrices tristique neque, vel gravida turpis iaculis sit amet. Vestibulum accumsan et lacus nec vestibulum. Fusce eu ullamcorper nulla, ut ullamcorper ligula. Nunc in viverra augue. Fusce eget nibh lorem. Donec ac massa eget nisi fermentum viverra nec id eros.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 32,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list_rounded, color: Colors.white),
                      ),
                    ),
                    Text(
                      'Good Morning, ${widget.user.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  final cake = Cake(
                                    name: 'Birthday Cake',
                                    image: 'assets/images/dummy_1.jpg',
                                    description: "Kue ulang tahun dengan krim putih "
                                                  "bergelombang dan lilin berwarna pink, tampil manis dan klasik",
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    DetailHome.routeName,
                                    arguments: cake,
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    spacing: 4,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/dummy_1.jpg',
                                        ),
                                      ),
                                      Text(
                                        'Birthday Cake',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  final cake = Cake(
                                    name: 'Cake 2',
                                    image: 'assets/images/dummy_2.jpg',
                                    description: dummyText,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    DetailHome.routeName,
                                    arguments: cake,
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    spacing: 4,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/dummy_2.jpg',
                                        ),
                                      ),
                                      Text(
                                        'Classic Cake',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  final cake = Cake(
                                    name: 'Cake 3',
                                    image: 'assets/images/dummy_3.jpg',
                                    description: dummyText,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    DetailHome.routeName,
                                    arguments: cake,
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    spacing: 4,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/dummy_3.jpg',
                                        ),
                                      ),
                                      Text(
                                        'Special Cake',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  final cake = Cake(
                                    name: 'Cake 4',
                                    image: 'assets/images/dummy_4.jpg',
                                    description: dummyText,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    DetailHome.routeName,
                                    arguments: cake,
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    spacing: 4,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/dummy_4.jpg',
                                        ),
                                      ),
                                      Text(
                                        'Wedding Cake',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
