import 'package:aq_prime/domain/entities/content.dart';

abstract class ContentRepository {
  /// Gets all the contents.
  Future<List<Content>> getAllContents();

  /// Gets the content with the given [id].
  Future<Content> getContent(int id);

  /// Gets the content by category with the given [id].
  Future<List<Content>> getContentsByCategory(int id);
}
