import 'package:flutter/material.dart';
import 'package:sqlite_crud/models/contact.dart';

const darkBlueColor = Color(0xff486579);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: darkBlueColor,
      ),
      home: const MyHomePage(title: 'Sqlite CRUD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Contact _contact = Contact(mobile: '', id: 123, name: '', std: 5);

  final _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: darkBlueColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _form(),
            _list(),
          ],
        ),
      ),
    );
  }

  _form() => Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Id'),
            onSaved: (val) => setState(() => _contact.id = val as int),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (val) => setState(() => _contact.name = val as String),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Standard'),
            onSaved: (val) => setState(() => _contact.std = val as int),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Mobile Number'),
            onSaved: (val) => setState(() => _contact.mobile = val as String),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Submit'),
              color: darkBlueColor,
              textColor: Colors.white,
            ),
          ),
        ]),
      ));

  _onSubmit() {
    var form = _formKey.currentState;
    if (form != null && !form.validate()) {
      return;
    }
    form?.save();
    print(_contact.id);
  }

  _list() => Container();
}
