import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp1_whack_a_mole/sqlite.dart';
import 'package:tp1_whack_a_mole/vue/update.dart';
import 'models/player.dart';

class ListeAvecScroll extends StatefulWidget {
  const ListeAvecScroll({super.key});

  @override
  State<ListeAvecScroll> createState() => _ListeAvecScroll();
}

class _ListeAvecScroll extends State<ListeAvecScroll> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: FutureBuilder<List<Player>>(
                      future: Sqlite.getPlayers(),
                      builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                              primary: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: 50,
                                    color: index.isEven
                                        ? Color.fromRGBO(120, 120, 120, 100)
                                        : Color.fromRGBO(80, 80, 80, 100),
                                    child:
                                    GestureDetector(
                                        onTap: (){
                                          print("Container clicked");
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:Row(
                                                children:[
                                                  Spacer(),
                                                  Text( DateFormat.yMMMd().format(snapshot.data![index].date),style:TextStyle(color: Colors.white)),
                                                  Spacer(),
                                                  Text(' ${snapshot.data?[index].name}',style:TextStyle(color: Colors.white)),
                                                  Spacer(),
                                                  Text('${snapshot.data?[index].score}',style:TextStyle(color: Colors.white)),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Update(player: snapshot.data?[index])));
                                                    },
                                                    child: Icon(
                                                      Icons.border_color,
                                                      color: Colors.yellow,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Sqlite.deletePlayer(int.parse('${snapshot.data?[index].id}'));                                                 },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                  Spacer()
                                                ]
                                            )

                                        )
                                    )
                                );
                              });
                        }
                        else{
                          return Center(
                              child:Text(
                                  'No score',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          );
                        }
                      },
                    )
                  ));
        });
  }
}