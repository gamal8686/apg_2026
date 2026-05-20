abstract class AddProductsState {}
class AddProductsInitialState extends AddProductsState {}
class AddProductsLoadingState extends AddProductsState {}
class AddProductsSuccessState extends AddProductsState {}
class AddProductsErrorState extends AddProductsState {
  final String error;
  AddProductsErrorState(this.error);
}