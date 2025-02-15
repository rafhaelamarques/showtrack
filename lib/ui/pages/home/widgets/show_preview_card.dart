import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/ui/pages/details/details_page.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/styles/colors.dart';
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
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              showId: widget.show.id,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2,
              color: AppColors.grey.withValues(alpha: 0.6),
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
                              Fluttertoast.showToast(
                                msg: 'Série removida',
                                backgroundColor: AppColors.grey,
                                textColor: AppColors.white,
                              );
                              _homeBloc.add(HomeRemoveShowEvent(widget.show));
                            },
                            icon: Icon(
                              MdiIcons.deleteOutline,
                              color: AppColors.midRed,
                              size: 24,
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
                            overflow: TextOverflow.ellipsis,
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
          color: color ?? AppColors.midRed,
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
