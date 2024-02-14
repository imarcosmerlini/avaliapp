//
//  ContatoDAO.swift
//  CorreData
//
//  Created by Student on 9/22/16.
//  Copyright © 2016 romulo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CupomDAO : AbstractDao{
    
    
    static func buscarTodos() -> [Cupom]{
        let context = self.getContext()
        var listaCupom :[Cupom] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Cupom")
        request.sortDescriptors = [NSSortDescriptor.init(key : "codigo", ascending: true)]
        
        do {
            listaCupom = try context.executeFetchRequest(request) as! [Cupom]
            print("Total Cupom ", listaCupom.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaCupom
    }
    
    static func inserirDadosPadroes() {
        let cupom1 = Cupom()
        cupom1.codigo = "DAIH781"
        cupom1.status = 1
        cupom1.descricao = "20%"
        //        cupom1.usuario =
        //        cupom1.estabelecimento =
        CupomDAO.inserir(cupom1)
        
        let cupom2 = Cupom()
        cupom2.codigo = "DAS8H98"
        cupom2.status = 0
        cupom2.descricao = "40%"
        //            cupom2.usuario =
        //            cupom2.estabelecimento =
        CupomDAO.inserir(cupom2)
        
        let cupom3 = Cupom()
        cupom3.codigo = "89ASHD9"
        cupom3.status = 1
        cupom3.descricao = "Cookie"
        //            cupom3.usuario =
        //            cupom3.estabelecimento =
        CupomDAO.inserir(cupom3)
        
        let cupom4 = Cupom()
        cupom4.codigo = "A8S9DHA"
        cupom4.status = 0
        cupom4.descricao = "45%"
        //            cupom4.usuario =
        //            cupom4.estabelecimento =
        CupomDAO.inserir(cupom4)
    }
    
    
    
    
}