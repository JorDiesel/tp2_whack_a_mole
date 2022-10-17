import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tp1_whack_a_mole/GrilleJoueur.dart';
import 'package:tp1_whack_a_mole/ListAvecScroll.dart';

import 'background.dart';


class LeaderBoard extends StatelessWidget {
  const LeaderBoard ({super.key});
  /*final scores = List.generate(
    20,
        (i) => LeaderBoard(
      '09-26-2022',
      'joueur$i',
      'score: $i',
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    ScrollController _firstController = ScrollController();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Background(classeActive: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Container(
                width: 700,
                  height: 450,
                  child: Column(
                      children: [
                        Text("HIGHSCORES",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white)),
                        Spacer(),
                        Container(
                          width: 600,
                          height: 250,
                          child: ListeAvecScroll()
                          /*child: SizedBox(
                              width: constraints.maxWidth / 2,
                              // When using the PrimaryScrollController and a Scrollbar
                              // together, only one ScrollPosition can be attached to the
                              // PrimaryScrollController at a time. Providing a
                              // unique scroll controller to this scroll view prevents it
                              // from attaching to the PrimaryScrollController.

                              child: Scrollbar(

                                thumbVisibility: true,
                                controller: _firstController,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    controller: _firstController,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListeAvecScroll(),
                                      );
                                    }
                                )
                            )
                          )*/
                        ),
                        Spacer(),
                        TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (3/4) , 75)),
                            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.lightBlue;
                                  return null;
                                }
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.lightBlue, width: 2)
                                )
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'BACK TO MENU',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Spacer(),
                      ]
                  )
              ),
            )
    )
    );
  }
}/*

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

  }
}

class LeaderBoard {
  final String date;
  final String joueur;
  final String score;

  const LeaderBoard(this.date, this.joueur ,this.score);
}*/
