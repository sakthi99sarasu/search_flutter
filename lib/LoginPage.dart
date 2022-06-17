import 'package:flutter/material.dart';
import 'package:search/Homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/logo.jpeg',
                  height: 250.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage('assets/logo.jpg'),
              //     ),
              //   ),
              //margin: const EdgeInsets.all(20),
              //child: Image.asset('image/Doll.jpg'),
              //  alignment: Alignment.center,
              //padding: const EdgeInsets.all(20),
              //decoration: const BoxDecoration(
              //image:DecorationImage(image: AssetImage('C:/Users/Krish/AndroidStudioProjects/login/image/Doll.jpg'))

              //Image.asset(
              //'C:/Users/Krish/AndroidStudioProjects/login/'
              //  'image/Doll.jpg'),
              //width:100,
              //height:100,
              //fit:BoxFit.cover,
              //),
              //  ),
              // child: const Text(
              // 'TutorialKart',
              //style: TextStyle(
              //  color: Colors.blue,
              //fontWeight: FontWeight.w500,
              //fontSize: 30),
              //)
              //  ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              //TextButton(
              //onPressed: () {
              //forgot password screen
              //},
              //child: const Text('Forgot Password',),
              //),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      child: const Text('Login'), onPressed: loginfunction)),
            ],
          )),
    );
  }

  void loginfunction() async {
    // print(username.text);
    //print(password.text);
    bool data =
        await APIService.getItem(nameController.text, passwordController.text);
    print(data);
    if (data == true) {
      Fluttertoast.showToast(
          msg: 'Login Successfully..', toastLength: Toast.LENGTH_SHORT);
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Homepage(),
        ),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Homepage()),
      // );
    } else {
      Fluttertoast.showToast(
          msg: "Login failed.. please check username or password..",
          toastLength: Toast.LENGTH_LONG);
    }
    // username.text = "";
    // password.text = "";
  }
}
