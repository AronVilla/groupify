import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // NAV START
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "GROUPIFY",
            style: TextStyle(
              color: CupertinoColors.systemBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.profile_circled),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("Team Members"),
                  content: Column(
                    children: [
                      SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Estoque, Rence",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Developer",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                "images/rence.jpeg",
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Suva, Christian",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Developer",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                "images/christian.jpeg",
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Villa, Aron Dustin",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Developer",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                "images/villa.jpg",
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),
                    ],
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text(
                        "Close",
                        style: TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),

      // NAV END

      // CONTAINER START
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(child: Column(children: [



              




              ],
            )),
        ),
      ),

      // CONTAINER START
    );
  }
}
