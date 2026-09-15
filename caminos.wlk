import almacen.*
import camion.*

object ruta9{

  method puedeTransportar_(camion) {
    return camion.puedeCircularEnRuta(20)
  }

}

object caminosVecinales {
   var pesoMaximoPermitido = 500

   method pesoMaximoPermitido(_pesoMaximoPermitido) {
     pesoMaximoPermitido = _pesoMaximoPermitido
   }

  method puedeTransportar_(camion) { 
    return camion.pesoTotal() < pesoMaximoPermitido
  }
}



