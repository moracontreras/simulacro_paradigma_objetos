import SalaDeEscape.*

class Escapista{
    var maestria
    var salasDeLasQueSalio = []
    var saldo = 0
    method puedeSalirDe(unaSala){
        return maestria.permiteSalirDeUnaSalaAUnEscapista(unaSala,self)
    }
    method cantidadDeSalas(){
        return salasDeLasQueSalio.size()
    }
    method hizoMuchasSalas(){
        return self.cantidadDeSalas() >= 6
    }
    method subirDeMaestria(){
        if(self.hizoMuchasSalas()){
            self.cambiarMaestria(maestria.siguienteNivel())
        }
    }
    method cambiarMaestria(unaMaestria){
        maestria = unaMaestria
    }
    method nombresDeLasSalasDeLasQueSalio(){
        return salasDeLasQueSalio.asSet()
    }
    method registrarSala(unaSala){
        salasDeLasQueSalio.add(unaSala)
    }
    method leAlcanzaPara(unMonto){
        return self.saldo() >= unMonto
    }
    method saldo() = saldo
    method pagar(unMonto){
        saldo =- unMonto
    }
}