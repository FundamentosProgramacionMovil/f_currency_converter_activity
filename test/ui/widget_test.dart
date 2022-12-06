import 'package:direct_select/direct_select.dart';
import 'package:f_currency_converter_activity/ui/pages/converter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ui', () {
    group('display', () {
      testWidgets('currency', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: ConverterPage()));
        expect(find.text('USD'), findsNWidgets(2));
        expect(find.text('COP'), findsNWidgets(2));
        expect(find.byType(DirectSelect), findsNWidgets(2));
      });
      testWidgets('values', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: ConverterPage()));
        expect(find.text('0'), findsWidgets);
        expect(find.text('0.0'), findsOneWidget);
      });
    });
    group('keypad', () {
      testWidgets('keys', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: ConverterPage()));
        expect(find.text('0'), findsWidgets);
        expect(find.text('1'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
        expect(find.text('4'), findsOneWidget);
        expect(find.text('5'), findsOneWidget);
        expect(find.text('6'), findsOneWidget);
        expect(find.text('7'), findsOneWidget);
        expect(find.text('8'), findsOneWidget);
        expect(find.text('9'), findsOneWidget);
        expect(find.text('Reset'), findsOneWidget);
      });
    });
  });
}
