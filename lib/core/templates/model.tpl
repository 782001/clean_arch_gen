import '../../domain/entities/{{entity}}.dart';

class {{Feature}}Model extends {{entity}} {
  {{Feature}}Model({super.message});

  factory {{Feature}}Model.fromJson(Map<String, dynamic> json) {
    return {{Feature}}Model(
      message: json['message'],
    );
  }
}
