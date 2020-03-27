import 'package:flutter/material.dart';
import 'package:first_app/screens/account.dart';
import 'package:first_app/screens/setting.dart';
// import 'package:first_app/widgets/newsList.dart';

final items = List<String>.generate(10000, (i) => "Item $i");

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
            Text('Flutter'),
          ],
        ),
      );
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {

    // Future<void> _alertDetail(String itemValue) async {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false, // user must tap button!
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Item Detail'),
    //         content: SingleChildScrollView(
    //           child: ListBody(
    //             children: <Widget>[
    //               Text('You will never be satisfied.'),
    //               Text('You\’re like me. I’m never satisfied.'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('OK'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo App"),
      ),
      // body: NewsList(),
      body: Container(
          child: Center(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Material(
                    child: InkWell(
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                              child: Text(items[index], textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 18.0,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Item Detail'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(items[index]),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                      },
                    )
                  )
                );
              },
            ),
          )
      ),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
}