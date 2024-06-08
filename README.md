# calculate_plugin

A Flutter plugin for financial calculations.

## Features

- Step-up SIP calculation
- SIP calculation
- Lumpsum calculation

## Usage

```dart
import 'package:calculate_plugin/calculate_plugin.dart';

void main() {
  double amount = 5000;
  double yearlyReturn = 25;
  int years = 20;
  double annualIncrement = 10; // 20% increment each year

  var step_returns = Calculate.step_up_sip(amount, years, yearlyReturn, annualIncrement);
  var returns_sip = Calculate.sip(amount, years, yearlyReturn);
  var lumpsum = Calculate.lumpsum(amount, years, yearlyReturn);

  print('step up: '+ step_returns.toString());
  print('returns_sip: '+ returns_sip.toString());
  print('Lumpsum: ' + lumpsum.toString());
}

