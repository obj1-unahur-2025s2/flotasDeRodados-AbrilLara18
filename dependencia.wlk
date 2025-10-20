import rodados.*
import pedidos.*
import wollok.game.*
class Dependencia {
  const flota = []
  var cantEmpleados = 0
  const pedidos = []
  
  method cambiarCantidadEmpleados(num) {
    cantEmpleados = num
  }
  
  method agregarAFlota(rodado) {
    flota.add(rodado)
  }
  
  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }
  method flota(){
    return flota
  }
  method pesoTotalFlota() = flota.sum({ r => r.peso() })
  
  method estaBienEquipada() = (flota.size() >= 3) && flota.all(
    { r => r.velocidadMaxima() >= 100 }
  )
  
  method losDeColor(color) = flota.filter({ r => r.color() == color })
  
  method capacidadTotalEnColor(color) = self.losDeColor(color).sum(
    { r => r.capacidad() }
  )
  
  method colorDelRodadoMasRapido() = flota.max(
    { r => r.velocidadMaxima() }
  ).color()
  
  method capacidadFaltante() = cantEmpleados - flota.sum({ r => r.capacidad() })
  
  method esGrande() = (cantEmpleados >= 40) && (flota.size() == 5)
  
  method agregarPedidos(pedido) {
    pedidos.add(pedido)
  }
  
  method quitarPedidos(pedido) {
    pedidos.remove(pedido)
  }

  method totalPasajeros(){
    return pedidos.sum({p=>p.cantPasajeros()})
  }

  method algunoPuedeSatisfacerlo(pedido){
    return flota.any({f=> pedido.puedeSantisfacerSuPedido(f)})
  }
  method losQueNoPuedenSerSatisfechos(){
    return pedidos.filter({p=> ! self.algunoPuedeSatisfacerlo(p)})
  }
  method todosLoOdian(color){
    return pedidos.all({p=> p.coloresIncompatibles().contains(color)})
  }
  method relajarATodos(){
    pedidos.forEach({p=>p.relajar()})
  }

  method coloresEnAgencia(){
    return flota.map({f => f.color()})
  }
  method coloresIncompatiblesPedidos(){
    return pedidos.map({p=> p.coloresIncompatibles()})
  }
  method coloresIncompantibleParaAlguno(){
    return [self.coloresEnAgencia(),self.coloresIncompatiblesPedidos()].flatten()
  }
  method colorMasPopular(){

  }

  method haycolorRepetidos(){
    const colores=#{}
    colores.addAll(self.coloresEnAgencia().asSet())
    return colores.any({c=> self.coloresEnAgencia().occurrencesOf(c) >1})
  }
  method ordenDeLlegada(vehiculo){
    var orden=0
    (0..self.flota().size()-1).forEach({n=> if(flota.get(n)==vehiculo){
      orden=n
    }})
    return orden
  }
  method vehiculosQueLlegaronAntesQue(veh){
    return flota.take(self.ordenDeLlegada(veh))
  }
}