import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';
import 'package:tp1_whack_a_mole/models/player.dart';
import 'package:tp1_whack_a_mole/sqlite.dart';

class InsertView extends StatelessWidget {
  const InsertView({super.key});


  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController scoreController = TextEditingController();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Background(classeActive:
        Container(
            child : Column(
              children: [
                Container(
                    child : Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                Image.asset('images/backIcon.png', width: 75, height: 75),
                                const Text(
                                  'BACK',
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      decoration: TextDecoration.underline,
                                      fontSize: 25.0
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    )

                ),
                Container(
                  child: Column(
                    children: [
                      const Text(
                          'SAVE GAME SCORE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 32.0
                          )
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (1/2),
                  child: Row(
                    children: [
                      const Text(
                        'NAME:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          cursorColor: Colors.purple,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (1/2),
                  child: Row(
                    children: [
                      const Text(
                        'SCORE:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: scoreController,
                          cursorColor: Colors.purple,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (1/3) , 75)),
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
                    onPressed: () async {
                      await Sqlite.createScore(nameController.text, int.parse(scoreController.text));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'SAVE SCORE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                ),
                Spacer(),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.white,
                ),
                Spacer()
              ],
            )
        )
        )
    );
  }
}