import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {

  final image; ///For hero tagging and showing relative image

  DetailScreen(this.image);

  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

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
        backgroundColor: Colors.red,
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[

            ///First show the image
            Hero(
            child: Container(
              height: size.height*0.55,
                child: Image.asset(
                  image, fit: BoxFit.cover,
                )
              ),
              tag: image,
            ),

            ///Container for more content
            DraggableScrollableSheet(
                maxChildSize: 1,
                initialChildSize: 0.6,
                minChildSize: 0.6,
                builder: (context, controller) {
                  return SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                              "Great food for you",
                            style: GoogleFonts.roboto(
                              fontSize: 22 ,
                              fontWeight: FontWeight.bold
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                  iconSize: 30,
                                  onPressed: () {

                                }
                              )
                            ],
                          ),
                          SizedBox(height: 2,),
                          Text(
                            "By Chef Flux",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.orange, size: 15,),
                              Icon(Icons.star, color: Colors.orange, size: 15,),
                              Icon(Icons.star, color: Colors.orange, size: 15,),
                              Icon(Icons.star, color: Colors.orange, size: 15,),
                              Icon(Icons.star, color: Colors.grey, size: 15,),
                            ],
                          ),

                          SizedBox(
                            height: 24,
                          ),
                          ///Container for food information
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Calories",
                                        style: GoogleFonts.roboto
                                        (color: Colors.grey),
                                        ),
                                        Text(
                                          "174Cal",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Ingredients",
                                          style: GoogleFonts.roboto
                                            (color: Colors.grey),
                                        ),
                                        Text(
                                          "06",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Time",
                                          style: GoogleFonts.roboto
                                            (color: Colors.grey),
                                        ),
                                        Text(
                                          "1 Hour",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 24,
                          ),

                          Text("About Recipe",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          SizedBox(
                            height: 24,
                          ),

                          Text("Cooking Method",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.grey
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(""
                              "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.grey
                          ),
                            textAlign: TextAlign.justify,
                          )


                        ],
                      ),
                    ),
                  );
            },
            )

          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
