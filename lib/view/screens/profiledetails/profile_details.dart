import '../../../consts/image_constants.dart';
import '../../../themes/app_styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/girl.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.orange,
                    ),
                    height: 400,
                  ),
                  Positioned(
                    bottom: -250,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)]),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Text(
                                  "SEEMA KHAN",
                                  style: AppStyles.subHeading.copyWith(fontWeight: FontWeight.w700,fontFamily: 'SFPro',color: Color(0xFF363636)),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  "Bangalore - INDIA",
                                  style: buildTextStyle(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(EvaIcons.person),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "Seema",
                                          style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(EvaIcons.person),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "Khan",
                                          style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Image.asset(ImageConstants.ic_age,height: 20,width: 20,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "25 years",
                                          style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(EvaIcons.bookOpen),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "Cafe , Movies",
                                            style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(Icons.music_note_rounded),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "Singing, Dancing",
                                            style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(Icons.school),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Text(
                                          "Bangalore university",
                                          style: buildTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF6d25ba),
                              const Color(0xffba25b8),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                      child: Container(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.chat,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Text("Request to chat", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white)),
                        ],
                      )),
                    ),
                  ),
                ),
                Stack(
                   alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)]),
                      height: 280,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)]),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  // Text("SEEMA KHAN",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800),),
                                  // Text("Bangalore - India",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black26),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                          child: Text(
                                            "Photo",
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(right: 4.0),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.orange,
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.orange,
                                          ),
                                        ),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 TextStyle buildTextStyle() => AppStyles.title2.copyWith(color: Color(0xFF757e90),fontSize:16,fontFamily: 'Helvetica');

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }
}
