//
//  Avaliacao+CoreDataProperties.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Avaliacao {

    @NSManaged var comentario: String?
    @NSManaged var ambiente: NSNumber?
    @NSManaged var produto: NSNumber?
    @NSManaged var atendimento: NSNumber?
    @NSManaged var cupomFiscal: String?
    @NSManaged var usuario: Usuario?
    @NSManaged var estabelecimento: Estabelecimento?

}
