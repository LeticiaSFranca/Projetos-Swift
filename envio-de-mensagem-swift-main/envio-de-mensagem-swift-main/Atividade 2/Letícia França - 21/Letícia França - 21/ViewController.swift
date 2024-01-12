//
//  ViewController.swift
//  Letícia França - 21
//
//  Created by COTEMIG on 29/03/5 R.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAssunto: UITextField!
    @IBOutlet weak var txtMensagem: UITextView!
    
    @IBAction func btnEnviar(_ sender: Any) {
        if let email = txtEmail.text,
           let assunto = txtAssunto.text,
           let mensagem = txtMensagem.text
           {
            let dados = Dados(email: email, assunto: assunto, mensagem: mensagem)
            performSegue(withIdentifier: "GoToView2", sender: dados)
            
            //Exibir os resultados na outra tela
           }
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if let dados = sender as? Dados,
           let receberDados = segue.destination as? SecondViewController{
            receberDados.dados = dados
        }
    }
}

struct Dados{
    var email: String
    var assunto: String
    var mensagem: String
}
