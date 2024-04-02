class URLConst {
  // method_type
  static const GET_METHOD = 'GET';
  static const DELETE_METHOD = 'DELETE';
  static const POST_METHOD = 'POST';
  static const PUT_METHOD = 'PUT';
  static const PATCH_METHOD = 'PATCH';

  static const LOGIN = "/api/v1/auth-endpoint/login/";
  static const REGISTER = "/register";
  static const CAFE_LIST = "/api/v1/customer-endpoint/cafe-list/";
  static const MENU_LIST = "/api/v1/customer-endpoint/menu-list/";

  static const REFRESH_TOKEN = "/api/v1/auth-endpoint/token/refresh/";
  static const VERIFY_TOKEN = "/api/v1/auth-endpoint/token/verify/";
}
