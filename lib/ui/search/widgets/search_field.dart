import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/widgets/toast.dart';

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
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (controller.text.isNotEmpty &&
                    bloc.state.result.isNotEmpty) {
                  controller.clear();
                  bloc.add(SearchingEvent(query: controller.text));
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.text.isNotEmpty
                    ? bloc.add(SearchingEvent(query: controller.text))
                    : BaseToast.showToast(
                        context: context,
                        message: 'Que tal digitar algo?',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
