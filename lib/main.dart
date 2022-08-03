import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/counter_cubit.dart';
import 'counter_result.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.red),
    home: BlocProvider(
      create: (context) => CounterCubit(),
      child: const HomePage(),
    ),
    routes: {
      '/home': (context) => HomePage(),
      '/result': (context) => Multiplication(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Counter",
        theme: ThemeData.dark(),
        home: BlocProvider(
            create: (context) => CounterCubit(), child: const HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  late CounterCubit cubit;

  final _valueController = TextEditingController();

  @override
  void didChangeDependencies() {
// TODO: implement didChangeDependencies
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies(); // callback all the functions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: BlocConsumer<CounterCubit, int>(
        listener: (context, state) {
          // state is from the cubit
          const snackbar = SnackBar(content: Text("State is reached"));

          if (state == 5) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        // bloc: cubit,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: TextField(
                    controller: _valueController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter a number'),
                  ),
                ),
                Text(
                  "$state",
                  style: const TextStyle(fontSize: 80, fontFamily: 'Helvetica'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.decrement();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text("-"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.reset();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text("Reset"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.increment();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text("+"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // cubit.multiplication();
                          int input = int.parse(_valueController.text);
                          navigateToResultPage(context, input, state);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text("x"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // cubit.division();
                          int input = int.parse(_valueController.text);
                          navigateToResultPage(context, input, state);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text("÷"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void navigateToResultPage(BuildContext context, int input, int state) {
  Navigator.pushNamed(context, '/result', arguments: {
    input: input,
    state: state,
  });
}
