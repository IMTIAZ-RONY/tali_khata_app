import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentBottomNavIndex = 0.obs;
  final RxDouble totalAmount = 0.0.obs;
  final RxDouble receivableAmount = 130.0.obs;
  final RxString searchQuery = ''.obs;
  final TextEditingController searchController = TextEditingController();

  // User data
  final RxString userName = 'Md Shirajul'.obs;
  final RxString userInitials = 'MS'.obs;
  final RxDouble userAmount = 130.00.obs;
  final RxString userDuration = '২৩ দিন'.obs;

  // Menu items
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'মানি ব্যবস্থা',
      'icon': Icons.book,
      'color': Colors.green,
    },
    {
      'title': 'স্টক হিসাব',
      'icon': Icons.inventory,
      'color': Colors.red,
    },
    {
      'title': 'ব্যবসার নোট',
      'icon': Icons.list_alt,
      'color': Colors.orange,
    },
    {
      'title': 'ক্রুপ তাগাদা',
      'icon': Icons.notifications,
      'color': Colors.green,
    },
    {
      'title': 'সুপার QR',
      'icon': Icons.qr_code,
      'color': Colors.red,
    },
    {
      'title': 'ডাটা ব্যাকআপ',
      'icon': Icons.cloud_upload,
      'color': Colors.green,
    },
    {
      'title': 'চালি-মেজার',
      'icon': Icons.trending_up,
      'color': Colors.red,
    },
    {
      'title': 'ক্যাশবক্স',
      'icon': Icons.account_balance_wallet,
      'color': Colors.orange,
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void changeBottomNavIndex(int index) {
    currentBottomNavIndex.value = index;
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void onMenuItemTap(int index) {
    Get.snackbar(
      'মেনু',
      '${menuItems[index]['title']} এ ক্লিক করেছেন',
      backgroundColor: menuItems[index]['color'],
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void onUserProfileTap() {
    Get.snackbar(
      'ইউজার প্রোফাইল',
      'প্রোফাইল পেইজে যাচ্ছেন...',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void onNewCustomerTap() {
    Get.snackbar(
      'নতুন কাস্টমার',
      'নতুন কাস্টমার যোগ করুন',
      backgroundColor: const Color(0xFFE53935),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }
}