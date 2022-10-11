import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home:MyApp()
      )
  );
}


class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['홍길동','홍길동2','홍길동3'];
  var count = [0,0,0];
  addOne(){
    setState(() {
      total++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(state: total, addOne: addOne );
            });
          },
        ),
        appBar: AppBar(title: Text(total.toString()),),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,i){
              print(i);
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name[i]),
              );
              },
            ),
        bottomNavigationBar: CustomBottom(),
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

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key, this.state, this.addOne}) : super(key: key);
  final state;
  final addOne;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ss"),
      content: TextField(),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('CANCEL')),
        TextButton(onPressed: (){addOne();}, child: Text('OK')),
      ],
    );
  }
}




