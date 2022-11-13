import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:showtrack/core/features/common/widgets/default_appbar.dart';
import 'package:showtrack/core/features/search/presentation/widgets/card_on_search.dart';
import 'package:showtrack/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _enableSearch = false;

  _searchShow() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Pesquisar',
        center: false,
        leadingWidget: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(LineIcons.arrowLeft),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    maxLines: 1,
                    maxLength: 30,
                    onChanged: ((value) => setState(() {
                          _enableSearch = value.length > 2;
                        })),
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar nova série',
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: SOFT_GREY, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: SOFT_GREY, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: _enableSearch ? COR_PRIMARIA : SOFT_GREY,
                ),
                child: IconButton(
                  onPressed: () {
                    _enableSearch ? _searchShow() : null;
                  },
                  icon: const Icon(
                    LineIcons.search,
                    color: WHITE,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CardOnSearch(),
        ],
      ),
    );
  }
}
