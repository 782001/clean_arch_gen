abstract class {{Module}}State {}

class {{Feature}}InitialState extends {{Module}}State {}

class {{Feature}}LoadingState extends {{Module}}State {}

class {{Feature}}ErrorState extends {{Module}}State {
  final String messageApi;
  final String messageError;

  {{Feature}}ErrorState({
    required this.messageApi,
    required this.messageError,
  });
}

class {{Feature}}SucssesState extends {{Module}}State {
  final String message;

  {{Feature}}SucssesState({
    required this.message,
  });
}
