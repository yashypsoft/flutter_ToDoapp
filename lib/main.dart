import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green
      ),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<String> litems = [];

  TextEditingController t1 = new TextEditingController();
  createalertdialog (BuildContext context)
  {
    return showDialog(
      barrierDismissible: false,
    context: context,
    builder: (context){
      
      return AlertDialog(
        title: Text("Enter your Task"),
        content: TextField(
          controller: t1,
          decoration: InputDecoration(
            labelText: "Task ",
            hintText: "Eg. Study"
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Add"),
            onPressed: (){
              litems.add(t1.text); // Append Text to the list
              t1.clear(); // Clear the Text area
              setState(() {}); // Redraw the Stateful Widget
              Navigator.of(context).pop(true);
              
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDoApp"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createalertdialog(context);
          
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(litems[index],style: TextStyle(
              color: Colors.indigo,
              fontSize: 20.0
            ),),
            leading: Icon(Icons.arrow_right),
          );
         },
        ),
      ),
      
    );
  }
}
 