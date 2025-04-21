class ApiConstants {
  static const String apiBaseUrl = "https://aymantaher.com/Furniture/apis/";

  //auth
  static const String login = "registers/login.php";
  static const String signupUser = "registers/register_user.php";
  static const String signupBusiness = "registers/register_business.php";
  static const String verifyUser = "verification/verify_account.php";
  static const String resendCode = "verification/resend_code.php";
  static const String deleteAccount = "delete_acc.php";
  static const String forgotPassword = "verification/forgot_password.php";
  static const String resetPassword = "verification/reset_password.php";

  //products
  static const String allProductsWithColorAndImage =
      "product/product_image.php";
  static const String categories = "product/category.php?id=";
  static const String recommendedForYou =
      "product/PRecommendation.php?action=recommended_for_you";
}
