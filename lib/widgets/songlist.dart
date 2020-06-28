import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:lottie/lottie.dart';
import 'package:pseudomusic/utils/constants.dart';
import 'package:pseudomusic/utils/variables.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<SongInfo> songlist = new List<SongInfo>();
  bool showsSearchBar = false;
  int r;
  int g;
  int b;
  double o;
  Timer t, t1;
  Color defcolor;

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
    listdiscoController = new StreamController();
  }

  checkParams() {
    if (disco1) {
      updateColors();
    }
    if (disco2) {
      updateColors2();
    }
  }

  controlmodes() {
    if (discomode == DiscoModes.unison) {
      controlinison();
    } else if (discomode == DiscoModes.random) {
      controlrandom();
    }
  }

  controlinison() {
    if (disco2) {
      disco2 = false;
      t1.cancel();
      discoController.add(homepagedisco = !homepagedisco);
    }
    randomcol = false;
    disco1 = !disco1;
    discoController.add(homepagedisco = !homepagedisco);
    if (t != null && t.isActive) {
      t.cancel();
    } else {
      updateColors();
    }
  }

  controlrandom() {
    if (disco1) {
      disco1 = false;
      t.cancel();
      discoController.add(homepagedisco = !homepagedisco);
    }
    disco2 = !disco2;
    randomcol = true;
    discoController.add(homepagedisco = !homepagedisco);
    if (t1 != null && t1.isActive) {
      t1.cancel();
    } else {
      updateColors2();
    }
  }

  discoCtrl() {
    listdiscoController.stream.listen((event) {
      if (modeStatus == DiscoModeStatus.onplay) {
        if (!playing && t1 != null && t1.isActive) {
          t1.cancel();
        } else {
          controlmodes();
        }
      } else if (modeStatus == DiscoModeStatus.always && event == true) {
        controlmodes();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getColors();
    discoCtrl();
    checkParams();
  }

  @override
  Widget build(BuildContext context) {
    defcolor = Theme.of(context).primaryColor;
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
                        child: Text(
                          'All Songs',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: disco
                                ? Color.fromRGBO(r, g, b, o > 0.7 ? o : 0.7)
                                : defcolor,
                          ),
                        ),
                      );
                    } else {
                      Color color = Color.fromRGBO(r, g, b, o > 0.7 ? o : 0.7);
                      if (darkmode && color.computeLuminance() < 0.5) {
                        color = Color.fromRGBO(r, g, b, 0.7);
                      }
                      return ListTile(
                        focusColor: Colors.blueAccent,
                        hoverColor: Colors.blueAccent,
                        onTap: () {
                          setState(() {
                            playing = !playing;
                            Scaffold.of(context).removeCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(new SnackBar(
                                content:
                                    Text('Playings: ' + playing.toString())));
                            listdiscoController.add(false);
                          });
                        },
                        leading: CircleAvatar(
                          backgroundColor: disco ? color : defcolor,
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
            backgroundColor:
                disco ? Color.fromRGBO(r, g, b, o > 0.7 ? o : 0.7) : defcolor,
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
