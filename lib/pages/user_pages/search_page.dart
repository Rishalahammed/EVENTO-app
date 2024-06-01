import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/user_pages/productdetails_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //
  //
  //
  //**********Example og lists we used in the program*********
  // static List<Productdt> main_products = [
  //   Productdt("titleex", "detailex", 1000, "assets/images/img1.png"),
  //   Productdt("aitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("aitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("uitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("kitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("eitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("eitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("witleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("pitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("oitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("oitleex", "detailex", 1000, "assets/images/facebook.png"),
  //   Productdt("gdteftye", "jhvedvgg", 400, "assets/images/facebook.png"),
  // ];
  //
  //
  //
  //************** This list will be accessed for search **************
  // List<Productdt> display_list = List.from(main_products);
  // //
  // //
  // //
  // //************ Function for filtering the list ***********
  // void updateList(String value) {
  //   setState(
  //     () {
  //       display_list = main_products
  //           .where((element) => element.product_title!
  //               .toLowerCase()
  //               .contains(value.toLowerCase()))
  //           .toList();
  //     },
  //   );
  // }

  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    Provider.of<FireStore>(context, listen: false).fetchAllProductForSearch();
    return Scaffold(
      backgroundColor: Colors.teal,
      // resizeToAvoidBottomInset: false,
      //
      //
      //
      //************** Body part ****************
      body: Consumer<FireStore>(builder: (context, firestore, child) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                //
                //
                //
                //*************** Sized box contains image *****************
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  child: Image.asset("assets/images/search_img.jpg"),
                ),
                //
                //
                //
                //**************** Whole container with contain column with search bar and elements ****************
                Container(
                  height: 630,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  //
                  //
                  //
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 23, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        //
                        //
                        //
                        TextField(
                          onChanged: (value) => (firestore.updateList(value)),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              hintText: "Search",
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.search),
                              ),
                              prefixIconColor: Colors.white),
                          cursorColor: Colors.black,
                        ),
                        //
                        //
                        //
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //
                        //
                        Expanded(
                          //
                          //
                          //************ If search has got 0 result *************
                          child: firestore.display_list.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No Result Found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              //
                              //
                              //
                              //****************** List view builder to show the results *******************
                              : ListView.builder(
                                  itemCount: firestore.display_list.length,
                                  itemBuilder: (context, index) => ListTile(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    //Leading image of the tile
                                    leading: AspectRatio(
                                      aspectRatio: 1,
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                          firestore
                                              .display_list[index].img_url!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Title of the tile
                                    title: Text(
                                      firestore
                                          .display_list[index].product_category,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //Subtitle of the tile
                                    subtitle: Text(firestore.display_list[index]
                                        .product_description),
                                    // Trailing of the tile
                                    trailing: Text(
                                      "₹ ${firestore.display_list[index].product_prize}",
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                              productModel: firestore
                                                  .display_list[index]),
                                        ),
                                      );
                                      //============================C O M M E N T E D
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(),
                                      //   ),
                                      // );
                                    },
                                  ),
                                ),
                          //
                          //
                          //
                        ),
                      ],
                    ),
                  ),
                ),
                //
                //
                //
              ],
            ),
          ),
        );
      }),
      //
      //
      //
    );
  }
}
