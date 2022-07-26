import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopui/coffee_tye.dart';
import 'package:shopui/util/home_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List coffeeType = [
    ['cappuccino', true],
    ['Caffeine Fix', false],
    ['Coffee Bloom', false],
    ['Mc Cafe', false],
  ];
  void coffeetypeselected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1]= false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body:
          //find the best Coffee.
          Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find The Coffee For You",
              style: GoogleFonts.bebasNeue(fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find Your Coffee',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: ((context, index) {
                return Coffeetype(
                    coffeetype: coffeeType[index][0],
                    isselected: coffeeType[index][1],
                    onTap: () {
                      coffeetypeselected(index);
                    });
              }),
              
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:  const [
                Coffee(
                  coffeeImge: 'lib/images/22.png',
                  coffeename: 'cappuccino',
                  coffeprice: '150',
                ),
                Coffee(
                  coffeeImge: 'lib/images/333.png',
                  coffeename: 'caffeina fix',
                  coffeprice: '180',
                ),
                Coffee(
                  coffeeImge: 'lib/images/coffe.png',
                  coffeename: 'Coffee Bloom',
                  coffeprice: '250',
                ),
                Coffee(
                  coffeeImge: 'lib/images/coffee1.png',
                  coffeename: 'mcCafe',
                  coffeprice: '300',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
