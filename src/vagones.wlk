class VagonDePasajeros {
 	const property largo
	const property ancho
	var cantidadPasajeros
	var property estaOrdenado
	const property tieneRetrete
	const property pesoMaximo
	
	method cantidadPasajeros(){
		if (self.ancho() >= 3){
			cantidadPasajeros = 8 * self.largo()
		}
		else {
			cantidadPasajeros = 10 * self.largo()
		}
		if (estaOrdenado){
			cantidadPasajeros = 0.max(cantidadPasajeros - 15)
		}
		return cantidadPasajeros
	}
	method cargaMaxima(){
		if (tieneRetrete){
			return 300
		}
		else{
			return 800
		}
	}	
	method pesoMaximo(){
		return self.cargaMaxima() + 2000 + 85 * cantidadPasajeros
	}
	method hacerMantenimiento(){
		estaOrdenado = true
	}
	method esPopular(){
		return cantidadPasajeros> 50
	}

}

class VagonDeCarga {
 	const property cargaMaximaIdeal
	var property maderasSueltas
	const property tieneRetrete = false
	const property cantidadPasajeros = 0
	
	method cargaMaxima(){
		return cargaMaximaIdeal - 400 * maderasSueltas
	}	
	
	method pesoMaximo(){
		return self.cargaMaxima() + 1500
	}
	method hacerMantenimiento(){
		maderasSueltas = 0.max(maderasSueltas - 2)
	}
	method esPopular(){
		return cantidadPasajeros> 50
	}
	
}

class VagonDormitorio {
 	const property compartimentos
	var property camasPorCompartimento
	var cantidadPasajeros
	const property tieneRetrete = true

	
	method cantidadPasajeros(){
		return compartimentos * camasPorCompartimento
	}
	method cargaMaxima(){
		return 1200
	}
	method pesoMaxima(){
		return self.cargaMaxima() + 4000 + 80* cantidadPasajeros
	}	
	method hacerMantenimiento(){
		
	}
		method esPopular(){
		return cantidadPasajeros> 50
	}
	
}
