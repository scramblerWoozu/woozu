import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainBanner1 extends StatefulWidget {
  const MainBanner1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MainBanner1> createState() => _MainBanner1State();
}

class _MainBanner1State extends State<MainBanner1> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://youtu.be/CsVNaydxxuk").toString(),
    flags: YoutubePlayerFlags(
      autoPlay: true,
      hideControls: true,
      mute: true,
      showLiveFullscreenButton: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.size.height * 0.25,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.amber,
        aspectRatio: 3 / 1,
        bottomActions: [],
      ),
    );
  }
}

class MainBanner2 extends StatefulWidget {
  const MainBanner2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MainBanner2> createState() => _MainBanner2State();
}

class _MainBanner2State extends State<MainBanner2> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://youtu.be/CsVNaydxxuk").toString(),
    flags: YoutubePlayerFlags(
      autoPlay: false,
      hideControls: true,
      mute: true,
      showLiveFullscreenButton: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.size.height * 0.25,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.amber,
        aspectRatio: 3 / 1,
        bottomActions: [],
      ),
    );
  }
}
