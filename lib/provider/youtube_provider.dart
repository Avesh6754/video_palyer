import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';


import '../modal/youtube_modal.dart';
import '../services/apihelper.dart';

class YoutubeProvider extends ChangeNotifier {
  YoutubeModal? youtubeModal;
   late VideoPlayerController controller;
   ChewieController? chewieController;

  Future<YoutubeModal?> fetch() async {
    final data = await ApiService.apiService.fetchApiData();
    youtubeModal = YoutubeModal.fromMap(data);
    notifyListeners();
    return youtubeModal;
  }

  YoutubeProvider() {
    fetch();
  }

  Future<void> videoControllerInitilisationMethod(var videoUrl) async {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl.split('http').join('https')),
    );
    await controller.initialize();
  }



  Future<void> chewieControllerMethod(var videourl)
  async {
    await videoControllerInitilisationMethod(videourl);
     chewieController= ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: false,
    );
     notifyListeners();

  }
}
