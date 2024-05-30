import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/services/application.dart';
import 'package:showtrack/core/styles/colors.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/search/widgets/search_field.dart';
import 'package:showtrack/ui/search/widgets/show_search_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
        backgroundColor: lightRed,
        foregroundColor: white,
      ),
      body: BlocProvider(
        create: (context) => getIt<SearchBloc>(),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                SearchField(),
                Expanded(child: SearchShowPresentation()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchShowPresentation extends StatelessWidget {
  const SearchShowPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBloc>(context);

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return bloc.state.status.when(
          initial: () => const SizedBox(),
          searching: () => const Center(
            child: CircularProgressIndicator(),
          ),
          empty: () => const Center(
            child: Text('Nada para mostrar aqui'),
          ),
          success: () => ListView.builder(
            itemCount: bloc.state.result.length,
            itemBuilder: (context, index) {
              return ShowSearchCard(show: bloc.state.result[index].show);
            },
          ),
          failure: () => const Center(
            child: Text('Erro ao buscar série'),
          ),
        );
      },
    );
  }
}
