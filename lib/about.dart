import 'package:flutter/material.dart';

import 'background.dart';

class About extends StatelessWidget {
  const About ({super.key});
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Background(classeActive:  Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Container(
            height: 400,
              width: 800,
            padding: const EdgeInsets.all(80),
            constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.headline4!.fontSize! * 1.2 + 500.0,
            ),
            alignment: Alignment.center,
            child: Column(

            children: [
              Padding(padding:EdgeInsets.all(10.0)),
              Container(
                height:1,
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('ABOUT',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding:EdgeInsets.all(10.0)),
            Text('Urna nec tincidunt praesent semper feugiat nibh sed. Interdum consectetur libero id faucibus nisl tincidunt.',
                style:
                    TextStyle(
                    color: Colors.white,
                ),

            ),
              Padding(padding:EdgeInsets.all(10.0)),
              Container(
                height:1,
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Padding(padding:EdgeInsets.all(10.0)),
              new GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child:Image.asset("../images/menuLogo.png",
                  height : 80,
                  width: 80,
                  scale : 0.1
                )
              )
            ]
            )
          ),
      )
    )
    );
  }
}
