abstract class BaseViewModel extends BaseViewModelOutputs
    implements BaseViewModelInput {
  //shared variable and functions that will be used through any view model.
  //المتغير والوظائف المشتركة التي سيتم استخدامها من خلال أي viewModel.
}

abstract class BaseViewModelInput {
  void start(); //start vieModel jop

  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs {
  // will be implemented later
}
