import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_bloc/internet_bloc.dart';
import 'bloc/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetrGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Internet Connected',
              ),
              backgroundColor: Colors.green,
            ));
            
          }
          else if(state is InternetLostState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Internet Lost'), backgroundColor: Colors.red,)
            )
          }
        },
        builder: (context, state) {
          if (state is InternetrGainedState) {
            return Text('Internet Connected');
          } else if (state is InternetLostState) {
            return Text('Internet Lost');
          } else {
            return Text('Loading...');
          }
        },
      ),
    )

        // body: Center(
        //   child: BlocBuilder<InternetBloc, InternetState>(
        //     builder: (context, state) {
        //       if (state is InternetrGainedState) {
        //         return Text('Internet Connected');
        //       } else if (state is InternetLostState) {
        //         return Text('Internet Lost');
        //       } else {
        //         return Text('Loading...');
        //       }
        //     },
        //   ),
        // ),
        );
  }
}
