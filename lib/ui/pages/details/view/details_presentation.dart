import 'package:flutter/material.dart';
import 'package:showtrack/core/styles/app_colors.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/ui/widgets/banner_widget.dart';

class DetailsPresentation extends StatelessWidget {
  final Show show;
  const DetailsPresentation({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: AppColors.midRed,
              child: BannerWidget(
                url: show.image?.original ?? '',
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.maxFinite,
                fit: BoxFit.fitHeight,
                useAlt: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          show.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        show.network?.name ?? show.webChannel?.name ?? '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Último episódio',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    show.links?.previousepisode?.name ?? 'Sem informações',
                    style: const TextStyle(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Próximo episódio',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Visibility(
                    visible: show.embedded?.nextepisode.toString() == null,
                    child: Text(
                      show.status == 'Ended' ? 'Finalizada' : 'Sem informações',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      show.embedded?.nextepisode?.toString() ?? '-',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.midRed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      show.embedded?.nextepisode?.dateTime ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    show.formattedSummary,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
