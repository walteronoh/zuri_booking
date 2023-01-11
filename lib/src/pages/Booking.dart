import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _bookingContent(),
        ),
      ),
    );
  }

  Widget _bookingContent() {
    return Column(
      children: [
        Row(children: [
          Icon(
            Icons.my_location,
            color: Colors.blue.shade900,
          ),
          const Text("Pickup")
        ]),
        const Text("Westlands"),
        Row(children: [
          Icon(
            Icons.place,
            color: Colors.blue.shade900,
          ),
          const Text("Dropoff")
        ]),
        const Text("Allsopps"),
        Row(children: [
          Icon(
            Icons.date_range,
            color: Colors.blue.shade900,
          ),
          const Text("Date")
        ]),
        const Text("01-01-2023"),
        Row(children: [
          Icon(
            Icons.departure_board,
            color: Colors.blue.shade900,
          ),
          const Text("Time")
        ]),
        const Text("8.00 AM"),
        Row(children: [
          Icon(
            Icons.money,
            color: Colors.blue.shade900,
          ),
          const Text("Amount")
        ]),
        const Text("Ksh. 100"),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue.shade400),
          child: TextButton(
            onPressed: () {
              _payPrompt();
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text(
              "Pay",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _payPrompt() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Payment.'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text(
                    'Payment In Progress. You Will Receive A Message On Successful Booking.'),
              ],
            ),
          ),
        );
      },
    );
  }
}
