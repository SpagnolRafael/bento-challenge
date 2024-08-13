class ProductEvent {}

class GetProductEvent implements ProductEvent {
  final String id;
  GetProductEvent({required this.id});
}
