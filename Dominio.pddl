(define (domain Combi-domain)
    (:requirements :fluents)
    
    (:functions
        (Cantidad-Gasolina ?combi)
        (Asientos-Ocupados ?combi)
        (Capacidad-Gasolina)
        (Capacidad-Asientos)
    )
    
    (:predicates
        (hay-camino ?from-lugar ?to-lugar)
        (is-in ?Pasajero ?lugar)
        (been-at ?combi ?lugar)
        (Abordo ?combi ?Pasajero)  
        (at ?combi ?lugar)
        (es-gasolinera ?lugar)
        (es-parada ?lugar)
        (Dejar ?Pasajero ?lugar)
        (lugar ?lugar)    
        (Pasajero ?Pasajero) 
        (combi ?combi)                             
    )
    
    (:action Manejar
        :parameters 
            (?combi
             ?from-lugar 
             ?to-lugar
            )

        :precondition 
            (and 
                (combi ?combi)
                (lugar ?from-lugar)
                (lugar ?to-lugar) 
                (at ?combi ?from-lugar)
                (hay-camino ?from-lugar ?to-lugar)
                (> (Cantidad-Gasolina ?combi) 10))

        :effect 
            (and 
                (at ?combi ?to-lugar)
                (been-at ?combi ?to-lugar)
                (not (at ?combi ?from-lugar))
                (decrease (Cantidad-Gasolina ?combi) 10))
    )

    (:action Abordo-Pasajero
        :parameters 
            (?combi 
             ?Pasajero 
             ?lugar)

        :precondition 
            (and 
                (combi ?combi)
                (Pasajero ?Pasajero)
                (lugar ?lugar) 
                (is-in ?Pasajero ?lugar)
                (at ?combi ?lugar)
                ;(> (Cantidad-Gasolina ?combi) 3)
                (< (Asientos-Ocupados ?combi) (Capacidad-Asientos)))

        :effect 
            (and 
                (not (is-in ?Pasajero ?lugar))
                (Abordo ?combi ?Pasajero)
                ;(decrease (Cantidad-Gasolina ?combi) 3)
                (increase (Asientos-Ocupados ?combi) 1))
    )
    
    (:action Dejar-Pasajero
        :parameters 
            (?combi
             ?Pasajero 
             ?lugar)

        :precondition 
            (and 
                (combi ?combi)
                (Pasajero ?Pasajero)
                (lugar ?lugar)
                (es-parada ?lugar)
                (at ?combi ?lugar)
                (Abordo ?combi ?Pasajero)
                ;(> (Cantidad-Gasolina ?combi) 2)
            )                     
                           
        :effect 
            (and 
                (is-in ?Pasajero ?lugar) 
                (not (Abordo ?combi ?Pasajero))
                (Dejar ?Pasajero ?lugar)
                ;(decrease (Cantidad-Gasolina ?combi) 2)
                (decrease (Asientos-Ocupados ?combi) 1))
    )
    
    (:action Recargar-Gasolina
        :parameters 
            (?combi
             ?lugar)
        
        :precondition
	        (and
	            (combi ?combi)
	            (lugar ?lugar)  
	            (at ?combi ?lugar)
	            (es-gasolinera ?lugar) 
	            (< (Cantidad-Gasolina ?combi) 10))
	            
        :effect (and (increase (Cantidad-Gasolina ?combi) 15))
    )
)