//
//  ViewController.swift
//  DemoMusic
//
//  Created by Juan  Sanchez on 18/3/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var reproductor : AVAudioPlayer!

    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblInterprete: UILabel!
    
    @IBOutlet weak var imgCoverPortadaCD: UIImageView!
    
    @IBOutlet weak var lblVolumen: UILabel!
    
    
    @IBOutlet weak var segCanciones: UISegmentedControl!
    
    var sonidoURL = NSBundle.mainBundle().URLForResource("", withExtension: "mp3")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // crear la lista de canciones
        biblioteca.append( Cancion( nombre: "california",
                                    titulo: "California dreamin'",
                                    interprete: "The Mamas and  the papas"
                                   )
                          )
        biblioteca.append( Cancion( nombre: "horse",
                                    titulo: "Horse without name",
                                    interprete: "America"
                                   )
                          )
        biblioteca.append( Cancion( nombre: "francisco",
                                    titulo: "San Francisco",
                                    interprete: "Scott McKenzic"
                                   )
                          )
        biblioteca.append( Cancion( nombre: "steppin",
                                    titulo: "Steppin' out",
                                    interprete: "Joe Jackson"
                                  )
                         )
        biblioteca.append( Cancion( nombre: "gold",
                                    titulo: "Gold'",
                                    interprete: "Spandau Ballet"
                                  )
                         )
        self.lblTitulo.text = biblioteca[0].titulo
        self.lblInterprete.text = biblioteca[0].interprete
        self.imgCoverPortadaCD.image =  UIImage(named: biblioteca[0].nombre + ".jpg"  )
        
        self.sonidoURL = NSBundle.mainBundle().URLForResource(biblioteca[0].nombre , withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            lblVolumen.text = "Volumen " + String(reproductor.volume * 100) + "%"
        }
        catch {
            print("Error de reproduccion")
        }
        
    }

    
    
    @IBAction func sgmCanciones(sender: UISegmentedControl) {
        let indice = sender.selectedSegmentIndex
        self.lblTitulo.text = biblioteca[indice].titulo
        self.lblInterprete.text = biblioteca[indice].interprete
        self.imgCoverPortadaCD.image =  UIImage(named: biblioteca[indice].nombre + ".jpg" )
        
        self.sonidoURL = NSBundle.mainBundle().URLForResource(biblioteca[indice].nombre , withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        }
        catch {
            print("Error de reproduccion")
        }
        if !reproductor.playing {
            reproductor.play()
        }
        
    }
    

    @IBAction func btnReproducir() {
        if !reproductor.playing {
           reproductor.play()
        }
    }
    
    
    @IBAction func btnPausar() {
        if reproductor.playing {
            reproductor.pause()
        }
    }
    

    @IBAction func btnDetener() {
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0.0
            
        }
    }
    
    
    
    @IBAction func btnVolumen(sender: UIStepper) {
               reproductor.volume = Float(sender.value / 10)
        
               lblVolumen.text = "Volumen " + String(sender.value * 10 ) + "%"
    }
    
    
    @IBAction func btnAleatorio() {
        var indice = Int(arc4random_uniform(5))
        
        while indice == self.segCanciones.selectedSegmentIndex {
            indice = Int(arc4random_uniform(5))
        }
        
        self.segCanciones.selectedSegmentIndex = indice
        
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0.0
            
        }
        
        self.lblTitulo.text = biblioteca[indice].titulo
        self.lblInterprete.text = biblioteca[indice].interprete
        self.imgCoverPortadaCD.image =  UIImage(named: biblioteca[indice].nombre + ".jpg" )
        
        self.sonidoURL = NSBundle.mainBundle().URLForResource(biblioteca[indice].nombre , withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        }
        catch {
            print("Error de reproduccion")
        }
        
        reproductor.play()
        
    }
    
    
    

}

