import 'package:flutter/material.dart';

class Azkercount extends StatefulWidget {
  const Azkercount({Key? key}) : super(key: key);

  @override
  State<Azkercount> createState() => _AzkercountState();
}

class _AzkercountState extends State<Azkercount> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff07596b),
        title: Center(
          child: Text(
            "السبحة",
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'images/image88.jpg',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 180.0,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ),
                          color: Color(0xff07596b),
                        ),
                      ),
                      Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'عدد التسبيح',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xff07596b),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 300.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: incrementCount,
                            child: const Text(
                              'تسبيح',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff07596b),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          child: TextButton(
                            onPressed: resetCount,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.replay_circle_filled_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                const Text(
                                  'تصفير العداد',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff07596b),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
