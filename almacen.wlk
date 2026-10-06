import camion.* //correcion (feedback)
object almacen{
    const almacenado = [] 

    method almacenarDeCargaDeCamion(camion) {
      almacenado.addAll(camion.cosas())
      camion.vaciarCamion()
    }
}