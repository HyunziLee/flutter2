import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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

  getPermission() async{
    var status = await Permission.contacts.status;
    if(status.isGranted){
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].givenName);

      setState(() {
        name = contacts;
      });
      print(name);


      // 연락처 추가
      var newPerson = Contact();
      newPerson.givenName = '민수';
      await ContactsService.addContact(newPerson);

    } else if (status.isDenied){
      print('거절됨');
      // Permission.contacts.request(); // 허락해달라고 팝업띄우는 코드 -> 근데 요즘 많이 거절해서 안씀
      openAppSettings();
    }
  }

  var total = 3;
  var name = [];
  var count = [0,0,0];
  var value = TextEditingController();
  addOne(){
    if(value.text == "") {return;}
    setState(() {
      name.add(value.text);
    });
  }

  // inintState 안에 적은 코드는 위젯 로드될 때 한번 실행됨
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(state: total, addOne: addOne, value: value);
            });
          },
        ),
        appBar: AppBar(title: Text(total.toString()), actions: [
          IconButton(onPressed: (){getPermission();}, icon: Icon(Icons.contacts))
        ],),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,i){
              print(i);
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name[i].toString()),
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
   DialogUI({Key? key, this.state, this.addOne, this.value}) : super(key: key);
  final state;
  final addOne;
  final value;
  var inputData = TextEditingController();
  var inputData2 = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ss"),
      content: TextField(controller: value,),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('CANCEL')),
        TextButton(onPressed: (){addOne();}, child: Text('OK')),
      ],
    );
  }
}




