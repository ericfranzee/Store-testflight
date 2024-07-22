import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/response/currencies_response.dart';
import 'package:ibeauty/domain/model/response/global_settings_response.dart';
import 'package:ibeauty/domain/model/response/help_response.dart';
import 'package:ibeauty/domain/model/response/languages_response.dart';
import 'package:ibeauty/domain/model/response/mobile_translations_response.dart';

import '../model/model/translation_model.dart';


abstract class SettingsInterface {

  Future<Either<GlobalSettingsResponse,dynamic>> getGlobalSettings();

  Future<Either<MobileTranslationsResponse,dynamic>> getMobileTranslations({String? lang});

  Future<Either<LanguagesResponse,dynamic>> getLanguages();

  Future<Either<CurrenciesResponse,dynamic>> getCurrencies();

  Future<Either<HelpResponseModel,dynamic>> getFaq();

  Future<Either<bool,dynamic>> getAdminInfo();

  Future<Either<Translation,dynamic>> getPolicy();

  Future<Either<Translation,dynamic>> getTerm();
}
