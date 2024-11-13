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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  return CircleAvatar(
                    radius: 55,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: 10,
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
                        child: Text(e),
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
                    backgroundColor: isCurrent ? Colors.black : Colors.black45,
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
    );
  }
}
