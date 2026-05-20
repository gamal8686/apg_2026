abstract class ItemsManagementState {}
class ItemsManagementInitialState extends ItemsManagementState {}
class ItemsManagementLoadingState extends ItemsManagementState {}
class ItemsManagementSuccessState extends ItemsManagementState {}
class ItemsManagementErrorState extends ItemsManagementState {
  final String error;

  ItemsManagementErrorState(this.error);
}