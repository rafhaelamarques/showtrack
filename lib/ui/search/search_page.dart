import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/search/widgets/search_field.dart';
import 'package:showtrack/ui/search/widgets/show_preview_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar nova série'),
      ),
      body: BlocProvider(
        create: (context) => SearchBloc(),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchField(),
              SearchShowPresentation(),
            ],
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
        if (state.status.isInitial) {
          return const SizedBox();
        }
        if (state.status.isSearching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status.isSuccess) {
          List<Widget> children = state.result
              .expand((element) => [
                    ShowPreviewCard(show: element.show),
                    const Divider(height: 1),
                  ])
              .toList();
          return Expanded(
            child: ListView(
              children: children,
            ),
          );
        }
        if (state.status.isEmpty) {
          return const Center(
            child: Text('Nenhum resultado encontrado'),
          );
        }
        if (state.status.isFailure) {
          return const Center(
            child: Text('Ops! Tivemos um problema ao realizar a busca'),
          );
        }
        return const SizedBox();
      },
    );
  }
}
