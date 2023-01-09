import 'package:flutter/material.dart';
import 'package:zuri_booking/src/pages/Dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _topContent(),
            _signInForm(context),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  Widget _topContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // const Image(image: AssetImage("assets/images/ecorp.png")),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Zuri Booking",
            style: TextStyle(color: Colors.grey[600], fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _signInForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue.shade400),
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const Dashboard())));
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ))),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
