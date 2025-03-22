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
  // VARIABLES START
  TextEditingController itemController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  List<String> items = [];
  List<List<String>> groups = [];
  Set<String> groupedItems = {};
  bool isGenerating = false;
  int currentGroup = 0;
  // VARIABLES END

  // FUNCTION START
  void addItemToList() {
    if (itemController.text.isNotEmpty) {
      setState(() {
        items.add(itemController.text);
        itemController.clear();
      });
    }
  }

  void generateGroups() {
    int membersPerGroup = int.tryParse(groupController.text) ?? 0;

    if (membersPerGroup > 0) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });

          return CupertinoAlertDialog(
            title: Text('Generating Groups'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                CupertinoActivityIndicator(),
                SizedBox(height: 10),
                Text('Loading for generating random groups...'),
              ],
            ),
          );
        },
      );

      setState(() {
        isGenerating = true;
        groupController.text = '';
        groupController.selection = TextSelection.collapsed(offset: 0);
      });

      items.shuffle();

      groups = [];
      int startIndex = 0;

      while (startIndex < items.length) {
        int endIndex = startIndex + membersPerGroup;
        if (endIndex > items.length) endIndex = items.length;

        List<String> group = items.sublist(startIndex, endIndex);
        groups.add(group);
        groupedItems.addAll(group);
        startIndex = endIndex;
      }

      items = items.where((item) => !groupedItems.contains(item)).toList();

      setState(() {
        currentGroup = 0;
      });
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Invalid Members per Group"),
            content: Text(
              "The number of members per group must be greater than zero.",
            ),
            actions: [
              CupertinoButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void showNextGroup() {
    setState(() {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });

          return CupertinoAlertDialog(
            title: Text('Generating Groups'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                CupertinoActivityIndicator(),
                SizedBox(height: 10),
                Text('Loading for generating random groups...'),
              ],
            ),
          );
        },
      );

      if (currentGroup < groups.length - 1) {
        currentGroup++;
      }
    });
  }

  void reset() {
    setState(() {
      items.clear();
      groups.clear();
      groupedItems.clear();
      currentGroup = 0;
      isGenerating = false;
      groupController.clear();
    });
  }

  // FUNCTION END

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
          child: SafeArea(
            child: Column(
              children: [
                // CONTENT START FIRST
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemFill,
                      ),
                      width: MediaQuery.of(context).size.width * 0.73,
                      child: CupertinoTextField(
                        controller: itemController,
                        padding: EdgeInsets.all(10),
                        placeholder: "Add to List",
                        placeholderStyle: TextStyle(
                          color: CupertinoColors.inactiveGray,
                        ),
                        enabled: !isGenerating,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemFill,
                      ),
                      width: MediaQuery.of(context).size.width * 0.13,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.add_circled_solid,
                          color: CupertinoColors.systemBlue.withOpacity(0.9),
                        ),
                        onPressed: addItemToList,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // CONTENT END  FIRST

                // CONTENT START  SECOND
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemFill,
                      ),
                      width: MediaQuery.of(context).size.width * 0.56,
                      child: CupertinoTextField(
                        controller: groupController,
                        padding: EdgeInsets.all(10),
                        placeholder: "Group Members Count",
                        placeholderStyle: TextStyle(
                          color: CupertinoColors.inactiveGray,
                        ),
                        enabled: !isGenerating,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemFill,
                      ),
                      width: MediaQuery.of(context).size.width * 0.13,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.arrow_clockwise,
                          color: CupertinoColors.destructiveRed.withOpacity(1),
                        ),
                        onPressed: reset,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemBlue.withOpacity(1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.13,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.arrow_2_circlepath,
                          color: CupertinoColors.white.withOpacity(1),
                        ),
                        onPressed:
                            isGenerating ? showNextGroup : generateGroups,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                // CONTENT END  SECOND

                // CONTENT START  THIRD
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.inactiveGray.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                              isGenerating
                                  ? Text(
                                    "Keep clicking the generate button until all items are grouped.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: CupertinoColors.systemBlue,
                                    ),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  )
                                  : Text(
                                    "Items",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: CupertinoColors.systemBlue,
                                    ),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // CONTENT END  THIRD
                // CONTENT START  FOURTH
                isGenerating != true
                    ? Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.inactiveGray.withOpacity(0.2),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: items.map((item) => Text(item)).toList(),
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                // CONTENT END  FOURTH

                // CONTENT START  FIFTH
                isGenerating
                    ? Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.inactiveGray.withOpacity(0.2),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                groups.isNotEmpty
                                    ? List.generate(currentGroup + 1, (index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "GROUP ${index + 1}",
                                            style: TextStyle(
                                              color: CupertinoColors
                                                  .inactiveGray
                                                  .withOpacity(0.8),
                                              fontSize: 14,
                                            ),
                                          ),
                                          ...groups[index]
                                              .map(
                                                (groupItem) => Text(groupItem),
                                              )
                                              .toList(),
                                          SizedBox(height: 20),
                                        ],
                                      );
                                    })
                                    : [
                                      Text(
                                        "No groups generated yet.",
                                        style: TextStyle(
                                          color: CupertinoColors.inactiveGray,
                                        ),
                                      ),
                                    ],
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                // CONTENT END  FIFTH
              ],
            ),
          ),
        ),
      ),

      // CONTAINER START
    );
  }
}
