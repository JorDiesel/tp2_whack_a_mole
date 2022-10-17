import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';
import 'dart:math';

final _random = new Random();


/**
 * Generates a positive random integer uniformly distributed on the range
 * from [min], inclusive, to [max], exclusive.
 */
int next(int min, int max) => min + _random.nextInt(max - min);

class Jeu extends StatefulWidget {
  const Jeu({
    super.key,
    this.child,
  });


  final Widget? child;

  @override
  State<Jeu> createState() => _JeuState();
}

class _JeuState extends State<Jeu> {
  int score = 0;
  int bonus = 0;
  int life = 3;
  Circle circle = Circle();
  Timer _timer = Timer.periodic(const Duration(seconds: 5), (timer) {});

  void Good() {
    setState(() {
      score += 10 * (1 + bonus);
      bonus += 1;
      ChangeCircle();
    });
  }
  void Bad() {
    setState(() {
      bonus = 0;
      life -= 1;
      ChangeCircle();
    });
    if(life == 0){
      Navigator.pop(context);
    }
  }
  void  ChangeCircle() {
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      Bad();
    });
    setState(() {
      circle = Circle();
    }
    );
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Background(classeActive:
        Container(
            child : Column(
              children: [Row(
                children:[
                  const Spacer(),
                  Column(
                  children: [
                    const Text(
                        "Bonus",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        )
                    ),
                    Text(
                        bonus.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        )
                    )
                  ],
                ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                          "Score",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          )
                      ),
                      Text(
                          score.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          )
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                          "Life",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          )
                      ),
                      Text(
                          life.toString(),
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0
                          )
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
                Container(
                  child: Transform.translate(
                    offset: Offset(circle.x, circle.y),
                    child: Container(
                      padding: const EdgeInsets.all(0.1),
                      child: IconButton(
                        icon: Image.asset('../images/cercleBleu.png'),
                        iconSize: 100,
                        onPressed: () {
                          Timer(Duration(seconds: 5), () {
                            Bad();
                          });
                          Good();
                        },
                      )
                    ),
                  ),
                )
              ]
            ),
          )
        )
    );
  }
}

class Circle {
  late double x, y; // Declare instance variable x and y, initially null.

  Circle(){
    x = 20.0 + _random.nextInt(500 - 20);
    y = 20.0 + _random.nextInt(500 - 20);
  }
}

void main() {

}


