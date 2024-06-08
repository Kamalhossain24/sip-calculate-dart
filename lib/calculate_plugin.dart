library calculate_plugin;
import 'dart:ffi';
import 'dart:math';

class SipCalculate {
  static step_up_sip(_amount, _years, _yearlyReturn, _annualIncrement) {
    double amount = _amount;
    double yearlyReturn = _yearlyReturn;
    int years = _years;
    double annualIncrement = _annualIncrement / 100;
    double monthlyReturn = yearlyReturn / 12 / 100;
    double totalValue = 0;
    double total_invested = 0;
    var return_list = {};

    for (int year = 1; year <= years; year++) {
      double annualPrincipal = amount * pow((1 + annualIncrement), (year - 1));
      for (int month = 0; month < 12; month++) {
        total_invested = (total_invested + annualPrincipal);
        totalValue = (totalValue + annualPrincipal) * (1 + monthlyReturn);
      }

      return_list['year$year'] = totalValue.round().toDouble();
    }

    totalValue = totalValue.round().toDouble();

    double returns = totalValue - total_invested;
    var context = {
      'return_list': return_list,
      'return': returns.round().toDouble(),
      'total_invested': total_invested.round().toDouble(),
      'future_value': totalValue,
    };

    return context;
  }

  static sip(_amount, _years, _yearlyReturn) {
    double amount = _amount;
    double yearlyReturn = _yearlyReturn;
    int years = _years;
    double monthlyReturn = yearlyReturn / 12 / 100;
    double totalValue = 0;
    double total_invested = 0;
    var return_list = {};

    for (int year = 1; year <= years; year++) {
      double annualPrincipal = amount * pow((1), (year - 1));
      for (int month = 0; month < 12; month++) {
        total_invested = (total_invested + annualPrincipal);
        totalValue = (totalValue + annualPrincipal) * (1 + monthlyReturn);
      }

      return_list['year$year'] = totalValue.round().toDouble();
    }

    totalValue = totalValue.round().toDouble();

    double returns = totalValue - total_invested;
    var context = {
      'return_list': return_list,
      'return': returns.round().toDouble(),
      'total_invested': total_invested.round().toDouble(),
      'future_value': totalValue,
    };

    return context;
  }

  static lumpsum(_amount, _years, _yearlyReturn) {
    double yearlyReturn = _yearlyReturn;
    int years = _years;
    int anual_componding = 1;
    double monthlyReturn = yearlyReturn / 100;
    double total_invested = _amount;
    double totalValue = _amount;
    var return_list = {};

    for (int year = 0; year < anual_componding * years; year++) {
      totalValue *= (1 + monthlyReturn / anual_componding);
      return_list['year$year'] = totalValue.round().toDouble();
    }

    totalValue = totalValue.round().toDouble();

    double returns = totalValue - total_invested;
    var context = {
      'return_list': return_list,
      'total_invested': total_invested.round().toDouble(),
      'return': returns.round().toDouble(),
      'future_value': totalValue,
    };

    return context;
  }
}
