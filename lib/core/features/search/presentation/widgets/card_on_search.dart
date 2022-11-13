import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:showtrack/utils/constants.dart';

class CardOnSearch extends StatefulWidget {
  const CardOnSearch({Key? key}) : super(key: key);

  @override
  State<CardOnSearch> createState() => _CardOnSearchState();
}

class _CardOnSearchState extends State<CardOnSearch> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Row(
        children: [
          Image.asset(
            'assets/images/example.jpeg',
            width: 120,
            height: 180,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text('Stranger Things',
                    style: TextStyle(
                        color: BLACK,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Netflix',
                        style: TextStyle(color: BLACK, fontSize: 12)),
                    SizedBox(width: 70),
                    Text('Nota: 8,4',
                        style: TextStyle(color: BLACK, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: Text(
                      'After the mysterious and sudden vanishing of a young boy, the people of a small town begin to uncover secrets of a government lab, portals to another world and sinister monsters. ',
                      style: TextStyle(color: DARK_GREY, fontSize: 12)),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _added = !_added;
                    });
                  },
                  icon: _added
                      ? const Icon(
                          LineIcons.check,
                          size: 25,
                          color: COR_TERCIARIA,
                        )
                      : const Icon(
                          LineIcons.plus,
                          size: 25,
                          color: COR_TERCIARIA,
                        )))
        ],
      ),
    );
  }
}
