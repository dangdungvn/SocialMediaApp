/// Lớp hỗ trợ kiểm tra tính hợp lệ của dữ liệu nhập vào
class Validators {
  /// Kiểm tra email có hợp lệ hay không
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }

    // Kiểm tra định dạng email
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Email không hợp lệ';
    }

    return null;
  }

  /// Kiểm tra mật khẩu có hợp lệ hay không
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }

    if (value.length < minLength) {
      return 'Mật khẩu phải có ít nhất $minLength ký tự';
    }

    return null;
  }

  /// Kiểm tra xác nhận mật khẩu có khớp với mật khẩu hay không
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }

    if (value != password) {
      return 'Mật khẩu không khớp';
    }

    return null;
  }

  /// Kiểm tra tên người dùng có hợp lệ hay không
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tên';
    }

    if (value.length < 2) {
      return 'Tên phải có ít nhất 2 ký tự';
    }

    return null;
  }

  /// Kiểm tra số điện thoại có hợp lệ hay không
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }

    // Mẫu chuỗi kiểm tra số điện thoại Việt Nam (10 hoặc 11 chữ số, bắt đầu bằng 0)
    final phoneRegExp = RegExp(r'^0[0-9]{9,10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }

    return null;
  }

  /// Kiểm tra mã OTP có hợp lệ hay không
  static String? validateOtp(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mã OTP';
    }

    if (value.length != length) {
      return 'Mã OTP phải có $length chữ số';
    }

    // Kiểm tra xem OTP có phải chỉ chứa các chữ số hay không
    final otpRegExp = RegExp(r'^[0-9]+$');
    if (!otpRegExp.hasMatch(value)) {
      return 'Mã OTP chỉ được chứa các chữ số';
    }

    return null;
  }

  /// Kiểm tra trường bắt buộc không được để trống
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập $fieldName';
    }
    return null;
  }
}
