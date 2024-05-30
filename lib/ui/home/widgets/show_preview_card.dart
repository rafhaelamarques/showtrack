import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showtrack/core/styles/colors.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/ui/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/widgets/banner_widget.dart';

class ShowPreviewCard extends StatefulWidget {
  final Show show;
  const ShowPreviewCard({
    super.key,
    required this.show,
  });

  @override
  State<ShowPreviewCard> createState() => _ShowPreviewCardState();
}

class _ShowPreviewCardState extends State<ShowPreviewCard> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            color: gray.withOpacity(0.6),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                            // _bloc.add(SearchAddEvent(show: widget.show));
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.chevron_right,
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
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Visibility(
                          visible: widget.show.rating?.average != null,
                          child: Text(
                            'Nota: ${widget.show.rating?.average ?? ''}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    IconTextWidget(
                      icon: MdiIcons.televisionPlay,
                      text: widget.show.getStatusEnum().value,
                      color: widget.show.getStatusColor(),
                    ),
                    IconTextWidget(
                      icon: MdiIcons.calendar,
                      text: widget.show.schedule?.toString() ?? '',
                    ),
                    IconTextWidget(
                      icon: MdiIcons.clockOutline,
                      text: widget.show.runtime,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color ?? midRed,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
