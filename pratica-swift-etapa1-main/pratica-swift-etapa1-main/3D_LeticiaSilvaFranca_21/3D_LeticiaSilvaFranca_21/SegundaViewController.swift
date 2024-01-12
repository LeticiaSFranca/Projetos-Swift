//
//  SegundaViewController.swift
//  3D_LeticiaSilvaFranca_21
//
//  Created by COTEMIG on 26/04/5 R.
//

import UIKit

class SegundaViewController: UIViewController {

    var dados: Dados? = nil
    
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblCalorias: UILabel!
    @IBOutlet weak var lblPeso: UILabel!
    @IBOutlet weak var lblCalorias2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNome.text = dados?.nome
        lblPeso.text = dados?.peso
        lblCalorias.text = dados?.calorias
        lblCalorias2.text = dados?.calorias
        
    }
    
}
