//
//  SecondViewController.swift
//  Letícia França - 21
//
//  Created by COTEMIG on 29/03/5 R.
//

import UIKit

class SecondViewController: UIViewController {

    var dados: Dados?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exibeEmail.text = "\(dados?.email ?? "")"
        //exibe os dados digitado do email, aqui
        exibeAssunto.text = "\(dados?.assunto ?? "")"
        exibeMensagem.text = "\(dados?.mensagem ?? "")"
    }
    
    @IBOutlet weak var exibeEmail: UILabel!
    @IBOutlet weak var exibeAssunto: UILabel!
    @IBOutlet weak var exibeMensagem: UITextView!
    

}
