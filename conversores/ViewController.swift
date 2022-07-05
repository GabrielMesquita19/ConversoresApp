//
//  ViewController.swift
//  conversores
//
//  Created by User on 12/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text!{
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("kilograma", for: .normal)
                btUnit2.setTitle("libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilometro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("celsius", for: .normal)
                btUnit2.setTitle("farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        func calcTemperature(){
            guard let temperature = Double(tfValue.text!) else { return }
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "farenheint"
                lbResult.text = String((temperature * 1.8) + 32.0)
            } else{
                lbResultUnit.text = "celsius"
                lbResult.text = String((temperature - 32.0) / 1.8)
            }

        }
        func calcWeight(){
            guard let weight = Double(tfValue.text!) else { return }
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "Libra"
                lbResult.text = String(weight / 2.2046)
            } else{
                lbResultUnit.text = "kilograma"
                lbResult.text = String(weight * 2.2046)
            }
            
        }
        func calcCurrenty(){
            guard let currenty = Double(tfValue.text!) else { return }
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "dolar"
                lbResult.text = String(currenty / 5.38)
            } else{
                lbResultUnit.text = "real"
                lbResult.text = String(currenty * 5.38)
            
            }
            
        }
        func calcDistanc(){
            guard let distanc = Double(tfValue.text!) else { return }
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "kilometro"
                lbResult.text = String(distanc / 1000.0)
            } else{
                lbResultUnit.text = "metro"
                lbResult.text = String(distanc * 1000.0)
            
        }
        
    
        }
        switch lbUnit.text!{
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrenty()
            default:
                calcDistanc()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
        }
}
