import 'package:flutter/material.dart';

class SenhasScreen extends StatelessWidget{
  const SenhasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Armazenamento de senhas")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("BOTÃO FOI CLICADO");
        }, 
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Instagram'),
              subtitle: 
              Text('Passsword1234'),
              trailing: Icon(Icons.edit),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Banco'),
              subtitle: 
              Text('Passsword4321'),
              trailing: Icon(Icons.edit),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Gmail'),
              subtitle: 
              Text('Passsword0000'),
              trailing: Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}