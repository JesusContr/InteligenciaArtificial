(define (problem CombiProblem)

    (:domain 
        Combi-domain   
    )
    
    (:objects
        lugar1 lugar2 lugar3 lugar4 lugar5 lugar6 
        lugar7 lugar8 lugar9 
        
        Pasajero1 Pasajero2 Pasajero3 Pasajero4 Pasajero5 Pasajero6 Pasajero7 Pasajero8
        
        combi1 combi2
    )
    
    (:init
        (= (Capacidad-Gasolina) 100)
        (= (Capacidad-Asientos) 10)
        
        (lugar lugar1) (lugar lugar2) (lugar lugar3) 
        (lugar lugar4) (lugar lugar5) (lugar lugar6) 
        (lugar lugar7) (lugar lugar8) (lugar lugar9)
        
        (Pasajero Pasajero1) (Pasajero Pasajero2) (Pasajero Pasajero3) (Pasajero Pasajero4)
        (Pasajero Pasajero5) (Pasajero Pasajero6) (Pasajero Pasajero7) (Pasajero Pasajero8)
        
        
        (hay-camino lugar1 lugar5) (hay-camino lugar1 lugar9)
        (hay-camino lugar2 lugar5) (hay-camino lugar3 lugar4) 
        (hay-camino lugar3 lugar6) (hay-camino lugar4 lugar3)
        
        (hay-camino lugar4 lugar8) (hay-camino lugar4 lugar9)
        (hay-camino lugar5 lugar1) (hay-camino lugar5 lugar2)
        (hay-camino lugar6 lugar3) (hay-camino lugar6 lugar7)
        
        (hay-camino lugar6 lugar8) (hay-camino lugar7 lugar6)
        (hay-camino lugar8 lugar4) (hay-camino lugar8 lugar6)
        (hay-camino lugar9 lugar1) (hay-camino lugar9 lugar4)
        
        (hay-camino lugar1 lugar3) (hay-camino lugar2 lugar4)
        (hay-camino lugar2 lugar6) (hay-camino lugar1 lugar9)
        (hay-camino lugar3 lugar5) (hay-camino lugar3 lugar8)
        
        
        (is-in Pasajero1 lugar2) (is-in Pasajero2 lugar3) 
        (is-in Pasajero3 lugar9) (is-in Pasajero4 lugar8)
        (is-in Pasajero5 lugar3) (is-in Pasajero6 lugar3)
        (is-in Pasajero7 lugar8) (is-in Pasajero8 lugar9)
        
        
        (es-gasolinera lugar9)
        (es-parada lugar7)
        (es-parada lugar2)
        (es-parada lugar5)
        
        (combi combi1)
        (combi combi2)

        (at combi1 lugar6)
        (at combi2 lugar8)
     
        
        (= (Cantidad-Gasolina combi1) 50) 
        (= (Asientos-Ocupados combi1) 0)
        
        (= (Cantidad-Gasolina combi2) 50) 
        (= (Asientos-Ocupados combi2) 0)
  
    )
    
    (:goal
        (and 
            (Dejar Pasajero1 lugar7)
            (Dejar Pasajero2 lugar5)
            (Dejar Pasajero3 lugar7)
            (Dejar Pasajero4 lugar2)
            (Dejar Pasajero5 lugar7)
            (Dejar Pasajero6 lugar2)
            (Dejar Pasajero7 lugar5)
            (Dejar Pasajero8 lugar5)
            
            
            (at combi1 lugar1)
            (at combi2 lugar1)
            )
    )
    
    (:metric 
        minimize (+(Cantidad-Gasolina combi1)(Cantidad-Gasolina combi2)))
)