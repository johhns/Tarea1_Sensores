//
//  Datos.swift
//  DemoMusic
//
//  Created by Juan  Sanchez on 18/3/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import Foundation

public class Cancion {
    var nombre : String
    var titulo : String
    var interprete : String
    
    init ( nombre : String, titulo : String, interprete : String) {
        self.nombre = nombre
        self.titulo = titulo
        self.interprete = interprete
    }
}

public var biblioteca = [Cancion]()







