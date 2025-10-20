import rodados.*
import wollok.game.*
class Pedidos {
  var distancia = 0
  var tiempoMaximo = 0
  var cantPasajeros = 0
  const coloresIncompatibles = #{}
  
  method cambiarDistancia(num) {
    distancia = num
  }
  
  method cambiarTiempoMaximo(num) {
    tiempoMaximo = num
  }
  
  method cambiarCantPasajeros(num) {
    cantPasajeros = num
  }
  
  method agregarColores(nuevo) {
    coloresIncompatibles.add(nuevo)
  }

  method distancia(){
    return distancia
  }
  method tiempoMaximo(){
    return tiempoMaximo
  }
  method cantPasajeros(){
    return cantPasajeros
  }
  method coloresIncompatibles(){
    return coloresIncompatibles
  }
  method velocidadRequerida() = tiempoMaximo / distancia
  
  method esMasRapidoDeLoPedido(
    auto
  ) = auto.velocidadMaxima() >= (self.velocidadRequerida() + 10)
  
  method puedeLLevarAtodos(auto) = auto.capacidad() >= cantPasajeros
  
  method noEsDeEseColor(auto) = !coloresIncompatibles.contains(auto.color())
  
  method puedeSantisfacerSuPedido(auto) = self.esMasRapidoDeLoPedido(auto) && self.puedeLLevarAtodos(auto) && self.noEsDeEseColor(auto)
  
  method acelerar() {
    tiempoMaximo -= 1
  }
  
  method relajar() {
    tiempoMaximo += 1
  }
}