import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selector/model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selector<Model, String>(
                  selector: (context, model) => model.name,
                  builder: (context, value, child) {
                    log(value);
                    return Text(value);
                  },
                ),
                Consumer<Model>(
                  builder: (context, model, child) => ElevatedButton.icon(
                    onPressed: () {
                      model.changeName();
                    },
                    label: const Text('Button For Counter One'),
                    icon: const Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Selector<Model, int>(
                  selector: (context, model) => model.counter2,
                  builder: (context, value, child) {
                    log(value.toString());
                    return Text('$value');
                  },
                ),
                Consumer<Model>(
                  builder: (context, model, child) => ElevatedButton.icon(
                    onPressed: () {
                      model.incrementCounter2();
                    },
                    label: const Text('Button For Counter Two'),
                    icon: const Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<Model>(builder: (context, model, child) {
                  log(model.friend);
                  return Text(model.friend);
                }),
                Consumer<Model>(
                  builder: (context, model, child) => ElevatedButton.icon(
                    onPressed: () {
                      model.changeFriend();
                    },
                    label: const Text('Button For Counter Three'),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
