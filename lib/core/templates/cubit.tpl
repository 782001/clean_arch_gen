import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '{{feature}}_states.dart';

class {{Module}}Cubit extends Cubit<{{Module}}State> {
  final {{Feature}}UseCase k{{Feature}}UseCase;

  {{Module}}Cubit({
    required this.k{{Feature}}UseCase,
  }) : super({{Module}}InitialState());

  static {{Module}}Cubit get(context) =>
      BlocProvider.of<{{Module}}Cubit>(context);

  void {{Feature}}Mithode({
    {{cubitParameters}}
  }) async {
    emit({{Feature}}LoadingState());

    final response = await k{{Feature}}UseCase(
      {{Feature}}Parameters(
        {{usecaseParams}}
      ),
    );

    response.fold(
      (failure) {
        debugPrint('Failure: {{Feature}}ErrorState');
        emit(
          {{Feature}}ErrorState(
            messageApi: r.message??"failure",
            messageError: r.message??"Network Error",
          ),
        );
      },
      (r) {
        debugPrint('Success: ${r.message}');
        emit(
          {{Feature}}SucssesState(
            message: r.message,
          ),
        );
      },
    );
  }
}
