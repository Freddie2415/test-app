import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/counter/presentation/manager/counter_cubit.dart';

class CounterControl extends StatelessWidget {
  const CounterControl({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return BlocBuilder<CounterCubit, int>(
      builder: (context, counter) {
        return Column(
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: counterCubit.increment,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: null,
              onPressed: counterCubit.decrement,
              child: const Icon(Icons.remove),
            ),
          ],
        );
      },
    );
  }
}
