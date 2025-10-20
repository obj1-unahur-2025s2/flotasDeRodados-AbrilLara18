import wollok.game.*
class Corsa {
  var posicionAnterior=position
  var image =  rojo.image()
  var position=new Position(x=4,y=7)
  const posicionesAnteriores= #{position}
  var color= rojo
  method posicionesAnteriores(){
    return posicionesAnteriores
  }
  method image(){
    return image
  }
  method color(){
  return color}
  method posicionAnterior(){
    return posicionAnterior
  }

  method colocarColor(nuevo) {
    image = nuevo.image()
    color=nuevo
  }
  
  method capacidad() = 4
  
  method velocidadMaxima() = 150
  
  method peso() = 1300

  method position() {
    return position
  }

  method nuevaPosicion(nueva){
    position=nueva
  }

  method moverseHacia(direccion) {
    posicionAnterior=self.position()
    self.nuevaPosicion(direccion.mover(self.position()))
    posicionesAnteriores.add(self.position())
  }

  method pasoPor(posicion){
    return posicionesAnteriores.contains(posicion)
  }
  method pasoPorFila(numero){
    return posicionesAnteriores.any({p=> p.x() == numero})
  }
  method recorrioFilas(listaNumeros){
    return listaNumeros.all({n=> self.pasoPorFila(n)})
  }
}

class Kwid {
  var tieneTanque = false
  var capacidad = 4
  var velocidadMaxima = 110
  var peso = 1200
  var position=game.at(0,0)

  method colocarTanque() {
    tieneTanque = true
    capacidad = 3
    velocidadMaxima = 120
    peso = 1200 + 150
  }
  
  method sacarTanque() {
    tieneTanque = false
    capacidad = 4
    velocidadMaxima = 110
    peso = 1200
  }
  
  method color() = azul
  
  method capacidad() = capacidad
  
  method velocidadMaxima() = velocidadMaxima
  
  method peso() = peso

    method position() {
    return position
  }
  method Nuevaposition(nume,num) {
    position= game.at(nume,num) 
  }
}

object trafic {
  var interior = comodo
  var motor = pulenta
  var position=game.at(0,0)

  method cambiarMotor(nuevo) {
    motor = nuevo
  }
  
  method cambiarInterior(nuevo) {
    interior = nuevo
  }
  
  method color() = blanco
  
  method capacidad() = interior.capacidad()
  
  method velocidadMaxima() = motor.velocidadMaxima()
  
  method peso() = (4000 + interior.peso()) + motor.peso()

    method position() {
    return position
  }
  method Nuevaposition(nume,num) {
    position= game.at(nume,num) 
  }
}

class Especial {
  var capacidad = 0
  var velocidadMaxima = 0
  var peso = 0
  var color = ""
  var position=game.at(0,0)

  method cambiarCapacidad(num) {
    capacidad = num
  }
  
  method cambiarVelocidad(num) {
    velocidadMaxima = num
  }
  
  method cambiarPeso(num) {
    peso = num
  }
  
  method cambiarColor(nuevo) {
    color = nuevo
  }
  
  method color() = color
  
  method capacidad() = capacidad
  
  method velocidadMaxima() = velocidadMaxima
  
  method peso() = peso

    method position() {
    return position
  }
  method Nuevaposition(nume,num) {
    position= game.at(nume,num) 
  }
}

object comodo {
  method capacidad() = 5
  
  method peso() = 700
}

object popular {
  method capacidad() = 12
  
  method peso() = 1000
}

object pulenta {
  method velocidadMaxima() = 130
  
  method peso() = 800
}

object bataton {
  method velocidadMaxima() = 80
  
  method peso() = 500
}

object norte {
    method direccion() {
    return self
  }
  method mover(posicion){
    return posicion.up(1)
  }
}
object sur {
  method direccion() {
    return self
  }
method mover(posicion){
    return posicion.down(1)
  }
}
object este {
    method direccion() {
    return self
  }
method mover(posicion){
    return posicion.right(1)
  }
}
object oeste {
    method direccion() {
    return self
  }
method mover(posicion){
    return posicion.left(1)
  }
}

object rojo {
  method image() { return "autitoRojo2.png" } 
}
object azul {
  method image() { return "autitoAzul.png" } 
}
object verde {
  method image() { return "autitoVerde.png" } 
}
object negro {
  
}
object beige {
  
}
object blanco {
  
}


object pared {
  var property image = "paredLadrillos3.jpg"
  var property position = game.at(7,9)  
  var resistencia=3


  method resistencia(){
    return resistencia
  }
  method choque(){
    resistencia= (resistencia-1).max(0)
    if(resistencia==2){
      image ="paredLadrillos2.jpg"
    }
    if(resistencia==1){
      image="paredLadrillos1.jpg"
    }
  }
}