class Formacion {
	const formacion = []
	method esPopular(){
		return formacion.count({vagon => vagon.esPopular()})
	}
	method esCarguera(){
		formacion.all({vagon => vagon.cargaMaxima() > 1000})// delegar ponele
		}
	method dispercionDePesos(){
		return formacion.max({vagon => vagon.pesoMaximo()}).pesoMaximo() - formacion.min({vagon => vagon.pesoMaximo()}).pesoMaximo()
	}
	method retretesDeLaFormacion(){
		return formacion.filter({vagon => vagon.tieneRetrete()}).size() // count
	}
	method hacerMantenimiento(){
		formacion.forEach({vagon => vagon.hacerMantenimiento()})
	}
	
	method vagonConMenosPasajeros(){
		return formacion.filter({vagon => vagon.cantidadPasajeros()>0}).min()
	}
	
	method vagonConMasPasajeros(){
		return formacion.filter({vagon => vagon.cantidadPasajeros()>0}).max() //lo hace con const en el metodo
	}
	
	method esEquilibrada(){
		return self.vagonConMasPasajeros().cantidadPasajeros() - self.vagonConMenosPasajeros().cantidadPasajeros() < 20	}
	
	method estaOrganizada(){
		if (formacion.all({vagon => vagon.cantidadPasajeros() >0}) or (formacion.all({vagon => vagon.cantidadPasajeros() == 0})))
			return true
		else
			return (1..formacion.size()-1).all({indiceDeVagon => formacion.get(indiceDeVagon -1).cantidadPasajeros() <= formacion.get(indiceDeVagon).cantidadPasajeros()})		
		
	}
	
}
