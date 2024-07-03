import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/res/app_color.dart';

class Utils {
  bool validateEmail(String email) {
    return email.contains('@');
  }

  String extractFirebaseError(String error) {
    return error.substring(error.indexOf(']') + 1);
  }

  void showSnackBar(String title, String message, Widget icon) {
    if(Get.overlayContext == null) return;
    Get.showSnackbar(GetSnackBar(
      backgroundColor: primaryColor.withOpacity(.4),
      title: title,
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
      icon: icon,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      snackStyle: SnackStyle.GROUNDED,
      barBlur: 30,
    ));
  }

  String formateDate(DateTime date) {
    String formattedDate = DateFormat('d MMM y').format(date);
    return formattedDate;
  }

  String formatDate() {
    String formattedDate = DateFormat('EEEE, d').format(DateTime.now());
    return formattedDate;
  }

  Map<int, String> getImage() {
    return {
      1: 'assets/images/back2.jpg',
      2: 'assets/images/back3.jpg',
      3: 'assets/images/back1.jpg',
    };
  }

  String getDaysDiffirece(String dateString) {
    DateFormat dateFormat = DateFormat('dd MMM yyyy');
    DateTime date = dateFormat.parse(dateString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);
    return (-1 * difference.inDays).toString();
  }

  Future<void> showWarningDialog(
      BuildContext context, VoidCallback onConfirm) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Task'),
          content: const Text('Are you sure you want to delete this Task?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Remove'),
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
