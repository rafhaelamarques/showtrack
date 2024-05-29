import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBloc>(context);
    final TextEditingController controller = bloc.searchController;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Pesquisar nova série',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            bloc.add(SearchingEvent(query: controller.text));
          },
        ),
      ),
    );
  }
}
