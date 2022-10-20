import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tp1_whack_a_mole/ListAvecScroll.dart';
import 'package:tp1_whack_a_mole/sqlite.dart';

import 'background.dart';


class LeaderBoard extends StatelessWidget {
  const LeaderBoard ({super.key});

  @override
  Widget build(BuildContext context) {
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
}
