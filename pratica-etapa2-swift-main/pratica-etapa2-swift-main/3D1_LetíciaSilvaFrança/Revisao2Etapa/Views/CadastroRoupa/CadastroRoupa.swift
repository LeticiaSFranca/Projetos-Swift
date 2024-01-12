//
//  CadastroRoupa.swift
//  Revisao2Etapa
//
//  Created by COTEMIG on 02/08/23.
//

import UIKit
protocol CadastroRoupaDelegate{
    func saveNew(numero: Numero)
}

class CadastroRoupa: UIViewController {

    @IBOutlet weak var txtResultado: UITextView!
    
    var salvo: Numero? = nil
    
    var delegate: CadastroRoupaDelegate? = nil
    
    @IBAction func btnReq(_ sender: Any) {
        self.txtResultado.text = ""
        
        if let url = URL(string: "https://api.isevenapi.xyz/api/iseven/12/") {
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) {
                [weak self] data, response, error in
                guard let self = self else {return}
                if let resultData = data{
                    print(resultData)
                    do {
                        let localStruct = try JSONDecoder().decode(Numero.self, from: resultData)
                        self.salvo = localStruct
                        DispatchQueue.main.async {
                            self.txtResultado.text = localStruct.toString()
                        }
                    } catch {
                        print("==> Erro no parser da struct")
                    }
                }
                if let resultError = error{
                    
                }
            }.resume()
        }
    }
    
    @IBAction func btnSalvar(_ sender: Any) {
        if let item = self.salvo{
            delegate?.saveNew(numero: item)
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "API sobre Números"
    }
}
