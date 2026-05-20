abstract class ProductLocationState {}
class ProductLocationInitialState extends ProductLocationState {}
class ProductLocationLoadingState extends ProductLocationState {}
class ProductLocationSuccessState extends ProductLocationState {

}
class ProductLocationErrorState extends ProductLocationState {
  final String error;
  ProductLocationErrorState(this.error);
}