import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/ui/pages/search/bloc/search_bloc.dart';
import 'package:showtrack/ui/styles/colors.dart';
import 'package:showtrack/ui/widgets/banner_widget.dart';

class ShowSearchCard extends StatefulWidget {
  final Show show;
  const ShowSearchCard({
    super.key,
    required this.show,
  });

  @override
  State<ShowSearchCard> createState() => _ShowSearchCardState();
}

class _ShowSearchCardState extends State<ShowSearchCard> {
  late SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      color: white,
      elevation: 0,
      child: Row(
        children: [
          BannerWidget(
            url: widget.show.image?.medium ?? '',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.show.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _searchBloc.add(SearchAddEvent(show: widget.show));
                          setState(() {});
                        },
                        icon: Icon(
                          _searchBloc.addedShows.any(
                                  (element) => element.id == widget.show.id)
                              ? Icons.check
                              : Icons.add,
                          color: midRed,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.show.network?.name ??
                            widget.show.webChannel?.name ??
                            'Sem canal',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Visibility(
                        visible: widget.show.rating?.average != null,
                        child: Text(
                          'Nota: ${widget.show.rating?.average ?? ''}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.show.formattedSummary,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
