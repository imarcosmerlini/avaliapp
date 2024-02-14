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

class AvaliacaoDAO : AbstractDao{
    
    static var estabelecimento: Estabelecimento!
    static var cupom: String = ""
    
    static func buscarTodos() -> [Avaliacao]{
        let context = self.getContext()
        var listaAvaliacao :[Avaliacao] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Avaliacao")
        request.sortDescriptors = [NSSortDescriptor.init(key : "cupomFiscal", ascending: true)]
        
        do {
            listaAvaliacao = try context.executeFetchRequest(request) as! [Avaliacao]
            print("Total Avaliacao ", listaAvaliacao.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaAvaliacao
    }
    
    static func adicionarEstabelecimento(estabelecimento: Estabelecimento) {
        self.estabelecimento = estabelecimento
    }
    
    static func adicionarNumeroCupom(cupom: String) {
        self.cupom = cupom
    }
    
    static func resgatarCupom() -> String {
        return self.cupom
    }
    
    static func resgatarEstabelecimento() -> Estabelecimento {
        return self.estabelecimento
    }
}