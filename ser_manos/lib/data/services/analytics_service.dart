import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<FirebaseAnalytics?> getAnalytics() async {
  TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    await setupAppTracking(status);
  }
  if (status == TrackingStatus.authorized ||
      status == TrackingStatus.notSupported) {
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(
        true); // Just in case the user changes outside the app
    return FirebaseAnalytics.instance;
  }
  return null;
}

Future<void> setupAppTracking(status) async {
  status = await AppTrackingTransparency.requestTrackingAuthorization();
  if (status == TrackingStatus.authorized ||
      status == TrackingStatus.notSupported) {
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }
}
