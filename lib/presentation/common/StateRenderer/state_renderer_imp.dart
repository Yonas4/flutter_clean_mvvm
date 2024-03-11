import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/App/constants.dart';
import 'package:flutter_clean_mvvm/presentation/common/StateRenderer/state_rendrer.dart';
import 'package:flutter_clean_mvvm/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

///loading state (popUp,fullScreen)
class LoadingState extends FlowState {
  LoadingState({
    required this.stateRendererType,
    /*todo he do as  String message=AppStrings.loading*/ this.message =
        AppStrings.loading,
  });

  StateRendererType stateRendererType;
  String message;

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

///error state (popUp,fullScreen)

class ErrorState extends FlowState {
  ErrorState(this.stateRendererType, this.message);

  StateRendererType stateRendererType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

///content state (popUp,fullScreen)
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

///Empty state (popUp,fullScreen)
class EmptyState extends FlowState {
  EmptyState(this.message);

  String message;

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExt on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunc) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // show popup loading
            showPopup(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunc: retryActionFunc,
            );
          }
        }

      case ErrorState:
        {
          break;
        }
      case ContentState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            retryActionFunc: retryActionFunc, /// if set retry btn in home set
            message: getMessage(),
          );
        }
      case EmptyState:
        {
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) => showDialog(
          context: context,
          builder: (context) {
            return StateRenderer(
              stateRendererType: stateRendererType,
              retryActionFunc: () {},
              message: '',
            );
          },
        ));
  }
}
