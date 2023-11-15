
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/repositories/volunteering_repository_impl.dart';
import '../mocks/mocked_lists.dart';




void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late VolunteeringRepositoryImpl volunteeringRepositoryImpl;

  setUpAll(() async {

    fakeFirestore = FakeFirebaseFirestore();
    volunteeringRepositoryImpl = VolunteeringRepositoryImpl(
      firestore: fakeFirestore
    );
    for (var volunteering in mocked_volunteering_list) {
      await fakeFirestore.collection('volunteering').doc(volunteering.id).set(volunteering.toJson());
    }
  }
  );

  test("get all volunteerings.", () async {
    final volunteerings = await volunteeringRepositoryImpl.getVolunteerings();
    expect(volunteerings, mocked_volunteering_list);
    }
  );
}
