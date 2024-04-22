import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userdata/Getx/getx.dart';

class ContactDetail extends StatefulWidget {
  final String userName;
  final String userNumber;

  const ContactDetail(
      {Key? key, required this.userName, required this.userNumber})
      : super(key: key);

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  ThemeControllerClass themecontroller = Get.put(ThemeControllerClass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (themecontroller.isTheme == true)
          ? Colors.transparent
          : Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: (themecontroller.isTheme == true)
            ? Colors.transparent
            : Colors.white,
        centerTitle: true,
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 10),
            )),
        title: Text(
          'Contact Detail',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: (themecontroller.isTheme == true)
                  ? Colors.transparent
                  : Colors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/img.png'),
                    radius: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.userName),
                  SizedBox(
                    height: 10,
                  ),
                  Text("+91 " + widget.userNumber),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 140,
              width: double.infinity,
              color: (themecontroller.isTheme == true)
                  ? Colors.transparent
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("+91 " + widget.userNumber),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () async {
                            final Uri url = Uri(
                                path: "+91 " + widget.userNumber!,
                                scheme: 'tel');
                            await launchUrl(url);
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("+91 " + widget.userNumber),
                        SizedBox(
                          width: 3,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri(
                                path: "+91 " + widget.userNumber,
                                scheme: 'sms',
                              );
                              await launchUrl(url);
                            },
                            icon: Icon(
                              Icons.message,
                              // color: Colors.green,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
