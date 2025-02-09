import '../models/organization.dart';
import '../services/api_service.dart';

class OrganizationController {
  final ApiService apiService = ApiService();

  Future<Organization> fetchOrganizationDetails(String orgId) async {
    final data = await apiService.get('/organization/$orgId');
    return Organization.fromJson(data);
  }

  Future<void> updateOrganization(Organization org) async {
    await apiService.post('/organization/update', {
      'uuid': org.uuid,
      'orgname': org.orgname,
      'tel': org.tel,
      'ext': org.ext,
      'guinumber': org.guinumber,
      'admin_uuid': org.adminUuid,
      'tech_uuid': org.techUuid,
      'acc_uuid': org.accUuid,
    });
  }
}