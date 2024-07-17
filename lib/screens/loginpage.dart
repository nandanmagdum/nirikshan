import 'package:flutter/material.dart';
import 'package:nirikshan/screens/getstarted.dart';
import 'package:nirikshan/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwaordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.black, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          )),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                child: const Center(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: _emailcontroller,
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    Icons.email_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )),
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: _passwaordcontroller,
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              )),
                          obscureText: true,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_emailcontroller.text == "" ||
                                  _passwaordcontroller.text == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("All fields required!"),
                                ));
                              } else {
                                User? result = await Auth_Service().login(
                                    _emailcontroller.text,
                                    _passwaordcontroller.text,
                                    context);
                                if (result != null) {
                                  print("Done, Sucess!");

                                  /// direct to admin page
                                  // if (result.email ==
                                  //         "shivamthokal009@gmail.com" ||
                                  //     result.email ==
                                  //         "nandanmagdum14@gmail.com" ||
                                  //     result.email ==
                                  //         "codinghero1234@gmail.com") {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               AdminHomePage()));
                                  // }

                                  /// direct to admin page
                                  // else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GetStart()),
                                      (route) => false);
                                  // }
                                }
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);

    throw UnimplementedError();
  }
}
