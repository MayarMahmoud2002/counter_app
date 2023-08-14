import 'package:counter_app/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                'Counter Value is :',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterInitial)
              {
                return Text('0',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ));


              }else if (state is ChangeCounterValueState)
              {
                return Text(state.counter.toString(),
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ));


              }else
              {
                return SizedBox();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0, left: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: ()
                  {
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  onPressed: ()
                  {
                    BlocProvider.of<CounterBloc>(context).add(ResetEvent());
                  },
                  child: Icon(Icons.replay_sharp),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  onPressed: ()
                  {
                    BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
