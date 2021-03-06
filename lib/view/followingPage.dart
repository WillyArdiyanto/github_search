import 'package:flutter/material.dart';
import '../model/followersModel.dart';
import '../controller/req.dart';
import '../component/userPage.dart';

class FollowingPage extends StatefulWidget {
  final String username;
  const FollowingPage({Key key,  this.username}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub User", style: TextStyle(color: Colors.white)),
      ),
      body: _buildDetailRepoBody(),
    );
  }

  Widget _buildDetailRepoBody() {
    return FutureBuilder<List<FollowersModel>>(
        future: DataSource.instance.loadUsersFollowing(widget.username),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if  (snapshot.hasData) {
            return _buildSuccessSection(snapshot);
          }
          return _buildLoadingSection();
        });
  }


  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(AsyncSnapshot<List<FollowersModel>> snapshot) {
    if(snapshot.data.isNotEmpty){
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                title: _repoPage("${snapshot.data[index].login}")
            ),
            color: Colors.white70,
          );
        },
      );

    }
    else return Text("lll");
  }

  Widget _repoPage(String temp){
    if(temp == "[ ]"){
      return Center(child: Text('User Not Found'),);
    }
    else {
      return Center(child: Text(temp),);
    }
  }
}