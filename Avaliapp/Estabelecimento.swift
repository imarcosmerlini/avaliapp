//
//  Estabelecimento.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import MapKit


class Estabelecimento: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Estabelecimento", inManagedObjectContext: context)
        
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
    
    func getPinMap() -> PinMap{
        let image = UIImage(named: self.logo!)
        return PinMap(title: self.nome!, locationName: self.nome!, discipline: "", coordinate:CLLocationCoordinate2D(latitude: Double(self.latitude!), longitude: Double(self.longitude!)), image: image!, estabelecimento: self)
    }
    
    func updateAvaliacoes(){
        
        var notaAtendimento = 0
        var notaProduto = 0
        var notaAmbiente = 0
        
        let comentarios = getComentarios()
        for comentario in comentarios {
             notaAtendimento = notaAtendimento + Int(comentario.atendimento!)
             notaProduto = notaProduto + Int(comentario.produto!)
             notaAmbiente = notaAmbiente + Int(comentario.ambiente!)
        }
        
        //self.ambiente = NSNumber(float: round(Float(notaAmbiente / comentarios.count)))
        //self.produto = NSNumber(float: round(Float(notaProduto / comentarios.count)))
        //self.atendimento = NSNumber(float: round(Float(notaAtendimento / comentarios.count)))
        
        
        print("Empresa: ", self.nome)
        print("Total ambiente ", self.ambiente)
        print("Total produto ", self.produto)
        print("Total atendimento ", self.atendimento)
        
        let estab = EstabelecimentoDAO.getEstabelecimentoByField("cnpj", value: self.cnpj!)
        
        estab.ambiente = NSNumber(float: round(Float(notaAmbiente / comentarios.count)))
        estab.produto = NSNumber(float: round(Float(notaProduto / comentarios.count)))
        estab.atendimento = NSNumber(float: round(Float(notaAtendimento / comentarios.count)))
        EstabelecimentoDAO.alterar();
        
    }
    
    func getComentarios()-> [Avaliacao]{
        var avaliacoes  = [Avaliacao]()
        
        let usuario1 = Usuario()
        usuario1.nome = "Juli Fofeti"
        usuario1.avatar = "avatar1"
        usuario1.email = "julifofeti@gmail.com"
        
        let usuario2 = Usuario()
        usuario2.nome = "Joao Molestia"
        usuario2.avatar = "avatar2"
        usuario2.email = "joaoMolestia@gmail.com"
        
        let usuario3 = Usuario()
        usuario3.nome = "Yin Tshu Kuang"
        usuario3.avatar = "avatar3"
        usuario3.email = "yinyintshu@gmail.com"
        
        let usuario4 = Usuario()
        usuario4.nome = "Roberto Turba"
        usuario4.avatar = "avatar4"
        usuario4.email = "memas@gmail.com"
        
        var avaliacao1 = Avaliacao()
        avaliacao1.comentario = "Gostei muito deste local"
        avaliacao1.estabelecimento = self
        avaliacao1.usuario = usuario1
        avaliacao1.ambiente = Int(arc4random_uniform(10))
        avaliacao1.produto = Int(arc4random_uniform(10))
        avaliacao1.atendimento = Int(arc4random_uniform(10))
        avaliacoes.append(avaliacao1)
        
        avaliacao1 = Avaliacao()
        avaliacao1.comentario = "Eita lugar massa soõ"
        avaliacao1.estabelecimento = self
         avaliacao1.usuario = usuario2
        avaliacao1.ambiente = Int(arc4random_uniform(10))
        avaliacao1.produto = Int(arc4random_uniform(10))
        avaliacao1.atendimento = Int(arc4random_uniform(10))
        avaliacoes.append(avaliacao1)
        
        avaliacao1 = Avaliacao()
        avaliacao1.comentario = "Interessante o local, atendimento compensa o produto"
        avaliacao1.estabelecimento = self
         avaliacao1.usuario = usuario3
        avaliacao1.ambiente = Int(arc4random_uniform(30))
        avaliacao1.produto = Int(arc4random_uniform(30))
        avaliacao1.atendimento = Int(arc4random_uniform(30))
        avaliacoes.append(avaliacao1)
        
        avaliacao1 = Avaliacao()
        avaliacao1.comentario = "Baita estabelecimento! Sempre volto!"
        avaliacao1.estabelecimento = self
        avaliacao1.usuario = usuario4
        avaliacao1.ambiente = Int(arc4random_uniform(10))
        avaliacao1.produto = Int(arc4random_uniform(10))
        avaliacao1.atendimento = Int(arc4random_uniform(10))
        avaliacoes.append(avaliacao1)
        
        return avaliacoes
    }

}
