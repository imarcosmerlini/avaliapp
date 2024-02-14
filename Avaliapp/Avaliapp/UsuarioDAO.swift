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

class UsuarioDAO : AbstractDao{
    
    
    static func insertDefaultData(){
        let listaUsuario = self.buscarTodos()
        if(listaUsuario.count == 0){
            let usuario1 = Usuario();
            usuario1.email = "usuario1@unochapeco.edu.br"
            usuario1.senha = "teste"
            
            self.inserir(usuario1)
            
            
            let usuario2 = Usuario();
            usuario2.email = "usuario2@unochapeco.edu.br"
            usuario2.senha = "teste2"
            
            self.inserir(usuario2)
        }
    }
    
    
    static func buscarTodos() -> [Usuario]{
        let context = self.getContext()
        var listaUsuarios :[Usuario] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Usuario")
        request.sortDescriptors = [NSSortDescriptor.init(key : "nome", ascending: true)]
        
        do {
            listaUsuarios = try context.executeFetchRequest(request) as! [Usuario]
            print("Total usuario ", listaUsuarios.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaUsuarios
    }
    
    
    static func getUsersByField(field: String, value: String) -> [Usuario]{
        let context = self.getContext()
        var listaUsuarios :[Usuario] = []
        let request : NSFetchRequest = NSFetchRequest(entityName : "Usuario")
        request.predicate = NSPredicate(format: "\(field) == %@", argumentArray: [value])
        
        do {
            listaUsuarios = try context.executeFetchRequest(request) as! [Usuario]
            return listaUsuarios
        }catch let erro as NSError{
            print(erro)
        }
        return [Usuario]()
    }
    
    
    static func getAuthenticatedUser() -> Usuario!{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let email = userDefaults.stringForKey("userMail")
        let listaUsuarios = self.getUsersByField("email", value: email!)
        
        return listaUsuarios.first!
    }
    
    
    static func setAuthenticatedUser(usuario: Usuario){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(usuario.email, forKey: "userMail")
    }
}