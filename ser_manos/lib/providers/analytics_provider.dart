import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<FirebaseAnalytics?> getAnalytics() async {
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  print(status);
  if (status == TrackingStatus.authorized) {
    print('authorized');
    return FirebaseAnalytics.instance;
  }
  print("null");
  return null;
}