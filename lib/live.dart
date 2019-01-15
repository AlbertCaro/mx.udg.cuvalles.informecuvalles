/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

String video = 'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4';

class LiveTab extends StatefulWidget {
  @override
  LiveState createState() => LiveState();
}

class LiveState extends State<LiveTab> {
  VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(video)..addListener((){
      final bool isPlaying = controller.value.isPlaying;
      if (isPlaying != this.isPlaying) {
        setState(() {
          this.isPlaying = isPlaying;
        });
      }
    })..initialize().then((_){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: controller.value.initialized ?
        AspectRatio (
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ) :
        Container()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.value.isPlaying ? controller.pause : controller.play,
        child: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

}*/