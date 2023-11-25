part of 'invoices_cubit.dart';

sealed class InvoicesState extends Equatable {
  const InvoicesState();

  @override
  List<Object> get props => [];
}

final class InvoicesInitial extends InvoicesState {}
final class InvoiceRefresh extends InvoicesState {}