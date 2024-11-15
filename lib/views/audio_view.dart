import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediaplayer/util/globle.dart';

class AudioView extends StatefulWidget {
  const AudioView({super.key});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  int cIndex = 0;
  AssetsAudioPlayer player = AssetsAudioPlayer.newPlayer();
  List<Audio> audios = [
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/72847/1.mp3?1",
        metas: Metas(title: "")),
    // Song 1 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/72032/1.mp3?1"),
    // Song 2 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71530/1.mp3?1"),
    // Song 3 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71040/1.mp3?1"),
    // Song 4 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71956/1.mp3?1"),
    // Song 5 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71570/1.mp3?1"),
    // Song 6 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71075/1.mp3?1"),
    // Song 7 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71810/1.mp3?1"),
    // Song 8 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71711/1.mp3?1"),
    // Song 9 (Gujarati)
    Audio.network(
        "https://www.pagalworld.com.sb/files/download/type/320/id/71099/1.mp3?1"),
    // Song 10 (Gujarati)
  ];

  @override
  void initState() {
    super.initState();

    player.open(Playlist(audios: audios), autoStart: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CupertinoListTile(
                      title: Text("Category"),
                      additionalInfo: Text("More"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String path = audios[index].path;
                          return InkWell(
                            onTap: () {
                              // player.open(
                              //   Audio.network(path),
                              // );

                              player.playlistPlayAtIndex(index);
                            },
                            child: CircleAvatar(
                              radius: 55,
                              child: Text(path ?? ""),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                        itemCount: audios.length,
                      ),
                    ),
                    CarouselSlider(
                      items: audioList
                          .map((e) => Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Text(e.name ?? ""),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          // enableInfiniteScroll: false,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            cIndex = index;
                            setState(() {});
                            print("onPageChanged $index");
                          },
                          // autoPlayAnimationDuration: Duration(milliseconds: 100),
                          autoPlayInterval: Duration(seconds: 1),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2
                          // aspectRatio: 1,
                          ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isCurrent = index == cIndex;
                          return CircleAvatar(
                            radius: isCurrent ? 5 : 3,
                            backgroundColor:
                                isCurrent ? Colors.black : Colors.black45,
                          );
                        },
                        itemCount: audioList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 4,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 35,
                          ),
                          title: Text("Name"),
                          subtitle: Text("artist"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            player.previous();
                          },
                          icon: Icon(Icons.skip_previous)),
                      StreamBuilder<bool>(
                          stream: player.isPlaying,
                          builder: (context, snapshot) {
                            bool isPlay = snapshot.data ?? false;
                            return IconButton(
                                onPressed: () {
                                  player.playOrPause();
                                },
                                icon: Icon(
                                    isPlay ? Icons.pause : Icons.play_arrow));
                          }),
                      IconButton(
                          onPressed: () {
                            player.next();
                          },
                          icon: Icon(Icons.skip_next)),
                    ],
                  ),
                  StreamBuilder<Playing?>(
                      stream: player.current,
                      builder: (context, snapshot) {
                        Playing? data = snapshot.data;
                        Duration? audioDuration = data?.audio.duration;
                        if (audioDuration?.inSeconds != null) {
                          return StreamBuilder<Duration>(
                              stream: player.currentPosition,
                              builder: (context, snapshot) {
                                var duration = snapshot.data;
                                return Slider(
                                  value: (duration?.inSeconds ?? 0).toDouble(),
                                  min: 0,
                                  max: (audioDuration?.inSeconds ?? 1)
                                      .toDouble(),
                                  onChanged: (value) {},
                                );
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
