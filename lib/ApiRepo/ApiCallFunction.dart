import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:userdata/Screens/Home_Screen/user_model.dart';

class APiClass {

  List<UserDataModel> userList=[];
  UserDataModel? object;
  Future loadApiData() async {
    var data = await http
        .get(Uri.parse('https://dashboard.daillystock.com/api/get-users.php'));
    print(data.body);
    print('Api Data');

    var convert = jsonDecode(data.body)['data'];
    print(convert);
    print('Convert');
    for(var e  in convert){
      object=UserDataModel.fromapi(e);
      userList.add(object!);
    }
    return userList;
  }
}
