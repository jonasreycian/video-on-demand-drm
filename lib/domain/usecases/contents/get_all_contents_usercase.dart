import 'package:aq_prime/domain/entities/content.dart';
import 'package:aq_prime/domain/repositories/content_repository.dart';

class GetAllContentUsecase {
  final ContentRepository _repository;

  GetAllContentUsecase(this._repository);

  Future<List<Content>> execute() async {
    return await _repository.getAllContents();
  }
}
