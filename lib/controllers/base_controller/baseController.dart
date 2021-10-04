import 'package:daytte/services/base_service/app_exceptions.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: "Oops! It took longer to respond");
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message!);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
