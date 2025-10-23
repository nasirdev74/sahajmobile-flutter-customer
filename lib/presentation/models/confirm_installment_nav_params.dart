class ConfirmInstallmentNavParams {
  final int paymentTerm;
  final String repaymentOptions;
  final int totalPrice;
  final int downPayment;
  final int totalOutstanding;
  final int monthlyPayment;

  const ConfirmInstallmentNavParams({
    required this.paymentTerm,
    required this.repaymentOptions,
    required this.totalPrice,
    required this.downPayment,
    required this.totalOutstanding,
    required this.monthlyPayment,
  });
}
