import 'package:flutter/material.dart';

class MyRides extends StatefulWidget {
  const MyRides({Key? key}) : super(key: key);

  @override
  _MyRidesState createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> {
  int mode = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: mode == 0 ? Colors.blue : Colors.blue.shade200),
                  child: TextButton(
                    onPressed: () => _selectRideList(0),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      "Upcoming",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: mode == 1 ? Colors.blue : Colors.blue.shade200),
                  child: TextButton(
                    onPressed: () => _selectRideList(1),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      "Previous",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _selectRideList(int m) {
    setState(() {
      mode = m;
    });
  }
}
