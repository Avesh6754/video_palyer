import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/youtube_provider.dart';

class VideoPlayer extends StatefulWidget {
   VideoPlayer( {super.key,required this.name,required this.description,required this.subtitel,required this.videoUrl,});
final videoUrl;
final name;
final subtitel;
final description;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<YoutubeProvider>(context, listen: false).chewieControllerMethod(widget.videoUrl);
    },);
  }
  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<YoutubeProvider>(context, listen: true);
    var providerFalse = Provider.of<YoutubeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (providerTrue.chewieController != null &&
              providerTrue.controller!.value.isInitialized)
            AspectRatio(
              aspectRatio:
              providerTrue.controller!.value.aspectRatio,
              child: Chewie(controller: providerTrue.chewieController!),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
      ),
    );
  }
}
