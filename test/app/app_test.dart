import 'package:flutter_test/flutter_test.dart';
import 'package:superapp/app/app.dart';
import 'package:superapp/features/splash/splash_page.dart';

void main() {
  group('App', () {
    testWidgets('renders App', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });
}
