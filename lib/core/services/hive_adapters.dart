import 'package:hive/hive.dart';
import 'package:showtrack/data/model/channel.dart';
import 'package:showtrack/data/model/country.dart';
import 'package:showtrack/data/model/embedded.dart';
import 'package:showtrack/data/model/episode.dart';
import 'package:showtrack/data/model/image_banner.dart';
import 'package:showtrack/data/model/links.dart';
import 'package:showtrack/data/model/rating.dart';
import 'package:showtrack/data/model/schedule.dart';
import 'package:showtrack/data/model/show.dart';

class HiveAdapters {
  static void init() {
    Hive.registerAdapter(ShowAdapter());
    Hive.registerAdapter(EpisodeAdapter());
    Hive.registerAdapter(ScheduleAdapter());
    Hive.registerAdapter(RatingAdapter());
    Hive.registerAdapter(LinksAdapter());
    Hive.registerAdapter(LinkEpisodeAdapter());
    Hive.registerAdapter(ChannelAdapter());
    Hive.registerAdapter(CountryAdapter());
    Hive.registerAdapter(EmbeddedAdapter());
    Hive.registerAdapter(ImageBannerAdapter());
  }
}
