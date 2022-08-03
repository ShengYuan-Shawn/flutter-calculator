import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/counter_cubit.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.red),
    home: BlocProvider(
      create: (context) => CounterCubit(),
      child: const HomePage(),
    ),
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
                Text(
                  "$state",
                  style:
                      const TextStyle(fontSize: 100, fontFamily: 'Helvetica'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.decrement();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: const Text("Decrement"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.reset();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text("Reset"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.increment();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text("Increment"),
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
