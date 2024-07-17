import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nirikshan/screens/location_tracking_screen.dart';
import 'package:nirikshan/services/auth_service.dart';

// void main() {
//   runApp(const MyApp());
// }

class GetStart extends StatelessWidget {
  const GetStart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NIRIKSHAN',
      home: welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffff4590),
                  Color(0xff382743),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/LOGOROUND.jpeg',
                      width: 220,
                    ),
                    const Text(
                      'NIRIKSHAN',
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xfff0f1f5),
        appBar: AppBar(title: Text("Home"), centerTitle: true, actions: [
          TextButton.icon(
            onPressed: () async {
              await Auth_Service().signOut();
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
          )
        ]),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(18),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: RichText(
                        text: const TextSpan(
                            text: 'Your',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffff4590),
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                          TextSpan(
                            text: ' Planned Duty ',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          )
                        ])),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * .3,
                    child: Image.network(
                        'https://img.freepik.com/premium-vector/security_185822-56.jpg'),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 200,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            top: 10,
                            left: 20,
                            child: Text(
                              'View Location:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Positioned(
                              top: 30,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_disabled_outlined,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        width: 300,
                                        child: const TextField(
                                          cursorColor: Colors.grey,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'abc chouk,city name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 80,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.grey,
                                      ),
                                      SingleChildScrollView(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          width: 300,
                                          child: const TextField(
                                            cursorColor: Colors.grey,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                letterSpacing: 1.4),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'dd/mm/yyyy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 130,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.timeline_outlined,
                                        color: Colors.grey,
                                      ),
                                      SingleChildScrollView(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          width: 300,
                                          child: const TextField(
                                            cursorColor: Colors.grey,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                letterSpacing: 1.4),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'hh:mm:ss AM/PM',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )),

                          /*  Positioned(
                            top: 150,
                            left: 20,
                            child: SizedBox(
                              width: size.width * .8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Back',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),*/

                          // Positioned(
                          //     bottom: -20,
                          //     right: 30,
                          //     child: Container(
                          //       padding: const EdgeInsets.all(22),
                          //       height: 60,
                          //       width: 60,
                          //       decoration: const BoxDecoration(
                          //         gradient: LinearGradient(
                          //             colors: [
                          //               Color(0xff382743),
                          //               Color(0xffff4590),
                          //             ],
                          //             stops: [
                          //               0.0,
                          //               1.0
                          //             ],
                          //             begin: FractionalOffset.topLeft,
                          //             end: FractionalOffset.bottomRight),
                          //         shape: BoxShape.circle,
                          //       ),
                          //       child: Image.asset(
                          //         'assets/images/arrowpravin.jpeg',
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the SecondPage when the button is pressed.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LocationTracking()));
                      },
                      child: Text('Go to location'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}













// import 'dart:html';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // root widget
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
//   }
// }

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             leading: Icon(Icons.menu),
//             title: const Text("Region: Karad"),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(left: 25.0),
//                 child: Icon(Icons.account_box_rounded),
//               )
//             ]),
//         body: SingleChildScrollView(
//           child: Container(
//             color: Colors.blue,
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.green,
//                     child: Image.asset(
//                       "images/multimap.jpeg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.15,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.blue,
//                     child: Row(children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.13,
//                           width: MediaQuery.of(context).size.width * 0.3,
//                           color: Colors.grey,
//                           child: Center(
//                               child: Container(
//                                   child: Row(
//                             children: [
//                               Text(" "),
//                               Icon(Icons.message),
//                               Text(" Message Ground \n Personeel"),
//                             ],
//                           ))),
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Container(
//                             height: MediaQuery.of(context).size.height * 0.15,
//                             width: MediaQuery.of(context).size.width * 0.55,
//                             color: Colors.grey,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child:
//                                       Container(child: Text("Other Locations")),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.location_on),
//                                     Text(" 1. Sangli"),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.location_on),
//                                     Text(" 2. Kolhapur"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ]),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }