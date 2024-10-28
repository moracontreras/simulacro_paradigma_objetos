import SalaDeEscape.*
import Escapista.*

object amateur{
    method permiteSalirDeUnaSalaAUnEscapista(unaSala,unEscapista){
        return ! unaSala.esDificil() && unEscapista.tieneMuchasSalas()
    }
    method siguienteNivel(){
        return profesional
    }
}

object profesional{
    method permiteSalirDeUnaSalaAUnEscapista(unaSala,unEscapista) = true
    method siguientNivel() = self
}