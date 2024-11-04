class Pelicula{
    const nombre
    const elenco = #{}
    method elenco() = elenco
    method presupuesto(){
        const sueldos = elenco.sum({unActor=> unActor.sueldo()})
        return  sueldos + self.costoRodaje(sueldos)
    }
    method costoRodaje(unValor){
        return unValor*0.7
    }
    method ganancias(){
        return self.recaudo() - self.presupuesto()
    }
    method recaudo(){
        return 100000000 + self.extraDelRecaudo()
    }
    method extraDelRecaudo()
    method rodar(){
        elenco.forEach({unActor => unActor.actuar()})
    }
    method esEconomica(){
        return self.presupuesto() < 500000
    }
}
class PeliculaDrama inherits Pelicula{
    method letrasDeSuNombre(){
        return nombre.size()
    }
    override method extraDelRecaudo(){
        return 100000 * self.letrasDeSuNombre()
    }
}
class PeliculaAccion inherits Pelicula{
    const vidriosRotos
    override method presupuesto(){
        return super() + 1000*vidriosRotos
    }
    override method extraDelRecaudo(){
        return 50000* elenco.size()
    }
}
class PeliculaTerror inherits Pelicula{
    const cantidadCuchos
    override method extraDelRecaudo(){
        return 20000*cantidadCuchos
    }
}
class PeliculaComedia inherits Pelicula{
    override method extraDelRecaudo() = 0
}

class Actor{
    var ahorros
    var experiencia
    var cantidadDePeliculasEnLasQueActuo
    method actuar(){
        self.aumentarPeliculasEnLasQueActuo()
        self.cobrarSueldo()
    }
    method aumentarPeliculasEnLasQueActuo(){
        cantidadDePeliculasEnLasQueActuo +=1;
    }
    method cobrarSueldo(){
        ahorros += self.sueldo()
    }
    method sueldo(){
        return experiencia.sueldo(self.nivelDeFama(), cantidadDePeliculasEnLasQueActuo)
    }
    method nivelDeFama(){
        return cantidadDePeliculasEnLasQueActuo/2
    }
    method recategorizar(){
        experiencia = experiencia.categoriaALaQueDebeRecategorizar()
    }
}

object amateur{
    method sueldo(unNivelDeFama,cantidadDePeliculas) = 10000
    method categoriaALaQueDebeRecategorizar(unNivelDeFama,cantidadDePeliculas){
        if(cantidadDePeliculas >10){
            return establecido
        }
        else return self
    }
}
object establecido{
    method sueldo(unNivelDeFama,cantidadDePeliculas){
        if(unNivelDeFama <15)
            return 15000
        else{
            return 5000*unNivelDeFama
        }     
    }
    method categoriaALaQueDebeRecategorizar(unNivelDeFama,cantidadDePeliculas){
        if(unNivelDeFama >10){
            return estrella
        }
        else return self
    }
}
object estrella{
    method sueldo(unNivelDeFama,cantidadDePeliculas){
        return 30000*cantidadDePeliculas
    }
    method categoriaALaQueDebeRecategorizar(unNivelDeFama,cantidadDePeliculas){
        throw new NoSePuedeRecategorizarAUnaEstrellaException()
    }
}

class NoSePuedeRecategorizarAUnaEstrellaException inherits Exception(message = "Una estrella no puede ser recategorizada"){}

object impdep{
    peliculas
    method artistaConMejorPaga(){
        return peliculas.map({unaPelicula=> unaPelicula.elenco()}).max({unActor => unActor.sueldo()})
    }
    method nombresDePeliculasEconomicas(){
        return peliculas.filter({unaPelicula => unaPelicula.esEconomica()})
    }
    method gananciasPeliuclasEconomicas(){
        return self.nombresDePeliculasEconomicas().sum({unaPelicula=> unaPelicula.ganancias()})
    }
    method recategorizarArtistas(){
        peliculas.map({unaPelicula=> unaPelicula.elenco()}).forEach({unActor => unActor.recategorizar()})
    }
}
