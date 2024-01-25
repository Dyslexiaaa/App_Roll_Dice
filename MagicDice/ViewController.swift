//
//  ViewController.swift
//  MagicDice
//
//  Created by Alumno on 22/01/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var inputUser: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var buttonPress: UIButton!
    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Aqui configuro todos los ajustes para los textos
        titleLabel.text = "Atinale al nùmero"
        resultLabel.text = "?"
        //Alineamos el texto en el centro
        titleLabel.textAlignment = .center
        resultLabel.textAlignment = .center
        //Ajustamos para que el input sea exclusivamente nùmerico
        inputUser.delegate = self
        inputUser.keyboardType = .numberPad
        buttonPress.setTitle("Adivina", for: .normal)

    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        //Generamos el nùmero aleatorio
        let numRandom = Int(arc4random_uniform(6) + 1)
        //En esa siguiente linea obtenemos el nùmero que inserto el usuario
        guard let numInput = Int(inputUser.text ?? "") else { return }
        //Condicional para poder comparar el nùmero insertado por el usuario
        if numInput == numRandom{
            //Si es igual, cambia el color a verde y le indica al usuario que adivinò
            view.backgroundColor = UIColor.green
            resultLabel.text =  "Adivinaste!"
        }else{
            //En caso contrario cambia el color a rojo y le indica al usuario que no adivinò, tambièn muestra el nùmero que la computadora creò
            view.backgroundColor = UIColor.red
            resultLabel.text = "Te equivocaste el nùmero es: " + String(numRandom)
        }
    }
}

