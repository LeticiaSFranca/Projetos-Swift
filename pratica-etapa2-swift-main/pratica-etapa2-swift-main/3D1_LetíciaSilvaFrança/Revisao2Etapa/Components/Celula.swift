import UIKit

class Celula: UITableViewCell {

    @IBOutlet weak var lblNumero: UILabel!
    @IBOutlet weak var lblAd: UILabel!
    @IBOutlet weak var lblIseven: UILabel!
    
    public func cellPopulation(numero : Numero) {
        lblNumero.text = numero.numero
        lblAd.text = numero.ad
        lblIseven.text = "\(numero.iseven ?? true)"
    }
}
