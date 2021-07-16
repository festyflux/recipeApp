import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/screen/details_page.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  ///Imae paths and food names
  final images = [
    "assets/spaghetti.jpg",
    "assets/fried_rice.jpg",
    "assets/plantain_dish.jpg",
    "assets/okro_soup.jpeg",
    "assets/yam_porrige.jpeg",
    "assets/beans.jpeg",
    "assets/eforiro_soup.jpg",
    "assets/egusi.jpg",
    "assets/pepper_soup.jpg",
    "assets/pizza.jfif"
  ];

  final foodNames = [
    "spaghetti",
    "Fried Rice",
    "Plantain Dish",
    "Okro Soup",
    "Yam Porrige",
    "Beans",
    "Eforiro Soup",
    "Egusi",
    "Pepper Soup",
    "Pizza"
  ];

  @override
  Widget build(BuildContext context) {
    ///For screen size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        iconSize: 30,
        backgroundColor: Colors.deepOrange,
        //unselectedItemColor: Colors.white12,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                ///Container for header
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                      child: Text("Looking for your favourite recipe?",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 30,

                      ),)
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey,
                        onPressed: () {

                        },
                      ),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    color: Colors.grey,
                    onPressed: () {

                       }
                      )
                    ],
                  ),
                ),

                ///For Vertical Spacing
                SizedBox(height: 32,),

                ///Container for list of Recipe type
                ///Give 25 percent height relative to screen height
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                            aspectRatio:  0.9 / 1, ///width : height
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),

                                ///Add Text also
                                SizedBox(height: 8,), ///For Spacing

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    "${foodNames[index]} Recipe",
                                    style: GoogleFonts.roboto(
                                        color: Colors.black54,
                                        fontSize: 11,
                                    ),
                                  ),
                                )

                              ],
                            )
                        );
                      },
                      separatorBuilder: (context,_)=> SizedBox(width: 16,),
                      itemCount: 10,
                 )
                ),

                ///For Vertical Spacing
                SizedBox(height: 32,),

                ///For quick recipe list
                Container(
                    height: size.height * 0.45,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => DetailScreen(images[4-index])));
                          },
                          child: AspectRatio(
                              aspectRatio:  0.9 / 1, ///width : height
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Hero(

                                      child: Container(
                                        child: ClipRRect(
                                          child: Image.asset(
                                            images[4-index],
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      tag: images[4-index],
                                    ),
                                  ),

                                  ///Add Text also
                                  SizedBox(height: 8,), ///For Spacing

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      "${foodNames[4-index]} Recipe",
                                      style: GoogleFonts.roboto(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      "Recipe by Chef Flux",
                                      style: GoogleFonts.roboto(
                                        color: Colors.black54,
                                        fontSize: 11,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  )

                                ],
                              )
                          ),
                        );
                      },
                      separatorBuilder: (context,_)=> SizedBox(width: 16,),
                      itemCount: 5,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
