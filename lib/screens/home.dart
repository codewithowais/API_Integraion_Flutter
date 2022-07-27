import 'package:apiintegrate/services/user_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, AsyncSnapshot snapShot) {
          if (!snapShot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapShot.data[index].name),
                  );
                });
          }
        },
      ),
    );
  }
}
