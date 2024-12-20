import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/featurs/home/presentation/cubit/home_cubit.dart';

import '../cubit/home_sate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          var cubit= BlocProvider.of<HomeCubit>(context);
          if(state is SourceSuccessState){
            cubit.getArticles(sourceId: state.sourceModel.sources![0].id??"");
          }
        },
        builder: (context, state) {
          return Scaffold(
            
          );
        },
      ),
    );
  }
}
