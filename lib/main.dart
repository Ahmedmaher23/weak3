import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> userFormState = GlobalKey<FormState>();
  GlobalKey<FormState> passFormState = GlobalKey<FormState>();
  bool isDarkModeActive = false;

  send() {
    var userFormData = userFormState.currentState!.validate();
    var passFormData = passFormState.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            leading: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Switch(
                activeTrackColor: Colors.black,
                thumbColor: const MaterialStatePropertyAll<Color?>(Colors.teal),
                inactiveTrackColor: CupertinoColors.lightBackgroundGray,
                trackOutlineColor:
                    const MaterialStatePropertyAll<Color?>(Colors.transparent),
                value: isDarkModeActive,
                onChanged: (val) {
                  setState(() {
                    isDarkModeActive = val;
                  });
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  const Image(
                    height: 300,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/images/icons8-spongebob-squarepants-200.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Form(
                      key: userFormState,
                      child: TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Username Cannot be empty ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Username",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Form(
                      key: passFormState,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be empty ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: send,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Icon(Icons.lock),
          ),
        ),
      ),
      theme: isDarkModeActive ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
