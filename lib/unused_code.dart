     /*  Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    color: Colors.orange,
                    child: Card(elevation: 4, ),
                  ),
                ),
                Card(
                
                  elevation: 4,
                  child: SwipeCards(
                    matchEngine: _matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Stack(children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: StoryView(
                                controller: controller,
                                storyItems: profilePics,
                                repeat: false,
                                onStoryShow: (storyItem) {
                                  final index = profilePics.indexOf(storyItem);

                                  // if (index > 0) {
                                  //   setState(() {
                                  //     date = widget.user.stories[index].date;
                                  //   });
                                  // }
                                },
                                // StoryItem.pageImage(
                                //     url: "${images[index]}", controller: controller)

                                // child: Image.asset(
                                //   "${images[index]}",
                                //   fit: BoxFit.contain,
                                // ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 0.4),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFF3c0fc7),
                                    Color(0xFFc86dd7),
                                  ],
                                ),
                              ),
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "95% Match!",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Positioned(
                              top: 20,
                              left: 16,
                              child: Container(
                                height: 35,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black),
                                child: TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "2.3Km away",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )),
                          Align(
                              alignment: Alignment(0.0, 0.55),
                              child: Text(
                                "Seema Khan",
                                style: buildTextStyle(30, Colors.black),
                              )),
                          Align(
                            alignment: Alignment(0.0, 0.74),
                            child: Text(
                                "Full-time Travelller. Globe Trotter.. Occasional Photographer. Part time Singer/Dancer",
                                textAlign: TextAlign.center,
                                style: buildTextStyle(16, Colors.grey)),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildContainer(
                                    ImageConstants.ic_rewind, 24, 24),
                                buildContainer(ImageConstants.ic_love, 26, 26),
                                buildContainer(ImageConstants.ic_close, 20, 20),
                              ],
                            ),
                          )
                        ]),
                      );
                    },
                    onStackFinished: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));
                    },
                  ),
                ),
              */