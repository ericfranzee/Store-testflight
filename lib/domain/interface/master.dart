import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/response/master_response.dart';

abstract class MasterInterface {
  Future<Either<MasterPaginationResponse, dynamic>> getMasters({
    required int page,
    String? query,
    int? shopId,
    int? serviceId,
    List<int>? serviceIds,
  });

  Future<Either<MasterPaginationResponse, dynamic>> getLikedMaster();

  Future<Either<MasterModel, dynamic>> getMasterById({required int id});

  Future<Either<List<Galleries>, dynamic>> getMastersImage(int? id);
}
