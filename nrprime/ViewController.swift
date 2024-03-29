//
//  ViewController.swift
//  nrprime
//
//  Created by Marius Ilie on 08/03/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NrPrimDelegate {
    var calculatorBrain = VerificarePrim()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain.delegate = self
        
        // La incarcarea View-ului setez delegatul ca fiind self (ViewController)
        
        // self trebuie sa fie initializat inainte de-al folosi. In viewDidLoad stiu sigur ca self exista
        // self este ViewController, fara el nu am putea vedea View-ul deci nu am vedea nimic in aplicatie. De-asta cand apare View-ul sunt 100% sigur ca exista si ViewController-ul
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func onTap(_ sender: UIButton) {
        // Cand se apasa butonul verifica, schimb valorea din "brain-ul" aplicatiei
        // Computed property-ul value din "brain" va apela metoda valueDidChange definita in protocol si implementata in delegat (putin mai jos)
        
        if let n = textField.text {
            calculatorBrain.value = Int(n)
        }
    }
    
    func updateUI() {
        if calculatorBrain.status != nil {
            textField.text = "\(calculatorBrain.value!)"
            // Pun in textField valoarea din calculatorBrain.value
        }
        else {
            textField.text = nil
            // Golesc textField-ul daca nu e numar
        }
        
        statusLabel.text = calculatorBrain.statusMessage
        // Schimb textul din statusLabel
    }
    
    func valueDidChange() {
        updateUI()
        
        // Apelata de fiecare data cand s-a modificat valoarea lui calculatorBrain.value si statusul
        // Pune in actiune updateUI() pentru a afisa statusul
    }
}

