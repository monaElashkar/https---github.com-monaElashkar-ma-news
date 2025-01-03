import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/featurs/home/presentation/cubit/home_cubit.dart';

import '../cubit/home_sate.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          if (state is SourceSuccessState) {
            cubit.getArticles(sourceId: state.sourceModel.sources![0].id ?? "");
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text("News App"),
              ),
              body: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is SourceLoudingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      if (cubit.isLoudingSources == true) ...[
                        const Center(child: CircularProgressIndicator())
                      ] else if (cubit.sourceModel != null &&
                          cubit.sourceModel!.sources!.isNotEmpty) ...[
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.sourceModel?.sources?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    this.index = index;
                                    cubit.getArticles(
                                        sourceId: cubit.sourceModel!
                                                .sources![index].id ??
                                            "");
                                  },
                                  child: Container(
                                      width: 150,
                                      height: 150,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: index == this.index
                                            ? Colors.blue
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(cubit.sourceModel
                                              ?.sources?[index].name ??
                                          "")),
                                );
                              }),
                        ),
                      ] else if (cubit.sourceModel != null &&
                          cubit.sourceModel!.sources!.isEmpty) ...[
                        const Center(child: Text('No Data'))
                      ] else ...[
                        Center(child: Text(cubit.errorMessageSources))
                      ],
                      if (cubit.isLoudingArticles == true) ...[
                        const Center(child: CircularProgressIndicator())
                      ] else if (cubit.articlesModel != null &&
                          cubit.articlesModel!.articles!.isNotEmpty) ...[
                        Expanded(
                          child: ListView.builder(
                            itemCount: cubit.articlesModel?.articles?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(cubit.articlesModel
                                        ?.articles?[index].title ??
                                    ""),
                              );
                            },
                          ),
                        ),
                      ] else if (cubit.articlesModel != null &&
                          cubit.articlesModel!.articles!.isEmpty) ...[
                        const Center(child: Text('No Data'))
                      ] else ...[
                        Center(child: Text(cubit.errorMessageArticles))
                      ],
                    ],
                  );
                },
              )

              //  BlocBuilder<HomeCubit, HomeState>(
              //   builder: (context, state) {
              //     if (cubit.isLouding == true) {
              //       print("source is louding");
              //       return  Center(child: CircularProgressIndicator())
              //           ;
              //     } else if (cubit.sourceModel!=null && cubit.sourceModel!.sources!.isNotEmpty) {
              //       print("source is SourceSuccessState");
              //       return Column(
              //         children: [
              //           SizedBox(
              //             height: 100,
              //             child: ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               itemCount: cubit.sourceModel?.sources?.length,
              //               itemBuilder: (context, index) {

              //               return InkWell(
              //                 onTap: () {
              //                   cubit.getArticles(sourceId: cubit.sourceModel!.sources![index].id ?? "");
              //                 },                        child: Container(
              //                   width: 150,
              //                   height: 150,
              //                   margin: EdgeInsets.all(10),
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),),
              //                   child: Text(cubit.sourceModel?.sources?[index].name ?? "")),
              //               );
              //             }),
              //           ),

              //           Expanded(
              //             child: ListView.builder(
              //               itemCount: cubit.articlesModel?.articles?.length,
              //               itemBuilder: (context, index) {
              //                 return Container(
              //                   margin: const EdgeInsets.all(10),
              //                   child: Text(cubit.articlesModel?.articles?[index].title ?? ""),
              //                 );
              //               },
              //             ),
              //           ),
              //         ],
              //       );

              //     } else if (state is SourceFailerState) {
              //       print("source is SourceFailerState");
              //       return Center(child: Text(state.errorMessage));
              //     }
              //     return Container(

              //       child: Center(child: Text('Home Screen')), // Replace with your actual UI content.
              //     );
              //   },
              // ),

              );
        },
      ),
    );
  }
}
