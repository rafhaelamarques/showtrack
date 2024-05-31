import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:showtrack/ui/pages/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/styles/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBloc>(context);
    final TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
      onSubmitted: (value) {
        controller.text.isNotEmpty
            ? bloc.add(SearchingEvent(query: controller.text))
            : Fluttertoast.showToast(
                msg: 'Que tal digitar algo?',
                backgroundColor: grey,
                textColor: white,
              );
      },
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
                controller.text.isNotEmpty
                    ? controller.clear()
                    : (bloc.state.result.isNotEmpty &&
                            controller.text.isNotEmpty)
                        ? bloc.add(SearchingEvent(query: controller.text))
                        : null;
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.text.isNotEmpty
                    ? bloc.add(SearchingEvent(query: controller.text))
                    : Fluttertoast.showToast(
                        msg: 'Que tal digitar algo?',
                        backgroundColor: grey,
                        textColor: white,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
