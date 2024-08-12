import 'package:dartz/dartz.dart';
import 'package:cea_zed/domain/model/response/form_options_response.dart';

abstract class FormOptionsInterface {
  Future<Either<FormOptionsData, dynamic>> getSingleForm(int? id);

  Future<Either<FormOptionsResponse, dynamic>> getAllForms(
      {required List<int>? serviceMasterIds});
}
