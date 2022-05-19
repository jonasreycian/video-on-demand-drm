import 'package:aq_prime/data/utils/constants.dart';
import 'package:aq_prime/data/utils/http_helper.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:aq_prime/domain/repositories/content_repository.dart';
import 'package:logging/logging.dart';

/// `DataContentRepository` is a concrete implementation of [ContentRepository].
class DataContentRepository implements ContentRepository {
  // Members
  // Singleton object of `DataContentRepository`
  static final DataContentRepository _instance =
      DataContentRepository._internal();
  late Logger _logger;

  // Constructor
  DataContentRepository._internal() {
    _logger = Logger('DataContentRepository');
  }

  factory DataContentRepository() => _instance;

  /// Gets all the contents.
  @override
  Future<List<Content>> getAllContents() async {
    try {
      Map<String, dynamic> body =
          await HttpHelper.invokeHttp(Constants.contentRoute, RequestType.get);
      _logger.finest('Get All Contents Successful.');

      List<Content> contents = [];
      for (var content in body.values) {
        contents.add(Content.fromJson(content));
      }
      return contents;
    } catch (e) {
      _logger.warning('Error getting contents', e);
      rethrow;
    }
  }

  /// Gets the content with the given [id].
  @override
  Future<Content> getContent(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Content>> getContentsByCategory(int id) {
    throw UnimplementedError();
  }
}
