import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zuri_booking/src/utils/BackgroundWaveClipper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController pickupDateController = TextEditingController();
  String from = "Westlands";
  String to = "Ruiru";
  String pickupTime = "6.00 AM";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
            child: Column(
              children: [_topContent(), _centerContent()],
            ),
            onWillPop: () => _exitPrompt().then((val) => false)));
  }

  Future<void> _exitPrompt() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Page Exit'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Would you wish to exit?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                await SystemChannels.platform
                    .invokeMethod('SystemNavigator.pop');
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _topContent() {
    return ClipPath(
      clipper: BackgroundWaveClipper(),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.15, // 0.25
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
              // borderRadius:
              //     BorderRadius.only(bottomLeft: Radius.circular(50))
            ),
            child: Column(
              children: [
                Expanded(
                    child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 6),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Book Your",
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 30,
                                        )),
                                    Text(
                                      "Ride",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 30),
                                    )
                                  ],
                                )))))
              ],
            )));
  }

  Widget _centerContent() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.7, // 0.75
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Select Pickup.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton(
                value: from,
                isExpanded: true,
                items: [
                  const DropdownMenuItem(
                    value: "Westlands",
                    child: Text("Westlands"),
                  ),
                  const DropdownMenuItem(
                    value: "Safaricom",
                    child: Text("Safaricom"),
                  )
                ].toList(),
                onChanged: (value) => {
                      setState((() {
                        from = value.toString();
                      }))
                    }),
            const SizedBox(height: 16),
            const Text(
              "Select Dropoff.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton(
                value: to,
                isExpanded: true,
                items: [
                  const DropdownMenuItem(
                    value: "Ruiru",
                    child: Text("Ruiru"),
                  ),
                  const DropdownMenuItem(
                    value: "Allsopps",
                    child: Text("Allsopps"),
                  ),
                  const DropdownMenuItem(
                    value: "Juja",
                    child: Text("Juja"),
                  )
                ].toList(),
                onChanged: (value) => {
                      setState((() {
                        to = value.toString();
                      }))
                    }),
            const SizedBox(height: 16),
            const Text(
              "Select Pickup Date.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Select Pickup Date.',
                hintText: 'Select Pickup Date.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              controller: pickupDateController,
              readOnly: true,
              onTap: () async {
                var pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(4101));
                if (pickedDate != null) {
                  var formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    pickupDateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Select Pickup Time.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton(
                value: pickupTime,
                isExpanded: true,
                items: [
                  const DropdownMenuItem(
                    value: "6.00 AM",
                    child: Text("6.00 AM"),
                  ),
                  const DropdownMenuItem(
                    value: "6.10 AM",
                    child: Text("6.10 AM"),
                  )
                ].toList(),
                onChanged: (value) => {
                      setState((() {
                        pickupTime = value.toString();
                      }))
                    }),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue.shade400),
                      child: TextButton(
                        onPressed: () async {},
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: const Text(
                          "Book",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )))
          ],
        ));
  }
}
