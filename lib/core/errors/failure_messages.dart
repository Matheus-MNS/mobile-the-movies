import 'failure.dart';

extension FailureMessage on Failure {
  String get userMessage => switch (this) {
    NoConnectionFailure() =>
      'Sem conexão com a internet. Verifique sua rede e tente novamente.',
    TimeoutFailure() =>
      'A conexão demorou demais para responder. Tente novamente.',
    NotFoundFailure() =>
      'Não encontramos o que você está procurando.',
    UnauthorizedFailure() =>
      'Não foi possível acessar o serviço. Tente novamente mais tarde.',
    ServerFailure() =>
      'Estamos com problemas no servidor. Tente novamente em instantes.',
    UnknownFailure() =>
      'Algo deu errado. Tente novamente.',
  };
}