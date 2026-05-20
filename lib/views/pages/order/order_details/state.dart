abstract class OrderDetailsState {}
class OrderDetailsInitialState extends OrderDetailsState {}
class OrderDetailsLoadingState extends OrderDetailsState {}
class OrderDetailsSuccessState extends OrderDetailsState {}
class OrderDetailsErrorState extends OrderDetailsState {
  final String error;
  OrderDetailsErrorState(this.error);
}