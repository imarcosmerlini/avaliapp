//
//  AbstractDAO.swift
//  ProjetoFilme
//
//  Created by Student on 9/23/16.
//  Copyright © 2016 romulo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AbstractDao{
    
    
    static func getContext() -> NSManagedObjectContext{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext;
    }
    
    
    static func inserir(object: NSManagedObject){
        let context = self.getContext()
        context.insertObject(object)
        
        do {
            try context.save()
            print("salvooou!")
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func alterar(){
        let context = self.getContext()
        
        do {
            try context.save()
            print("Alterrou!")
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func excluir(object: NSManagedObject){
        let context = self.getContext()
        context.deleteObject(object)
        do {
            try context.save()
            print("Excluir!")
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    
    
}