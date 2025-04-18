import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/core/styles/app_colors.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/pages/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/pages/search/components/search_field.dart';
import 'package:showtrack/ui/pages/search/components/show_search_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
        backgroundColor: AppColors.midRed,
        foregroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => getIt<SearchBloc>(),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                SearchField(),
                Expanded(child: SearchShowLayout()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchShowLayout extends StatelessWidget {
  const SearchShowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    final homeBloc = context.read<HomeBloc>();

    return BlocConsumer(
      bloc: searchBloc,
      listenWhen: (previous, current) {
        return searchBloc.state.status == SearchStatus.add;
      },
      listener: (context, state) {
        homeBloc.add(HomeLoadEvent());
      },
      builder: (context, state) {
        return searchBloc.state.status.when(
          initial: () => const SizedBox(),
          searching: () => const Center(
            child: CircularProgressIndicator(),
          ),
          empty: () => const Center(
            child: Text('Nenhum resultado encontrado'),
          ),
          success: () {
            List<Widget> children = searchBloc.state.result
                .take(searchBloc.state.result.length)
                .expand((element) {
              return [
                ShowSearchCard(show: element.show),
              ];
            }).toList();
            return ListView(
              children: children,
            );
          },
          failure: () => const Center(
            child: Text('Erro ao buscar série'),
          ),
        );
      },
    );
  }
}
