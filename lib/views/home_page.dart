import 'package:flutter/material.dart';
import 'package:mediaplayer/views/audio_view.dart';
import 'package:mediaplayer/views/video_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          // isScrollable: true,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              // child: Text("Audio"),
              icon: Icon(Icons.audiotrack),
              text: "Audio",
            ),
            Tab(
              child: Text("Video"),
              icon: Icon(Icons.video_call_rounded),
            ),
            // Tab(
            //   // child: Text("Audio"),
            //   icon: Icon(Icons.audiotrack),
            //   text: "Audio",
            // ),
            // Tab(
            //   child: Text("Video"),
            //   icon: Icon(Icons.video_call_rounded),
            // ),
            // Tab(
            //   // child: Text("Audio"),
            //   icon: Icon(Icons.audiotrack),
            //   text: "Audio",
            // ),
            // Tab(
            //   child: Text("Video"),
            //   icon: Icon(Icons.video_call_rounded),
            // ),
            // Tab(
            //   // child: Text("Audio"),
            //   icon: Icon(Icons.audiotrack),
            //   text: "Audio",
            // ),
            // Tab(
            //   child: Text("Video"),
            //   icon: Icon(Icons.video_call_rounded),
            // ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          AudioView(),
          VideoView(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.index = 0;
            },
            child: Icon(Icons.arrow_left),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.index = 1;
            },
            child: Icon(Icons.arrow_right),
          ),
        ],
      ),
    );

    // return DefaultTabController(
    //   length: 8,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       bottom: TabBar(
    //         // isScrollable: true,
    //         indicatorColor: Colors.black,
    //         indicatorSize: TabBarIndicatorSize.tab,
    //         tabs: [
    //           Tab(
    //             // child: Text("Audio"),
    //             icon: Icon(Icons.audiotrack),
    //             text: "Audio",
    //           ),
    //           Tab(
    //             child: Text("Video"),
    //             icon: Icon(Icons.video_call_rounded),
    //           ),
    //           // Tab(
    //           //   // child: Text("Audio"),
    //           //   icon: Icon(Icons.audiotrack),
    //           //   text: "Audio",
    //           // ),
    //           // Tab(
    //           //   child: Text("Video"),
    //           //   icon: Icon(Icons.video_call_rounded),
    //           // ),
    //           // Tab(
    //           //   // child: Text("Audio"),
    //           //   icon: Icon(Icons.audiotrack),
    //           //   text: "Audio",
    //           // ),
    //           // Tab(
    //           //   child: Text("Video"),
    //           //   icon: Icon(Icons.video_call_rounded),
    //           // ),
    //           // Tab(
    //           //   // child: Text("Audio"),
    //           //   icon: Icon(Icons.audiotrack),
    //           //   text: "Audio",
    //           // ),
    //           // Tab(
    //           //   child: Text("Video"),
    //           //   icon: Icon(Icons.video_call_rounded),
    //           // ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         AudioView(),
    //         VideoView(),
    //       ],
    //     ),
    //     floatingActionButton: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         FloatingActionButton(
    //           onPressed: () {
    //
    //           },
    //           child: Icon(Icons.arrow_left),
    //         ),
    //         FloatingActionButton(
    //           onPressed: () {},
    //           child: Icon(Icons.arrow_right),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
