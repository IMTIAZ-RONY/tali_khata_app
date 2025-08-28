import 'package:tali_khata_app/exports.dart';
import '../models/user_model.dart';

class UserRepository extends GetxService {
  final RxList<UserModel> _users = <UserModel>[].obs;

  List<UserModel> get users => _users.toList();

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    _users.addAll([
      UserModel(
        id: '1',
        name: 'Md Shirajul',
        initials: 'MS',
        amount: 130.00,
        duration: '২৩ দিন',
        isReceivable: true,
      ),
      // Add more sample users if needed
    ]);
  }

  // Get all users
  List<UserModel> getAllUsers() {
    return _users.toList();
  }

  // Get users by type (receivable/payable)
  List<UserModel> getUsersByType(bool isReceivable) {
    return _users.where((user) => user.isReceivable == isReceivable).toList();
  }

  // Search users by name
  List<UserModel> searchUsers(String query) {
    if (query.isEmpty) return _users.toList();

    return _users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Add new user
  void addUser(UserModel user) {
    _users.add(user);
  }

  // Update user
  void updateUser(UserModel user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
    }
  }

  // Delete user
  void deleteUser(String id) {
    _users.removeWhere((user) => user.id == id);
  }

  // Get total receivable amount
  double getTotalReceivableAmount() {
    return _users
        .where((user) => user.isReceivable)
        .fold(0.0, (sum, user) => sum + user.amount);
  }

  // Get total payable amount
  double getTotalPayableAmount() {
    return _users
        .where((user) => !user.isReceivable)
        .fold(0.0, (sum, user) => sum + user.amount);
  }

  // Get customer count
  int getCustomerCount() {
    return _users.where((user) => user.isReceivable).length;
  }

  // Get supplier count
  int getSupplierCount() {
    return _users.where((user) => !user.isReceivable).length;
  }
}