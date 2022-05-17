import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_bloc.dart';
import 'cart_event.dart';
import 'cart_states.dart';

class BlocDemoScreen extends StatefulWidget {
  const BlocDemoScreen({Key? key}) : super(key: key);

  @override
  State<BlocDemoScreen> createState() => _BlocDemoScreenState();
}

class _BlocDemoScreenState extends State<BlocDemoScreen> {
  int counts=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => CartBloc(),
          child: BlocConsumer<CartBloc, CartsStates>(
            listener: (context, state) {
              if (state is ChangeNameStates) {
                counts = state.count;
              }
            },
            builder: (context, state) => Column(
              children: [
                Text(counts.toString(), style: TextStyle(fontSize: 20)),
                ElevatedButton(
                    onPressed: () {
                      counts=counts+1;
                      context
                          .read<CartBloc>()
                          .add(ChangeNameEvents(count: counts.toInt()));
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      counts=counts-1;
                      context
                          .read<CartBloc>()
                          .add(ChangeNameEvents(count: counts.toInt()));
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
