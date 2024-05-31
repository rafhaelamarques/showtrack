import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/webapi/dio/dio_creator.dart';

part 'tv_show_client.g.dart';

@RestApi()
abstract class TvShowClient {
  factory TvShowClient() {
    var dio = DioCreator().tvMaze();
    return _TvShowClient(dio);
  }

  @GET("/search/shows")
  Future<List<Search>> searchShows({
    @Query("q") String? q,
  });

  @GET("/shows/{id}?embed=nextepisode")
  Future<Show> getShowDetails({
    @Path("id") required int id,
  });
}
