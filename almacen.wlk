import camion*
object almacen{
    const almacenado = [] 

    method almacenarDeCamion_(camion) {
      almacenado.addAll(camion.cosas())
      camion.vaciarCamion()
    }
}