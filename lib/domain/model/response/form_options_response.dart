import '../model/translation_model.dart';

class FormOptionsResponse {
  List<FormOptionsData>? data;

  FormOptionsResponse({
    this.data,
  });

  FormOptionsResponse copyWith({
    List<FormOptionsData>? data,
  }) =>
      FormOptionsResponse(
        data: data ?? this.data,
      );

  factory FormOptionsResponse.fromJson(Map<String, dynamic> json) =>
      FormOptionsResponse(
        data: json["data"] == null
            ? []
            : List<FormOptionsData>.from(
                json["data"]!.map((x) => FormOptionsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FormOptionsData {
  int? id;
  int? shopId;
  int? serviceMasterId;
  int? required;
  bool? active;
  List<FormOption>? data;
  Translation? translation;

  FormOptionsData({
    this.id,
    this.shopId,
    this.serviceMasterId,
    this.required,
    this.active,
    this.data,
    this.translation,
  });

  FormOptionsData copyWith({
    int? id,
    int? shopId,
    int? serviceMasterId,
    int? required,
    bool? active,
    List<FormOption>? data,
    Translation? translation,
  }) =>
      FormOptionsData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        serviceMasterId: serviceMasterId ?? this.serviceMasterId,
        required: required ?? this.required,
        active: active ?? this.active,
        data: data ?? this.data,
        translation: translation ?? this.translation,
      );

  factory FormOptionsData.fromJson(Map<String, dynamic>? json) =>
      FormOptionsData(
        id: json?["id"],
        shopId: json?["shop_id"],
        serviceMasterId: json?["service_master_id"],
        required: json?["required"],
        active: json?["active"],
        data: json?["data"] == null
            ? []
            : List<FormOption>.from(
                json?["data"]!.map((x) => FormOption.fromJson(x))),
        translation: json?["translation"] == null
            ? null
            : Translation.fromJson(json?["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "service_master_id": serviceMasterId,
        "required": required,
        "active": active,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "translation": translation?.toJson(),
      };
}

class FormOption {
  List<String>? answer;
  List<String>? userAnswer;
  String? question;
  int? required;
  String? answerType;

  FormOption({
    this.answer,
    this.userAnswer,
    this.question,
    this.required,
    this.answerType,
  });

  FormOption copyWith({
    List<String>? answer,
    List<String>? userAnswer,
    String? question,
    int? required,
    String? answerType,
  }) =>
      FormOption(
        answer: answer ?? this.answer,
        userAnswer: userAnswer ?? this.userAnswer,
        question: question ?? this.question,
        required: required ?? this.required,
        answerType: answerType ?? this.answerType,
      );

  factory FormOption.fromJson(Map<String, dynamic> json) => FormOption(
        answer: json["answer"] == null
            ? []
            : List<String>.from(json["answer"]!.map((x) => x)),
        userAnswer: json["user_answer"] == null
            ? []
            : List<String>.from(json["user_answer"]!.map((x) => x)),
        question: json["question"],
        required: json["required"],
        answerType: json["answer_type"],
      );

  Map<String, dynamic> toJson() => {
        "answer":
            answer == null ? [] : List<dynamic>.from(answer!.map((x) => x)),
        "user_answer": userAnswer == null
            ? []
            : List<dynamic>.from(userAnswer!.map((x) => x)),
        "question": question,
        "required": required,
        "answer_type": answerType,
      };
}
