import 'package:flutter/material.dart';

class GrilleJoueur extends StatefulWidget {
  const GrilleJoueur({super.key});

  @override
  State<GrilleJoueur> createState() => _GrilleJoueur();
}

class _GrilleJoueur extends State<GrilleJoueur> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
          return Container(
              padding: const EdgeInsets.all(80),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(144, 144, 144, 80), //
              ),
              child: Row(
                  children: [
                    Text("Date",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white)),
                    SizedBox(width: 50),
                    Text("Joueur",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white)),
                    SizedBox(width: 50),
                    Text("Score",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white))
                  ]
              )
          );
  }
}
