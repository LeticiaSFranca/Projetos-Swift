struct MinhaStruct {
    var nome,
        sobrenome: String
    var idade: Int
    
    func Calcular(parametro: Bool, parametro2: String?) {
        var idadeLocal = 0
        
        if parametro,
           let local2 = parametro2,
            local2.count > 0 {
            
            idadeLocal = 10
            
        } else {
            idadeLocal = 12
        }
        
        //fazendo if mais resumido :
        //idadeLocal = parametro ? 10 : 12
        
        //fazendo parametro mais resumido:
        //
        
        print("Idade Final: \(idadeLocal)")
    }
}
