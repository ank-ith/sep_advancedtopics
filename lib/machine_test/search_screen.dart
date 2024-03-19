import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF4EF037),
        toolbarHeight: 120,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text(
                'Search Result',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          child: Icon(Icons.sort, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          child: Icon(Icons.more_vert, color: Colors.grey),
                        ),
                      ],
                    ),
                    border: InputBorder.none,
                    hintText: "search",
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: MediaQuery.of(context).size.height*0.25,
            child: Card(elevation: 5,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('XXXXXX',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                          Text('XXXXXX'),
                          Text('XXXXXX'),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RatingBar.builder(itemSize: 20,
                                    itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('4.9',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('90.05/PH',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(height: 40,minWidth: 150,
                        onPressed: () {},
                        child: Text('PROFILE'),
                        color: Colors.grey,
                      ),
                      MaterialButton(height: 40,minWidth: 150,
                          onPressed: () {},
                          color: Color(0xFF4EF037),
                          child: Text('HIRE')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
