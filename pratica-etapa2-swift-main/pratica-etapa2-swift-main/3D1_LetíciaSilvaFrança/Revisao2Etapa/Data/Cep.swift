import Foundation

struct Numero : Codable {
    let numero,
        ad : String?
    let iseven : Bool?
    
    public func toString() -> String {
        return "\(numero!) -> \(ad!), \(iseven ?? true)"
    }
}
