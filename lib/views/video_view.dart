import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(
          "https://rr4---sn-cvh76ner.googlevideo.com/videoplayback?expire=1731666259&ei=88w2Z6CqGYi0rtoP2fa22QU&ip=125.25.217.111&id=o-ALMc48FVbCA1H4qNBU6fTIzvLlWze3uO9D4zSq-cIVw4&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&bui=AQn3pFQ1yQSnCOoNwywdSGJy0GSX0I7OedUruHUcZvsnoozu59tV6zrmwIAKn3EL-iFX9EcMJzQxfZhh&spc=qtApAQb8PHjjKHcqVeXAchA5VcpnkV7ZoLZ4-nYHVfX9Zb-8pzK_nr4pqrsvDzQ&vprv=1&c=MWEB&svpuc=1&mime=video%2Fmp4&ns=Jwgtjwrhq3rsFOebB2_zWPYQ&rqh=1&gir=yes&clen=3847344&ratebypass=yes&dur=122.717&lmt=1727675046429418&fexp=24350590,24350655,24350675,24350705,24350737,24350785,51299154,51312688,51326932,51331020&sefc=1&txp=6309224&n=H1pI7Mh-EUEbCA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Cc%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgDymtggqJsN-WCzW4bucIDm6z2OhtdMKFE5FHrdasQuYCIQCqYPxYgCnVvW6PhCvBAcAJDZwwwdSqduIczpQ-srZ_yQ%3D%3D&title=MediaQuery.propertyOf%20(Technique%20of%20the%20Week)&rm=sn-uvu-2ins7e,sn-uvu-c33le7e,sn-30asd76&rrc=79,79,104&req_id=10ecccf4e4bda3ee&cmsv=e&rms=nxu,au&redirect_counter=3&cms_redirect=yes&ipbypass=yes&met=1731644665,&mh=9b&mip=103.177.194.55&mm=30&mn=sn-cvh76ner&ms=nxu&mt=1731643102&mv=u&mvi=4&pl=24&lsparams=ipbypass,met,mh,mip,mm,mn,ms,mv,mvi,pl,rms&lsig=AGluJ3MwRgIhAKYhipSE8CEuSFV83iOJbccf8l3EzGYI_bQH31WDmsEUAiEA7PiHCSGbN1C5EBtkY6nOra7SJYGtu41BOGecYi_NwnE%3D"));
  ChewieController? chewieController;

  @override
  void initState() {
    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController, autoPlay: true);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (chewieController != null)
      return Column(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio ?? 1,
              child: Chewie(controller: chewieController!),
            ),
          ),
        ],
      );
    return Center(child: CircularProgressIndicator());
  }
}
