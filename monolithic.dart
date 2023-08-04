
class Controller {
  // recibe por constructor la implementacion de la interface "UseCaseInputPort"
  UseCaseInputPort inputUseCase;
  Controller({required this.inputUseCase});

  void startFlow() {
    inputUseCase.getDataFromForms();
  }
}



abstract class UseCaseInputPort {
  void getDataFromForms();
}


class UseCaseInteractor extends UseCaseInputPort {
  /**
   * concreta los metodos de UseCaseInputPort y a su vez recibe
   * por su constructor la implementacion de la interface UseCaseOutputPort
   */
  /**
   * recibe por constructor la implementacion de la interface "UseCaseOutputPort"
   * y a su vez implementa (o concreta) la interface "UseCaseInputPort"
   */
   UseCaseOutputPort outputUseCase;
   UseCaseInteractor({required this.outputUseCase});
   
     @override
     void getDataFromForms() {
      // TODO: implement getDataFromForms
      // ...
      // usa los metodos de la clase concreta que se paso por parametro
      outputUseCase.showInScreen();
     }

}

abstract class UseCaseOutputPort {
  void showInScreen();
}



class Presenter extends UseCaseOutputPort {
  // concreta los metodos de UseCaseOutputPort
  @override
  void showInScreen(){
    // TODO: implement showInScreen
  }
}







void main() {
  Controller c = Controller(inputUseCase: UseCaseInteractor(outputUseCase: Presenter()));
  c.startFlow();
}