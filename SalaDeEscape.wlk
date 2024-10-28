class SalaDeEscape{
    const nombre
    const dificultad
    method precio(){
        return 10000 + self.adicional()
    }
    method adicional()
    method esDificil(){
        return dificultad>7
    }
}

class SalaHistoria inherits SalaDeEscape{
    const basadaEnHechosReales = false
    override method adicional(){
        return 0.341*dificultad
    }
    override method esDificil(){
        return super() && !basadaEnHechosReales
    }
}

class SalaTerror inherits SalaDeEscape{
    const cantidadSustos = 0
    method cantidadSustosMayorA5(){
        return cantidadSustos > 5
    }
    override method adicional(){
        if(self.cantidadSustosMayorA5()){
            return 0.2*cantidadSustos
        }
        else return 0
    }
    override method esDificil(){
        return super() || self.cantidadSustosMayorA5()
    }
}

class SalaAnime inherits SalaDeEscape{
    override method adicional(){
        return 7000
    }
}





