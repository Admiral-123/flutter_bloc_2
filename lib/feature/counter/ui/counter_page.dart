import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_2/feature/counter/bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  void initState() {
    super.initState();
    counterBloc.add(CounterIncrementEvent());
  }

  int val = 0;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("counter page"),
    //   ),
    //   body: BlocBuilder<CounterBloc, CounterState>(
    //     // block builder rebuilds the state
    //     bloc: counterBloc,
    //     builder: (context, state) {
    //       switch (state.runtimeType) {
    //         case CounterIncrementState:
    //           final successState = state as CounterIncrementState;
    //           return Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   successState.val.toString(),
    //                   style: TextStyle(fontSize: 50),
    //                 )
    //               ],
    //             ),
    //           );
    //         default:
    //           return Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   'dont know what happened',
    //                   style: TextStyle(fontSize: 20),
    //                 )
    //               ],
    //             ),
    //           );
    //       }
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //       child: Icon(Icons.add),
    //       onPressed: () {
    //         counterBloc.add(CounterIncrementEvent());
    //       }),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("counter page"),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        // BlocListener listen to actionstate and update state, (it doesnt rebuild the state)
        bloc: counterBloc,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionSate) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("snackbar action state listened")));
          } else if (state is CounterIncrementActionState) {
            setState(() {
              val = val + 1;
            });
          }
        },
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            val.toString(),
            style: TextStyle(fontSize: 50),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterIncrementActionEvent());
              },
              child: Text('Add')),
          ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterShowSnackbarActionEvent());
              },
              child: Text('Snackbar')),
        ])),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
