/// Lớp chứa các hằng số được sử dụng trong ứng dụng
class AppConstants {
  /// Tên ứng dụng
  static const String appName = 'Social Media App';

  /// Key của hộp SharedPreferences để lưu trữ thông tin đăng nhập
  static const String authBoxKey = 'auth_box';

  /// Key để lưu trữ token xác thực
  static const String authTokenKey = 'auth_token';

  /// Key để lưu trữ thông tin người dùng
  static const String userInfoKey = 'user_info';

  /// Key để lưu trữ trạng thái đã đăng nhập
  static const String isLoggedInKey = 'is_logged_in';

  /// Key để lưu trữ trạng thái đã xem hướng dẫn
  static const String hasSeenOnboardingKey = 'has_seen_onboarding';

  /// Thời gian hết hạn phiên làm việc (7 ngày)
  static const Duration sessionExpiration = Duration(days: 7);

  /// Thời gian hiển thị splash screen
  static const Duration splashDuration = Duration(milliseconds: 2500);

  /// Độ dài tối thiểu của mật khẩu
  static const int minPasswordLength = 6;

  /// Độ dài mã OTP
  static const int otpLength = 4;

  /// Thời gian đếm ngược để gửi lại OTP (giây)
  static const int otpResendCountdown = 60;

  /// Số lượt cuộn vô hạn trong PageView
  static const int infinitePageCount = 1000;

  /// Số lượng bài viết tải mỗi lần
  static const int postsPerPage = 10;

  /// Kích thước cache hình ảnh (20MB)
  static const int imageCacheSizeBytes = 20 * 1024 * 1024;

  /// Thời gian chờ kết nối API
  static const Duration apiTimeout = Duration(seconds: 30);

  /// Đường dẫn API cơ sở
  static const String baseApiUrl = 'https://api.socialmedia.com/v1';

  /// Đường dẫn cho các bài viết
  static const String postsEndpoint = '$baseApiUrl/posts';

  /// Đường dẫn cho thông tin người dùng
  static const String usersEndpoint = '$baseApiUrl/users';

  /// Đường dẫn cho xác thực
  static const String authEndpoint = '$baseApiUrl/auth';
}
