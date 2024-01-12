import UIKit

class ViewController: UIViewController {

    @IBAction func btnAdd(_ sender: Any) {
        let viewCadastroRoupa = CadastroRoupa()
        viewCadastroRoupa.delegate = self
        self.navigationController?.pushViewController(viewCadastroRoupa, animated: true)
    }
    
    var userDefault = UserDefaults.standard
    let listKey = "App"

    @IBOutlet weak var tableView: UITableView!
    
    var lista : [Numero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaDados()
        tableView.dataSource = self
    }
    
    
    func carregaDados() {
        guard let listData = userDefault.value(forKey: listKey) as? Data else {
            lista = []
            return
        }
        do {
            let savedList = try JSONDecoder().decode([Numero].self, from : listData)
            lista = savedList
        } catch {
            print("Erro ao recuperar os dados")
        }
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? Celula{
            let item = lista[indexPath.row]
            
                cell.cellPopulation(numero: item)
                return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: CadastroRoupaDelegate{
    func saveNew(numero: Numero) {
        lista.append(numero)
        do {
            let serialezedList = try JSONEncoder().encode(lista)
            userDefault.setValue(serialezedList, forKey: listKey)
        } catch {
            lista.removeAll(where: {$0.numero == numero.numero})
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: { [weak self] in
            guard let context = self else {
                return
            }
            context.tableView.reloadData()
        })
        tableView.reloadData()
    }
}
