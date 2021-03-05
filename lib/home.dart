import 'package:flutter/material.dart';
import 'package:tik_tok_ui/widgets/ChewieListItem.dart';
import 'package:video_player/video_player.dart';
import 'widgets/actions_toolbar.dart';
import 'widgets/bottom_toolbar.dart';
import 'widgets/video_description.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/videos/odogwu.mp4",
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Widget get topSection => Container(
        height: 100,
        child: Row(
          children: <Widget>[Text("Following")],
        ),
      );

  Widget get videoDescription => Videodescription();

  Widget get actionsToolbar => ActionsToolbar();

  Widget get middleSection => Expanded(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Videodescription(),
          ActionsToolbar(),

          //   VideoPlayerController.network(dataSource)
        ],
      ));

  Widget get bottomSection => BottomToolbar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
            fit: StackFit.expand,
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: 0.5 / 1,
                        child: VideoPlayer(_controller),
                      )
                    : Container(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                            setState(() {
                              _controller.setLooping(true);
                            });
                          },
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ),
              ),
              Column(
                children: <Widget>[topSection, middleSection, bottomSection],
              ),
            ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 400),
          child: FloatingActionButton(
            mini: true,
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
              setState(() {
                _controller.setLooping(true);
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
