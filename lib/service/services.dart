import 'package:bride_night/model/service.dart';
import 'package:bride_night/service/auth.dart';
import 'package:bride_night/shared/constants.dart';

Future<List<Service>> getAllServicesForProvider() async {
  List<Service> lst = [];
  var output = await servicesCollection.where("providerID", isEqualTo: currentUser!.id).get();
  for (var element in output.docs) {
    Service srv = Service.fromMap(element.data() as Map<String, dynamic>);
    srv.provider = await getUserById(srv.providerID);
    lst.add(srv);
  }
  return lst;
}

addService(Service service) async {
  await servicesCollection.add(service.toMap());
}
