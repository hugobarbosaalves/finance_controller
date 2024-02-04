import 'transaction.dart';

class CustomContainerData {
  final String title;
  final List<Transaction> transactions;
  final bool sumOperation;

  CustomContainerData({
    required this.title,
    required this.transactions,
    required this.sumOperation,
  });
}
