import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:pseudomusic/utils/variables.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

StreamSubscription periodicSub;
StreamSubscription periodicSub2;

class _SongListState extends State<SongList> {
  List<SongInfo> songlist = new List<SongInfo>();
  bool showsSearchBar = false;
  int r;
  int g;
  int b;
  double o;
  Timer t, t1;
  Color listcolor;

  getColors() {
    r = ur = Random().nextInt(255);
    g = ug = Random().nextInt(255);
    b = ub = Random().nextInt(255);
    o = uo = Random().nextDouble();
    discoController.add(false);
  }

  updateColors() {
    t = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {
        r = Random().nextInt(255);
        g = Random().nextInt(255);
        b = Random().nextInt(255);
        o = Random().nextDouble();
      });
    });
  }

  updateColors2() {
    t1 = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (t != null && t.isActive) {
      t.cancel();
    }
    if (t1 != null && t1.isActive) {
      t1.cancel();
    }
  }

  checkParams() {
    if (disco) {
      updateColors();
    }
    if (disco2) {
      updateColors2();
    }
  }

  @override
  void initState() {
    super.initState();
    getColors();
    checkParams();
  }

  @override
  Widget build(BuildContext context) {
    listcolor = disco || disco2
        ? Color.fromRGBO(r, g, b, o > 0.7 ? o : 0.7)
        : Theme.of(context).accentColor;
    return Stack(
      children: [
        FutureBuilder(
          future: songs,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (context, index) {
                    if (disco2 || randomcol) {
                      r = Random().nextInt(255);
                      g = Random().nextInt(255);
                      b = Random().nextInt(255);
                    }
                    if (index == 0) {
                      return Container(
                        padding: EdgeInsets.only(left: 30.0, top: 40.0),
                        height: 120.0,
                        child: Row(
                          children: [
                            Text(
                              'All Songs',
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: listcolor,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                if (disco2) {
                                  disco2 = false;
                                  t1.cancel();
                                  discoController
                                      .add(homepagedisco = !homepagedisco);
                                }
                                randomcol = false;
                                disco = !disco;
                                discoController
                                    .add(homepagedisco = !homepagedisco);
                                if (t != null && t.isActive) {
                                  t.cancel();
                                } else {
                                  updateColors();
                                }
                              },
                              icon: Icon(
                                Icons.lightbulb_outline,
                                color: listcolor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (disco) {
                                  disco = false;
                                  t.cancel();
                                  discoController
                                      .add(homepagedisco = !homepagedisco);
                                }
                                disco2 = !disco2;
                                randomcol = true;
                                discoController
                                    .add(homepagedisco = !homepagedisco);
                                if (t1 != null && t1.isActive) {
                                  t1.cancel();
                                } else {
                                  updateColors2();
                                }
                              },
                              icon: Icon(
                                FontAwesome.lightbulb_o,
                                color: listcolor,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      Color color = listcolor;
                      if (darkmode && color.computeLuminance() < 0.5) {
                        color = disco || disco2
                            ? Color.fromRGBO(r, g, b, 0.7)
                            : Theme.of(context).accentColor;
                      }
                      return ListTile(
                        focusColor: Colors.blueAccent,
                        hoverColor: Colors.blueAccent,
                        leading: CircleAvatar(
                          backgroundColor: color,
                          child: snapshot.data[index - 1].albumArtwork != null
                              ? Image.file(
                                  snapshot.data[index - 1].albumArtwork)
                              : Icon(Icons.music_note),
                        ),
                        title: Text(snapshot.data[index - 1].title),
                      );
                    }
                  },
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      'assets/loading.json',
                      height: 200.0,
                    ),
                    SizedBox(height: 20.0),
                    Text('Loading media, please wait ...')
                  ],
                ),
              );
            }
          },
        ),
        // Positioned(
        //         top: 200,
        //         child: Padding(
        //           padding: const EdgeInsets.all(40.0),
        //           child: Container(
        //             height: 40.0,
        //             width: MediaQuery.of(context).size.width,
        //             color: Colors.white,
        //             child: Text('Hi'),
        //           ),
        //         ),
        //       ),
        Positioned(
          right: 20,
          top: 60,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                showsSearchBar = !showsSearchBar;
              });
            },
            mini: true,
            backgroundColor: Color.fromRGBO(r, g, b, o > 0.7 ? o : 0.7),
            child: Icon(
              Icons.search,
              size: 20.0,
            ),
          ),
        )
      ],
    );
  }
}
