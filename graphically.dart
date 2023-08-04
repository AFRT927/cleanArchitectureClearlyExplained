                                              //LIMITE#2                                                                                                           //LIMITE#1  
//======Capa Controllers+Presenters+Gateways======||======================================================Capa Use Cases===============================================||=================================Capa de Entities==================================
//----Clases de bajo nivel(cerca al detalle)-----/**/---------------------------Clases de alto nivel (mas cerca de las entidades)-------------------------------------/**/--------------------Clases de altisimo nivel escritas en Dart puro---------------- 
                                                 /**/                                                                                                                 /**/ 
                                                 /**/                                                                                                                 /**/ 
 //_____________<Clase Concreta>______________   /**/                                                                                                                 /**/
 // import 'UseCaseInputPort';                   /**/                                                                                                                 /**/
 class Controller {                              /**/                                                                                                                 /**/
  /**                                            /**/                                                                                                                 /**/
   * recibe por constructor la implementacion    /**/                                                                                                                 /**/ 
   * de la interface "UseCaseInputPort"          /**/                                                                                                                 /**/   
   */                                            /**/                                                                                                                 /**/
  UseCaseInputPort inputUseCase;                 /**/                                                                                                                 /**/
  Controller({required this.inputUseCase});      /**/                                                                                                                 /**/                                                                                                                             
                                                 /**/                                                                                                                 /**/
  void startFlow() {                             /**/                                                                                                                 /**/
    inputUseCase.getDataFromForms();             /**/                                                                                                                 /**/
  }                                              /**/                                                                                                                 /**/
}                                                /**/                                                                                                                 /**/
//___________________________________________    /**/                                                                                                                 /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/     //___________<Interface>___________                                                                         /**/
                                                 /**/     abstract class UseCaseInputPort {                                                                           /**/
                                                 /**/       void getDataFromForms();                                                                                  /**/
                                                 /**/     }                                                                                                           /**/
                                                 /**/     //_________________________________                                                                         /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/                                            //_____________<Use Case> ______________________________             /**/
                                                 /**/                                            // import 'UseCaseInputPort';                                        /**/
                                                 /**/                                            // import 'UseCaseOutputPort';                                       /**/
                                                 /**/                                            class UseCaseInteractor extends UseCaseInputPort {                   /**/
                                                 /**/                                              /**                                                                /**/
                                                 /**/                                               * recibe por constructor la implementacion de la                  /**/
                                                 /**/                                               * interface "UseCaseOutputPort" y a su vez implementa             /**/
                                                 /**/                                               * (o concreta) la interface "UseCaseInputPort"                    /**/
                                                 /**/                                               */                                                                /**/
                                                 /**/                                               UseCaseOutputPort outputUseCase;                                  /**/
                                                 /**/                                               UseCaseInteractor({required this.outputUseCase});                 /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/                                                 @override                                                       /**/
                                                 /**/                                                 void getDataFromForms() {                                       /**/
                                                 /**/                                                  // todo: implement getDataFromForms                            /**/
                                                 /**/                                                  // ...                                                         /**/
                                                 /**/                                                  /**                                                            /**/
                                                 /**/                                                   * usa los metodos de la clase concreta que se                 /**/
                                                 /**/                                                   * paso por parametro                                          /**/
                                                 /**/                                                   */                                                            /**/
                                                 /**/                                                  outputUseCase.showInScreen();                                  /**/
                                                 /**/                                                 }                                                               /**/                                                             
                                                 /**/                                            }                                                                    /**/
                                                 /**/                                           //_______________________________________________________             /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/     //___________<Interface>___________                                                                         /**/  
                                                 /**/     abstract class UseCaseOutputPort {                                                                          /**/
                                                 /**/       void showInScreen();                                                                                      /**/
                                                 /**/     }                                                                                                           /**/
                                                 /**/     //_________________________________                                                                         /**/
                                                 /**/                                                                                                                 /**/
                                                 /**/                                                                                                                 /**/ 
//________<Implementacion>_________________      /**/                                                                                                                 /**/
//import 'UseCaseOutputPort';                    /**/                                                                                                                 /**/
class Presenter extends UseCaseOutputPort {      /**/                                                                                                                 /**/ 
  // concreta los metodos de UseCaseOutputPort   /**/                                                                                                                 /**/
  @override                                      /**/                                                                                                                 /**/
  void showInScreen(){                           /**/                                                                                                                 /**/
    // todo: implement showInScreen              /**/                                                                                                                 /**/
  }                                              /**/                                                                                                                 /**/
}                                                /**/                                                                                                                 /**/
//________________________________________       /**/                                                                                                                 /**/


/**
 * 
 * Notese que:
 * 1) la capa de Controllers+Presenters+GateWays No sabe de la existencia de la clase UseCaseInteractor. Esta capa depende unicamente de las interfaces (los detalles deben depender de las interfaces)
 * 2) la capa de Uses Cases No sabe de la existencia de las clases concretas Controller y/o Presenter (por lo que es independiente de estas)
 * 3) una interface se implementa por fuera del LIMITE#1 (Presenter implementa a UseCaseOutputPort en la capa Controllers+Ṕresente+GateWays) 
 *    y la otra interface se implementa por dentro del LIMITE#1 (UseCaseInteractor implementa a UseCaseInputPort en la capa Use Cases), de esta manera
 *    la informacion, atraviesa el LIMITE#1, pero sin forzar a que las clases de alto nivel, dependan de las clases de bajo nivel
 * 4) el control de flujo es iniciado por la clase Controller.
 *
 *    De los 3 puntos anteriores, podemos concluir que se cumple el principio de inversion de dependencias:
 *    los modulos de alto nivel (UseCaseInteractor) no deben depender de los modulos de bajo nivel
 *    (Controller y Presenter), ambos deben depender de las abstracciones (UseCaseInportPort y UseCaseOutputPort)
 *    y las abstracciones no deben depender de los detalles (Controller y Presenter)
 * 
 */





//=====================(en el main es donde se hacen las inyecciones)=================================
void main() {

  UseCaseOutputPort output1 = Presenter();
  UseCaseInputPort  input1 =  UseCaseInteractor(outputUseCase: output1);
  Controller controller1 = Controller(inputUseCase: input1);
  controller1.startFlow();

}