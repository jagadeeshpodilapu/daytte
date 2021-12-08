import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Content {
  final String? text;
  final Color? color;

  Content({this.text, this.color});
}

class MyStoryViewScreen extends StatefulWidget {
  @override
  _MyStoryViewScreenState createState() => _MyStoryViewScreenState();
}

class _MyStoryViewScreenState extends State<MyStoryViewScreen> {
  final storyController = StoryController();
  List<SwipeItem>? _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine = MatchEngine();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  //List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _colors.length; i++) {
      _swipeItems?.add(SwipeItem(
          content: Content(color: _colors[i]),
          likeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Liked ${_colors[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Nope ${_colors[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Superliked ${_colors[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> listStoryItems = [
      StoryItem.pageImage(
          url:
              "https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGV1cm9wZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          controller: storyController),
      StoryItem.pageImage(
          url:
              "https://images.unsplash.com/photo-1533105079780-92b9be482077?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JlZWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          controller: storyController),
      StoryItem.pageImage(
          url:
              "https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          controller: storyController),
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 600,
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: _swipeItems?[index].content.color,
                    child: StoryView(
                      storyItems: listStoryItems,
                      controller: storyController,
                      inline: false,
                      repeat: true,
                    ),
                  );
                },
                onStackFinished: () {
                  _scaffoldKey.currentState?.showSnackBar(SnackBar(
                    content: Text("Stack Finished"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _matchEngine?.currentItem?.nope();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.fast_rewind),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _matchEngine?.currentItem?.superLike();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(Icons.link_outlined),
                    )),
                ElevatedButton(
                  onPressed: () {
                    _matchEngine!.currentItem?.like();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.close),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
