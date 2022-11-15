import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainBanner1 extends StatefulWidget {
  const MainBanner1({
    Key? key,
    required this.size,
    required this.data
  }) : super(key: key);

  final Size size;
  final Map<String,dynamic> data;

  @override
  State<MainBanner1> createState() => _MainBanner1State();
}

class _MainBanner1State extends State<MainBanner1> {
  @override



  @override
  Widget build(BuildContext context) {

     
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId(widget.data['youtube']).toString(),
    flags: YoutubePlayerFlags(
      autoPlay: true,
      hideControls: false,
      mute: true,
      loop:true,
      disableDragSeek: true,
      showLiveFullscreenButton: false,
    ),
  );

    return Container(
      width: widget.size.width *0.9,
      height: widget.size.height * 0.25,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        aspectRatio: 3 / 1,
        bottomActions: [CurrentPosition(),SizedBox(width: 10), ProgressBar(isExpanded: true,)],
      ),
    );
  }
}
