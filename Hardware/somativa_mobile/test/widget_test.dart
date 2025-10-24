import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('app loads', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('Login - Registro de Ponto'))));
    expect(find.text('Login - Registro de Ponto'), findsOneWidget);
  });
}
