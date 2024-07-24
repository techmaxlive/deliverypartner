import 'dart:convert';

import 'package:flutter/material.dart';

class SampleListScreen extends StatefulWidget {
  const SampleListScreen({super.key});

  @override
  State<SampleListScreen> createState() => _SampleListScreenState();
}

var l1 = [
  {"score": "4.5", "review": "The pizza was amazing!"},
  {"score": "5.0", "review": "Very friendly staff, excellent service!"}
];

class _SampleListScreenState extends State<SampleListScreen> {
  var list = [
    {
      "name": "Pizza",
      "cuisine": "Italian",
      "reviews": jsonEncode(l1),
    },
    {
      "name": "Burger",
      "cuisine": "Italian",
      "reviews": jsonEncode(l1),
    },
    {
      "name": "Chips",
      "cuisine": "Italian",
      "reviews": jsonEncode(l1),
    },
    {
      "name": "Snackes",
      "cuisine": "Italian",
      "reviews": jsonEncode(l1),
    },
    {
      "name": "Sweets",
      "cuisine": "Italian",
      "reviews": jsonEncode(l1),
    }
  ];
  var indexC = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Data",
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                var data = list[index];
                return Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      data['name'].toString(),
                    ),
                  ),
                );
              },
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${list[indexC]['score']}------------------',
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                      mainAxisExtent: 150,
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // padding around the grid
                    itemCount:
                        (jsonDecode(list[indexC]['reviews'].toString()) as List)
                            .length, // total number of items
                    itemBuilder: (context, index) {
                      var data =
                          jsonDecode(list[indexC]['reviews'].toString())[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['score']),
                          Text(
                            data['review'],
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
