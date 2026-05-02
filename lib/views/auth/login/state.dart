abstract class StateLogin {}
class StateLoginInitial extends StateLogin {}
class StateLoginLoading extends StateLogin {}
class StateLoginSuccess extends StateLogin {}
class StateLoginFailed extends StateLogin {
  final String error;
  StateLoginFailed(this.error);
}