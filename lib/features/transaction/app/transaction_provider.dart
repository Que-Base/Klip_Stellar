import 'package:klip/features/transaction/presentation/transaction_list_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_provider.g.dart';

// ~ Modify to handl the whole view
@riverpod
class Transaction extends _$Transaction {
  @override
  TransactionFilter build() => TransactionFilter.all;

  void updateState(TransactionFilter filter) {
    state = filter;
  }
}
