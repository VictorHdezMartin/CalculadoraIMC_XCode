//
//  ViewController.swift
//  Calculadora IMC
//
//  Created by Tardes on 11/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Peso: UILabel!
    @IBOutlet weak var Altura: UILabel!
    @IBOutlet weak var PesoSlide: UISlider!
    @IBOutlet weak var AlturaSlice: UISlider!
    @IBOutlet weak var PesoStepper: UIStepper!
    @IBOutlet weak var AlturaStepper: UIStepper!
    
    @IBOutlet weak var CalcularIMC: UIButton!
    
    @IBOutlet weak var PesoBajo: UILabel!
    @IBOutlet weak var PesoNormal: UILabel!
    @IBOutlet weak var SobrePeso: UILabel!
    @IBOutlet weak var PesoObeso: UILabel!
    @IBOutlet weak var PesoExtremo: UILabel!
    
  //---------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PesoStepper.value = 60
        AlturaStepper.value = 120
        
    }

 // Para el peso  -------------------------------------------------------------------------
    
    @IBAction func pesoSlice(_ sender: UISlider) {
        Peso.text = String(format: "%.1f", sender.value) + " kg"
        PesoStepper.value = Double(PesoSlide.value)
    }
    
    @IBAction func pesoStepper(_ sender: UIStepper) {
        Peso.text = String(format: "%.1f", sender.value) + " kg"
        PesoSlide.value = Float(PesoStepper.value)
    }
    
 // Para la altura  -----------------------------------------------------------------------
    
    @IBAction func alturaSlice(_ sender: UISlider) {
        Altura.text = String(Int(sender.value)) + " cm"
        AlturaStepper.value = Double(AlturaSlice.value)
    }
    
    @IBAction func alturaStepper(_ sender: UIStepper) {
        Altura.text = String(Int(sender.value)) + " cm"
        AlturaSlice.value = Float(AlturaStepper.value)  }
    
 //----------------------------------------------------------------------------------------
    
    @IBAction func calcularIMCbtn(_ sender: Any) {
        
        let calculoIMC = Double(PesoStepper.value) / pow(Double(AlturaStepper.value) / 100, 2)
        
        initLabels()
        
        switch calculoIMC {
        case 0...18.4:
                PesoBajo.text = String(format: "%.1f", calculoIMC)
                PesoBajo.isHidden = false
            case 18.5...24.9:
                PesoNormal.text = String(format: "%.1f", calculoIMC)
                PesoNormal.isHidden = false
            case 25...29.9:
                SobrePeso.text = String(format: "%.1f", calculoIMC)
                SobrePeso.isHidden = false
            case 30...34.9:
                PesoObeso.text = String(format: "%.1f", calculoIMC)
                PesoObeso.isHidden = false
            default:
                PesoExtremo.text = String(format: "%.1f", calculoIMC)
                PesoExtremo.isHidden = false
            }
 
    }
    
    func initLabels() {
        PesoBajo.text = ""
        PesoBajo.isHidden = true
        
        PesoNormal.text = ""
        PesoNormal.isHidden = true
        
        SobrePeso.text = ""
        SobrePeso.isHidden = true
        
        PesoObeso.text = ""
        PesoObeso.isHidden = true
        
        PesoExtremo.text = ""
        PesoExtremo.isHidden = true
    }
    
    

}

