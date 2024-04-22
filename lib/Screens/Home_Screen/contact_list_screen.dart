import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userdata/Getx/getx.dart';

import '../../ApiRepo/ApiCallFunction.dart';
import '../Contact_Detail/ContactDetail_screen.dart';
import 'user_model.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<UserDataModel> userList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLoading = true;
    });
    APiClass().loadApiData().then((value) {
      setState(() {
        userList = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  ThemeControllerClass themeController = Get.put(ThemeControllerClass());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeControllerClass>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
          actions: [
            (controller.isDarkTheme == false)
                ? IconButton(
                    onPressed: () {
                      // Get.changeTheme(ThemeData.dark());
                      controller.isDarkTheme = true;
                    },
                    icon: Icon(CupertinoIcons.sun_max))
                : IconButton(
                    onPressed: () {
                      // Get.changeTheme(ThemeData.light());
                      controller.isDarkTheme = false;
                    },
                    icon: Icon(CupertinoIcons.moon)),
          ],
        ),
        body: (isLoading == true)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactDetail(
                                userName: userList[index].name,
                                userNumber: userList[index].phone,
                              )));
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/img.png'),
                    ),
                    title: Text(
                      userList[index].name,
                      maxLines: 3,
                    ),
                    subtitle: Text(
                      "+91 " + userList[index].phone,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          final Uri url = Uri(
                            path: "+91 " + userList[index].phone,
                            scheme: 'tel',
                          );
                          await launchUrl(url);
                        },
                        icon: Icon(
                          Icons.call,
                          color: Colors.green,
                        )),
                  );
                }),
      );
    });
  }
}
