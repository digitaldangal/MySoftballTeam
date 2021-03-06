import 'package:flutter/material.dart';

class AddNewPlayer extends StatefulWidget {
  @override
  _AddNewPlayerState createState() => new _AddNewPlayerState();
}

class _AddNewPlayerState extends State<AddNewPlayer> {

  List<DropdownMenuItem> _fieldPositions = [
    new DropdownMenuItem(child: new Text("Pitcher"), value: "Pitcher",),
    new DropdownMenuItem(child: new Text("First Base"), value: "First Base",),
    new DropdownMenuItem(child: new Text("Second Base"), value: "Second Base",),
    new DropdownMenuItem(child: new Text("Shortstop"), value: "Shortstop",),
    new DropdownMenuItem(child: new Text("Third Base"), value: "Third Base",),
    new DropdownMenuItem(child: new Text("Right Field"), value: "Right Field",),
    new DropdownMenuItem(child: new Text("Right Center Field"), value: "Right Center Field",),
    new DropdownMenuItem(child: new Text("Center Field"), value: "Center Field",),
    new DropdownMenuItem(child: new Text("Left Center Field"), value: "Left Center Field",),
    new DropdownMenuItem(child: new Text("Left Field"), value: "Left Field",),
    new DropdownMenuItem(child: new Text("Catcher"), value: "Catcher",),
  ];

  TextEditingController _playerNameController = new TextEditingController();
  var position;

  void _chooseFieldPosition(value) {
    setState(() {
      position = value;
      print(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add New Player"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Card(
                  elevation: 4.0,
                  child: new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new SizedBox(
                          height: 25.0,
                        ),
                        new TextField(
                          decoration: new InputDecoration(
                            icon: new Icon(Icons.person),
                            labelText: "Player Name",
                          ),
                        ),
                        new SizedBox(
                          height: 25.0,
                        ),
                        new DropdownButton(
                          items: _fieldPositions,
                          onChanged: _chooseFieldPosition,
                          hint: new Text("Choose Field Position"),
                          value: position,
                        ),
                        new SizedBox(
                          height: 15.0,
                        ),
                        new ExpansionTile(
                          title: new Text("Initial Stats (Optional)"),
                          children: <Widget>[
                            new ListTile(
                              title: new Text("Games Played"),
                              subtitle: new SizedBox(
                                width: 75.0,
                                child: new TextField(
                                    keyboardType: TextInputType.number),
                              ),
                            ),
                            new ListTile(
                              title: new Text("At Bats"),
                              subtitle: new SizedBox(
                                width: 75.0,
                                child: new TextField(
                                    keyboardType: TextInputType.number),
                              ),
                            ),
                            new ListTile(
                              title: new Text("Base Hits"),
                              subtitle: new SizedBox(
                                width: 75.0,
                                child: new TextField(
                                    keyboardType: TextInputType.number),
                              ),
                            ),
                            new ListTile(
                              title: new Text("Outs Received"),
                              subtitle: new SizedBox(
                                width: 75.0,
                                child: new TextField(
                                    keyboardType: TextInputType.number),
                              ),
                            ),
                            new ListTile(
                              title: new Text("Assists"),
                              subtitle: new SizedBox(
                                width: 75.0,
                                child: new TextField(
                                    keyboardType: TextInputType.number),
                              ),
                            ),
                            new ListTile(
                              title: new Text("Outs Fielded"),
                              subtitle: new Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: new SizedBox(
                                  width: 75.0,
                                  child: new TextField(
                                      keyboardType: TextInputType.number),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 25.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new RaisedButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: new Text(
                                "Save",
                                style: new TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              splashColor: Colors.lightBlueAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
