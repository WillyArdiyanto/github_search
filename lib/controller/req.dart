import 'baseNetwork.dart';
import '../model/repoModel.dart';
import '../model/followersModel.dart';

class DataSource {
  static DataSource instance = DataSource();

  //request for user detail
  Future<Map<String, dynamic>> loadUser(username) {
    return BaseNetwork.get("${username}");
  }

  //request for repository
  Future<List<RepoModel>> loadUsersRepo(username){
    return BaseNetwork.getRepos("${username}/repos");
  }

  //request for followers
  Future<List<FollowersModel>> loadUsersFollowers(username){
    return BaseNetwork.getFollowers("${username}/followers");
  }

  //request for following
  Future<List<FollowersModel>> loadUsersFollowing(username){
    return BaseNetwork.getFollowing("${username}/following");
  }
}