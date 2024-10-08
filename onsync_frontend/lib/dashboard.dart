import 'package:flutter/material.dart';
import 'api_service.dart';
import 'settings.dart';
import 'coffeemachinescreen.dart';
import 'Login.dart';

class Dashboard extends StatelessWidget {
  final ApiService apiService;
  final Map<String, dynamic> userInfo;

  const Dashboard({super.key, required this.apiService, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01204E),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(35.0),
            ),
            child: Container(
              height: 291.0,
              color: const Color(0xFFC19A6B),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow icon
                    Container(
                      width: 48,
                      height: 40,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.brown,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 16.0),

                    // 'Hi, user' Text
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: const Text(
                        'Hi, user',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: SizedBox(
                        width: 37,
                        height: 37,
                        child: const Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.brown,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 50),
                child: Wrap(
                  spacing: 20.0, // Space between the boxes horizontally
                  runSpacing: 60.0, // Space between the boxes vertically
                  children: [
                    // COFFEE MACHINE
                    SizedBox(
                      width: 130,
                      height: 170,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                              color: const Color(0xFFC19A6B), width: 5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CoffeeMachineScreen(apiService: apiService),
                              ),
                            );
                          },
                          // "Coffee Machine" Text
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: const Text(
                                  "Coffee Machine",
                                  style: TextStyle(
                                    color: Color(0xFF2A9FD1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Coffee machine icon
                              Container(
                                width: 75,
                                height: 69,
                                alignment: Alignment.centerRight,
                                child: ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(0, 81, 227, 1),
                                      Color.fromRGBO(10, 223, 244, 1),
                                    ],
                                  ).createShader(bounds),
                                  child: const Icon(
                                    Icons.coffee_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SPRINKLER SYSTEM
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 130,
                      height: 170,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                              color: const Color(0xFFC19A6B), width: 5),
                        ),
                        // "Sprinkler System" Text
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: const Text(
                                "Sprinkler System",
                                style: TextStyle(
                                  color: Color(0xFF2A9FD1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // Sprinkler System icon
                            Container(
                              width: 75,
                              height: 69,
                              alignment: Alignment.centerRight,
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(0, 81, 227, 1),
                                    Color.fromRGBO(10, 223, 244, 1),
                                  ],
                                ).createShader(bounds),
                                child: const Icon(
                                  Icons.water_drop_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SETTINGS
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 130,
                      height: 170,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                              color: const Color(0xFFC19A6B), width: 5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings(),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 85.0, left: 22.5),
                                child: const Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: Color(0xFF2A9FD1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Settings icon
                              Positioned(
                                top: 25,
                                right: 28,
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      const Color.fromRGBO(0, 81, 227, 1),
                                      const Color.fromRGBO(10, 223, 244, 1),
                                    ],
                                  ).createShader(bounds),
                                  child: const Icon(
                                    Icons.settings_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ACCOUNT
                    SizedBox(width: 20),
                    SizedBox(
                      width: 130,
                      height: 170,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border:
                              Border.all(color: Color(0xFFC19A6B), width: 5),
                        ),
                        child: GestureDetector(
                          onTap: () {                           // Navigator.push(
                            //  context,
                             // MaterialPageRoute(
                               //   builder: (context) => Account()),
                          //  );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('Account Information',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      backgroundColor: Color(0xFF01204E),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      content: Container(
                                          width: 300,
                                          height: 150,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Username
                                                Text(
                                                  'Username:',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                  width: 194,
                                                  height: 26,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    initialValue: userInfo['username'],
                                                    decoration: InputDecoration(
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white70),
                                                      filled: true,
                                                      fillColor: Colors.white24,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),

                                                // Password
                                                SizedBox( height: 10,),
                                                Text(
                                                  'Password:',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                  width: 194,
                                                  height: 26,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    initialValue: userInfo['password'],
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white70),
                                                      filled: true,
                                                      fillColor: Colors.white24,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ])));
                                });
                          },
                          // "Account Text"
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 85.0, left: 22.5),
                                child: const Text(
                                  "Account",
                                  style: TextStyle(
                                    color: Color(0xFF2A9FD1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                top: 25,
                                right: 28,
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      const Color.fromRGBO(0, 81, 227, 1),
                                      const Color.fromRGBO(10, 223, 244, 1),
                                    ],
                                  ).createShader(bounds),
                                  child: const Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        

// LOGOUT
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 200, bottom: 25),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color(0xFF01204E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Container(
                        width: 300,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Are you sure you want to logout?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen(apiService: apiService,)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFC19A6B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFCDCDCD)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}