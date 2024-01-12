//
//  ViewController.swift
//  3D_LeticiaSilvaFranca_21
//
//  Created by COTEMIG on 26/04/5 R.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var lista: [Dados] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Dados(nome: "Pão com Manteiga", calorias: "30Kcal", peso: "1Kg")
        
        let item2 = Dados(nome: "Arroz e Feijão", calorias: "30Kcal", peso: "1Kg")
        
        let item3 = Dados(nome: "Sopa", calorias: "30Kcal", peso: "1Kg")
        
        lista.append(item1)
        lista.append(item2)
        lista.append(item3)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") {
            let item = lista[indexPath.row]
            cell.textLabel?.text = item.nome
            cell.detailTextLabel?.text = "\(item.calorias) \(item.peso)"
            return cell
        }
        return UITableViewCell()
}
    func tableView(_ tableViw: UITableView, didSelectRowAt indexPath: IndexPath){
        let item = lista[indexPath.row]
        performSegue(withIdentifier: "viewToView2", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let parametro = sender as? Dados,
           let vc = segue.destination as? SegundaViewController {
            
            vc.dados = parametro
        }
    }
}

struct Dados {
    var nome: String
    var calorias: String
    var peso: String
}
