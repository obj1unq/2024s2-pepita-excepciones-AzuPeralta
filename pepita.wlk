object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		if (self.puedeVolar(distancia)) {
			energia -= self.gastoDeEnergiaPorVuelo(distancia)
		}else{
			self.error("Tengo "+ energia + " de energia, no me alcanza para volar!")
		}
	}
		
	method energia() {
		return energia
	}

	method puedeVolar(distancia) {
	  return energia >= self.gastoDeEnergiaPorVuelo(distancia)
	}

	method gastoDeEnergiaPorVuelo(distancia) {
	  return 10 + distancia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {

		if (self.puedeVolar(distancia)) {
			energia -= self.gastoDeEnergiaPorVuelo(distancia)
		}else{
			self.error("Tengo "+ energia + " de energia, no me alcanza para volar!")
		}
	}
	
	method puedeVolar(distancia) {
	  return energia >= self.gastoDeEnergiaPorVuelo(distancia)
	}

	method gastoDeEnergiaPorVuelo(distancia) {
	  return 20 + (2*distancia)
	}
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {

	const aves = #{pepita, pepon}

	method todasPuedenVolar(distancia) {
  		return aves.all({ave => ave.puedeVolar(distancia)})
	}

	method validarVuelos(distancia) {
  		if (not self.todasPuedenVolar(distancia)){
		self.error("No todas las aves pueden volar!")
  		}
	}
  
  	method movilizar(distancia) {
		self.validarVuelos(distancia) 	//Si TODAS pueden volar
		aves.forEach({ave => ave.volar(distancia)}) // vuelan
	
	
	//Alternativa sin if ni subtarea:
	//self.todasPuedenVolar(distancia).whenTrue({
    //aves.forEach({ ave => ave.volar(distancia) })
 	// })
  }
}