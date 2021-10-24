import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Passing Data',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Returning Data Demo'),
      ),
      body: const Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Pick an option.'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        content: Text("You clicked:  $result")));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick and option.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 33);
              },
              child: const Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}

