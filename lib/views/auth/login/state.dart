abstract class StateLogin {}
class StateLoginInitial extends StateLogin {}
class StateLoginLoading extends StateLogin {}
class StateLoginSuccess extends StateLogin {}
class StateLoginError extends StateLogin {
  final String error;
  StateLoginError(this.error);
}