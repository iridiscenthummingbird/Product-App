import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:product_app/widgets/dialog.dart';

class PopupHandle<T> {
  PopupHandle._(this.cancel, this.result);

  final void Function() cancel;
  final Future<T> result;
}

PopupHandle<void> showLoadingDialog({
  bool? tapDismiss,
}) {
  final cancel = BotToast.showCustomLoading(
    toastBuilder: (cancel) {
      return const Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 3,
          ),
        ),
      );
    },
  );
  return PopupHandle._(cancel, Future<bool>.value(false));
}

void hideLoadingDialog() {
  BotToast.closeAllLoading();
}

PopupHandle<bool>? _networkErrorPopupHandle;

/// Returns a [PopupHandle] with 'true' as a result if the
/// request has to be retried.
PopupHandle<bool>? showNetworkErrorPopup() {
  if (_networkErrorPopupHandle != null) {
    // Enforce only one dialog at a time
    return _networkErrorPopupHandle;
  }

  final completer = Completer<bool>();
  final cancel = BotToast.showEnhancedWidget(
    allowClick: false,
    closeFunc: () async {
      completer.complete(true);
      _networkErrorPopupHandle = null;
    },
    backgroundColor: Colors.black26,
    toastBuilder: (cancel) {
      return Builder(
        builder: (context) => MediaQuery.removeViewInsets(
          context: context,
          removeBottom: true,
          child: AppAlertDialog(
            text: const Text(
              'No internet connection.Try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              AppDialogAction.primary(
                onPressed: () => cancel(),
                text: const Text(
                  'Try Again',
                ),
              )
            ],
          ),
        ),
      );
    },
  );
  _networkErrorPopupHandle = PopupHandle._(cancel, completer.future);
  return _networkErrorPopupHandle;
}

void showErrorPopup(String error, {VoidCallback? onPress}) {
  final completer = Completer<bool>();
  BotToast.showEnhancedWidget(
    closeFunc: () async {
      completer.complete(true);
      _networkErrorPopupHandle = null;
    },
    backgroundColor: Colors.black26,
    toastBuilder: (cancel) {
      return Builder(
        builder: (context) => MediaQuery.removeViewInsets(
          context: context,
          removeBottom: true,
          child: AppAlertDialog(
            text: Text(
              error,
              style: const TextStyle(color: Colors.black),
            ),
            actions: [
              AppDialogAction.primary(
                onPressed: () {
                  cancel();
                  hideLoadingDialog();
                  onPress?.call();
                },
                text: const Text(
                  'ok',
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
