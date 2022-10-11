import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['홍길동','홍길동2','홍길동3'];
  var count = [0,0,0];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState((){
              a++;
            });
            print(a);
          },
        ),
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,i){
              print(i);
              return ListTile(
                leading: Text(count[i].toString()),
                title: Text(name[i]),
                trailing: TextButton(
                  child: Text('좋아요'),
                  onPressed: (){
                    setState(() {
                      count[i]++;
                    });
                  },
                ),
              );
            },
            ),
        bottomNavigationBar: CustomBottom(),
      ),
    );

  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.search),
          Icon(Icons.favorite)
        ],
      ),
    );
  }
}




