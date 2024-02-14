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

class EstabelecimentoDAO : AbstractDao{
    
    
    static func buscarTodos() -> [Estabelecimento]{
        let context = self.getContext()
        var listaUsuarios :[Estabelecimento] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Estabelecimento")
        request.sortDescriptors = [NSSortDescriptor.init(key : "nome", ascending: true)]
        
        do {
            listaUsuarios = try context.executeFetchRequest(request) as! [Estabelecimento]
            print("Total estabelecimento ", listaUsuarios)
            
            for item in listaUsuarios {
                print(item.nome)
            }
            
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaUsuarios
    }
    
    static func getEstabelecimentoByField(field: String, value: String) -> Estabelecimento{
        let context = self.getContext()
        var listaUsuarios :[Estabelecimento] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Estabelecimento")
        request.predicate = NSPredicate(format: "\(field) == %@", argumentArray: [value])
        
        do {
            listaUsuarios = try context.executeFetchRequest(request) as! [Estabelecimento]
            return listaUsuarios[0]
        }catch let erro as NSError{
            print(erro)
        }
        return Estabelecimento()
    }
    
    
    static func inserirDadosPadroes(){
        if self.buscarTodos().count == 0 {
            
            let estabelecimento1 = Estabelecimento()
            estabelecimento1.nome = "Riachuello"
            estabelecimento1.cnpj = "123.1234.1234-0000/1"
            estabelecimento1.ambiente = 0
            estabelecimento1.produto = 0
            estabelecimento1.atendimento = 0
            estabelecimento1.latitude = -27.070356
            estabelecimento1.longitude = -52.626090
            estabelecimento1.logo = "riachuelo"
            
            
            EstabelecimentoDAO.inserir(estabelecimento1)
            
            let estabelecimento2 = Estabelecimento()
            estabelecimento2.nome = "Burguer King"
            estabelecimento2.cnpj = "123.1234.1234-0000/1"
            estabelecimento2.ambiente = 0
            estabelecimento2.produto = 0
            estabelecimento2.atendimento = 0
            estabelecimento2.logo = "burguerking"
            estabelecimento2.latitude = -27.070126
            estabelecimento2.longitude = -52.625172
            EstabelecimentoDAO.inserir(estabelecimento2)
            
            
            let estabelecimento3 = Estabelecimento()
            estabelecimento3.nome = "Subway"
            estabelecimento3.cnpj = "123.6125.1234-0000/1"
            estabelecimento3.ambiente = 0
            estabelecimento3.produto = 0
            estabelecimento3.atendimento = 0
            estabelecimento3.logo = "subway"
            estabelecimento3.latitude = -27.070193
            estabelecimento3.longitude = -52.625312
            EstabelecimentoDAO.inserir(estabelecimento3)
            
            
            let estabelecimento4 = Estabelecimento()
            estabelecimento4.nome = "McDonalds"
            estabelecimento4.cnpj = "123.6134.1234-0000/1"
            estabelecimento4.ambiente = 0
            estabelecimento4.produto = 0
            estabelecimento4.atendimento = 0
            estabelecimento4.logo = "mcdonalds"
            estabelecimento4.latitude = -27.069735
            estabelecimento4.longitude = -52.625269
            EstabelecimentoDAO.inserir(estabelecimento4)
            
            
            let estabelecimento5 = Estabelecimento()
            estabelecimento5.nome = "Patroni Pizzaria"
            estabelecimento5.cnpj = "123.1928.1234-0000/1"
            estabelecimento5.ambiente = 0
            estabelecimento5.produto = 0
            estabelecimento5.atendimento = 0
            estabelecimento5.logo = "patroni"
            estabelecimento5.latitude = -27.070251
            estabelecimento5.longitude = -52.625440
            EstabelecimentoDAO.inserir(estabelecimento5)
        }
    }
    
}