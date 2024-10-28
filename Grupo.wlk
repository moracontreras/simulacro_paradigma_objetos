import Escapista.*
import SalaDeEscape.*
import Maestria.*
import NoTieneSuficientesIntegrantesException.NoTieneSuficientesIntegrantesException
import NoPuedenPagarLaSalaException.NoPuedenPagarLaSalaException
class Grupo{
    const integrantes = #{}
    method initialize(){
        if(!self.tieneSuficientesIntegrantes()){
            throw new NoTieneSuficientesIntegrantesException()
        }
    }
    method tieneSuficientesIntegrantes(){
        return self.cantidadDeIntegrantes() >3
    }
    
    method cantidadDeIntegrantes(){
        return integrantes.size()
    }

    method puedeSalirDe(unaSala){
        return integrantes.any({unIntegrante => unIntegrante.puedeSalirDe(unaSala)})
    }
    method pagarSala(unaSala){
        if(self.puedePagarSala(unaSala)){
            integrantes.forEach({unIntegrante => unIntegrante.pagar(self.costoPorPersona(unaSala))})
        }else
            throw new NoPuedenPagarLaSalaException()
    }
    method escaparDeUnaSala(unaSala){
        if(self.puedePagarSala(unaSala)){
            integrantes.forEach({unIntegrante => unIntegrante.registrarSala(unaSala)})
        }
    }
    method costoPorPersona(unaSala){
        return unaSala.precio() / self.cantidadDeIntegrantes()
    }
    method puedePagarSala(unaSala){
        return self.entreTodosCubrenElMonto(unaSala.precio()) || self.todosPuedenPagar(self.costoPorPersona(unaSala))
    }
    method entreTodosCubrenElMonto(unMonto){
        return self.integrantesQuePuedenPagar(unMonto).sum({unIntegrante => unIntegrante.saldo()}) >= unMonto
    }
    method integrantesQuePuedenPagar(unMonto){
        return integrantes.filter({unIntegrante => unIntegrante.leAlcanzaPara(self.costoPorPersona(unMonto))})
    }
    method todosPuedenPagar(unMontoIndividual){
        return integrantes.all({unIntegrante => unIntegrante.leAlcanzaPara(unMontoIndividual)})
    }
}