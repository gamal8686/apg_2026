abstract class StateCreateLogin {}

class StateCreateLoginInitial extends StateCreateLogin {}

class StateCreateLoginLoading extends StateCreateLogin {}

class StateCreateLoginSuccess extends StateCreateLogin {}

class StateCreateLoginError extends StateCreateLogin {

  final String error;

  StateCreateLoginError(this.error);
}