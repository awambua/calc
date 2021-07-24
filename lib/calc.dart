import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final a = TextEditingController();
  final b = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    a.dispose();
    b.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30.4),
        child: Column(
          children: [
            const Text(
              'Value',
              style: TextStyle(fontSize: 30.5, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 20.5,
            ),
            buildTextField("Enter A", a),
            const SizedBox(
              height: 20.5,
            ),
            buildTextField("Enter B", b),
            ElevatedButton(onPressed: calc, child: const Text('add'))
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String hint, TextEditingController textEditingController) {
    return (TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          hintText: hint),
    ));
  }

  calc() {
    setState(() {
      try {
        int c = int.parse(a.text) + int.parse(b.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'The Sum is $c',
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 10),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Error occurred ',
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 10),
        ));
      }
    });
  }
}
