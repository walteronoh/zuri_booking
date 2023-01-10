import 'package:flutter/material.dart';
import 'package:zuri_booking/src/auth/SignIn.dart';

class NavBar extends StatefulWidget {
  final Widget widget;
  const NavBar({Key? key, required this.widget}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 10),
            child: Text(
              'Hello Rider.',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
      body: widget.widget,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Rider"),
              accountEmail: Text("rider@rider.com"),
              currentAccountPicture: CircleAvatar(
                  child: Icon(
                Icons.person,
              )),
            ),
            ListTile(
              leading: Icon(
                Icons.directions_bus,
                color: Colors.blue.shade900,
                size: 30,
              ),
              title: const Text("My Rides"),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) =>
                //             const NavBar(widget: Dashboard()))))
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue.shade900,
                size: 30,
              ),
              title: const Text("Profile"),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) =>
                //             const NavBar(widget: Contractors()))))
              },
            ),
            const Divider(),
            ListTile(
                leading:
                    Icon(Icons.logout, color: Colors.grey.shade900, size: 30),
                title: const Text("Logout"),
                onTap: () => logOut(context)),
            const Divider(),
          ],
        ),
      ),
    );
  }

  void logOut(context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignIn()),
        (Route<dynamic> route) => false);
  }
}
