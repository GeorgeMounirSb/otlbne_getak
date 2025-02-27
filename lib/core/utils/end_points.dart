class EndPoints {
  ///driver part
  static const String baseUrl = 'https://clinics.soulnbody.net/otlbne-jiatak/capt/app_api/';

  static const String capLogin = '${baseUrl}users/chk_login.php';
  static const String updateLocation = '${baseUrl}users/serv_update_location.php';
  static const String updateOnduty = '${baseUrl}users/update_profile.php';
  static const String captProfile = '${baseUrl}users/get_user_profile.php';
  static const String captOrders = '${baseUrl}order_all/get_orders.php';
}