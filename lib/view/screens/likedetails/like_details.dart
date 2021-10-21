import 'package:flutter/material.dart';

import '../../widgets/common_widgets.dart';

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Likes Details"),
      backgroundColor: Colors.white,
      body: getBody(context),
      //  bottomSheet: getFooter(),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                " 0 Likes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "You Liked",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.8,
        ),
        Expanded(
            child: ListView(
          children: List.generate(
            10,
            (index) => Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 2)
                            ]),
                        height: 280,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text("Rose Ward",
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Text("Active Now",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                        ),
                        height: 200,
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 2)
                            ]),
                        height: 280,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text("Rose Ward",
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Text("Active Now",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                        ),
                        height: 200,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
