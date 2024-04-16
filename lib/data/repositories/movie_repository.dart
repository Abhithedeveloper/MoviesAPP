

import 'package:movies_app/data/repositories/show_repo.dart';
import 'package:movies_app/domain/models/show.dart';

class FetchShows {
  final ShowRemoteDataSource _repository = ShowRemoteDataSource();

  Future<List<Show>> execute() async {
    return await _repository.fetchShows();
  }
}