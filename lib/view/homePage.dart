import 'package:flutter/material.dart';
import '../model/userModel.dart';
import '/view/userPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage('https://github.githubassets.com/images/modules/logos_page/Octocat.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 90, right: 90),
                    child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Write Username here..',
                              labelText: 'Search Username',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                username = value;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return UserPage(username: username);
                              }));
                            },
                            child: Text('Search'),

                          )
                        ]
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
