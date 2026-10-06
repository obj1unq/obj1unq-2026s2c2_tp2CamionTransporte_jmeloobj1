import camion.* //correcion (feedback)
object almacen{
    const almacenado = [] 

    method almacenarCargaDeCamion(camion) {
      almacenado.addAll(camion.cosas())
      camion.vaciarCamion()
    }
}