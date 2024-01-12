//
//  ViewController.swift
//  3D_LeticiaFranca_21
//
//  Created by COTEMIG on 30/08/23.
//

import UIKit

class ViewController: UIViewController {
    //Variáveis e Iboutlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Métodos Privados e o que mais precisar
    @IBAction func cliqueNaBarra() {
        var vc = SegundaViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cliqueDoBotao(_ sender: Any) {
        print("Ação do botão")
    }
    
}
