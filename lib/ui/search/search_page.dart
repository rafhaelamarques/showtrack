import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/services/application.dart';
import 'package:showtrack/core/styles/colors.dart';
import 'package:showtrack/ui/home/home_page.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/search/widgets/search_field.dart';
import 'package:showtrack/ui/search/widgets/show_search_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar'),
          backgroundColor: midRed,
          foregroundColor: white,
          leading: IconButton(
            icon: Theme.of(context).platform == TargetPlatform.iOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  (MaterialPageRoute(builder: (context) => const HomePage())),
                  (route) => false);
            },
          ),
        ),
        backgroundColor: white,
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
      ),
    );
  }
}

class SearchShowPresentation extends StatelessWidget {
  const SearchShowPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.status.when(
          initial: () => const SizedBox(),
          searching: () => const Center(
            child: CircularProgressIndicator(),
          ),
          empty: () => const Center(
            child: Text('Nada para mostrar aqui'),
          ),
          success: () {
            List<Widget> children =
                state.result.take(state.result.length).expand((element) {
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
