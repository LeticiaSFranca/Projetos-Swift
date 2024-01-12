import UIKit

class MinhaCelulaTableViewCell: UITableViewCell {
    @IBOutlet weak var labelCentral: UILabel!
    
    func carregar(item: String) {
        labelCentral.text = item
    }
}
