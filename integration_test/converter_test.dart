import 'package:direct_select/direct_select.dart';
import 'package:f_currency_converter_activity/main.dart' as app;
import 'package:f_currency_converter_activity/ui/widgets/one_key.dart';
import 'package:f_currency_converter_activity/ui/widgets/selection_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ui', () {
    group('display', () {
      testWidgets('currency', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        expect(find.text('USD'), findsNWidgets(2));
        expect(find.text('COP'), findsNWidgets(2));
        expect(find.byType(DirectSelect), findsNWidgets(2));
      });
      testWidgets('values', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        expect(find.text('0'), findsWidgets);
        expect(find.text('0.0'), findsOneWidget);
      });
    });
    group('keypad', () {
      testWidgets('keys', (tester) async {
        app.main();
        await tester.pumpAndSettle();
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

  group('convertion', () {
    group('USD -> USD', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('10.0'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('75.0'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('135.0'), findsOneWidget);
      });
    });

    group('USD -> COP', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('38290.0'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('287175.0'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('516915.0'), findsOneWidget);
      });
    });

    group('USD -> EUR', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -72), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('9.4'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -72), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('70.5'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');
        expect(target, findsOneWidget);
        await tester.timedDrag(
            target, const Offset(0, -72), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('126.9'), findsOneWidget);
      });
    });

    group('COP -> COP', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        expect(source, findsOneWidget);
        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('10.0'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        expect(source, findsOneWidget);
        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('75.0'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        expect(source, findsOneWidget);
        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('135.0'), findsOneWidget);
      });
    });

    group('COP -> USD', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('0.0026'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('0.0195'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('0.0351'), findsOneWidget);
      });
    });

    group('COP -> EUR', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('0.0025'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('0.0187'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, 36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('0.0338'), findsOneWidget);
      });
    });

    group('EUR -> EUR', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('10.0'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('75.0'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -72),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('135.0'), findsOneWidget);
      });
    });

    group('EUR -> COP', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');

        expect(source, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('40800.0'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');

        expect(source, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('306000.0'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');

        expect(source, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('550800.0'), findsOneWidget);
      });
    });

    group('EUR -> USD', () {
      testWidgets('10', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 0));
        await tester.pumpAndSettle();
        expect(find.text('10'), findsOneWidget);
        expect(find.text('10.7'), findsOneWidget);
      });

      testWidgets('75', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 7));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('75'), findsOneWidget);
        expect(find.text('80.25'), findsOneWidget);
      });

      testWidgets('135', (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final source = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'USD');
        final target = find.byWidgetPredicate(
            (widget) => widget is SelectionItem && widget.title == 'COP');

        expect(source, findsOneWidget);
        expect(target, findsOneWidget);

        await tester.timedDrag(
            source, const Offset(0, -36), const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.timedDrag(target.last, const Offset(0, -36),
            const Duration(milliseconds: 300));
        await tester.pumpAndSettle();
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 1));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 3));
        await tester.tap(find.byWidgetPredicate(
            (widget) => widget is OneKey && widget.number == 5));
        await tester.pumpAndSettle();
        expect(find.text('135'), findsOneWidget);
        expect(find.text('144.45'), findsOneWidget);
      });
    });
  });
}
