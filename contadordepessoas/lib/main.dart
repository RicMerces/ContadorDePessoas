import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
      // if (count < 0) {
      //   count = 0;
      // }
    });

    // print(count);
  }

  void increment() {
    setState(() {
      count++;
      // if (count > 20) {
      //   count = 20;
      // }
    });
    // print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    // print('build');
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/europe.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull
                  ? 'Lotado'
                  : isEmpty
                      ? 'Vazio'
                      : 'Pode entrar',
              style: TextStyle(
                color: isFull ? Colors.red : Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            // const SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                '$count',
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white,
                  fontSize: 100,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    'Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.4)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
