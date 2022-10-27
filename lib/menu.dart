import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/vue/Insert.dart';
import 'package:tp1_whack_a_mole/scoreValidator.dart';
import 'Leaderboard.dart';
import 'about.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Column(
              children: [
                Image.asset('images/menuLogo.png'),
                  const Text(
                    'WHACK-A-MOLE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        color: Colors.white
                    ),
                  ),
                  const Text(
                    'EVERY TAP MATTERS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.lightBlue
                    ),
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
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => InsertView()));},
                      child: const Text(
                        'NEW GAME',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  Spacer(),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (3/4) , 75)),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.white;
                            return null;
                          }
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.white, width: 2)
                          )
                      ),
                    ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderBoard()));},
                    child: const Text('HIGH SCORES', style: TextStyle(color: Colors.white)),
                  ),
                Spacer(),
                TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (3/4) , 75)),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.white;
                            return null;
                          }
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.white, width: 2)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreValidator()));
                    },
                    child: const Text('SCORE VALIDATOR', style: TextStyle(color: Colors.white)),
                  ),
                Spacer(),
                TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (3/4) , 75)),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.white;
                            return null;
                          }
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.white, width: 2)
                          )
                      ),
                    ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => About()));},
                    child: const Text('ABOUT', style: TextStyle(color: Colors.white)),
                  ),
                Spacer()
              ],
            )
        ),
      ],
    );
  }
}
