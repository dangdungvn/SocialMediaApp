import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';

/// Lớp hỗ trợ các chức năng chung trong ứng dụng
class AppHelper {
  /// Hiển thị thông báo snackbar
  static void showSnackBar(
    BuildContext context,
    String message, {
    bool isSuccess = true,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTheme.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
          ),
        ),
        backgroundColor: isSuccess ? AppColors.greenColor : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Hiển thị dialog thông báo
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: AppTheme.bold,
            ),
          ),
          content: Text(
            content,
            style: AppTheme.greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.regular,
            ),
          ),
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onCancel != null) onCancel();
                },
                child: Text(
                  cancelText,
                  style: AppTheme.blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.medium,
                  ),
                ),
              ),
            if (confirmText != null)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onConfirm != null) onConfirm();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purpleColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    confirmText,
                    style: AppTheme.whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: AppTheme.semiBold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Hiển thị dialog xác nhận
  static void showConfirmDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
  }) {
    showAlertDialog(
      context: context,
      title: title,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
    );
  }

  /// Hiển thị dialog thành công
  static void showSuccessDialog({
    required BuildContext context,
    required String title,
    required String content,
    String buttonText = 'Đóng',
    VoidCallback? onClose,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: AppTheme.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.greenColor,
                size: 70,
              ),
              const SizedBox(height: 16),
              Text(
                content,
                style: AppTheme.greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: AppTheme.regular,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onClose != null) onClose();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.purpleColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  buttonText,
                  style: AppTheme.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.semiBold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Định dạng số lượt thích, chia sẻ
  static String formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 1000000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    } else {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
  }
}
