//
//  Usuario+CoreDataProperties.swift
//  Avaliapp
//
//  Created by Student on 9/27/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Usuario {

    @NSManaged var dataNascimento: NSDate?
    @NSManaged var email: String?
    @NSManaged var nome: String?
    @NSManaged var senha: String?
    @NSManaged var avatar: String?
    @NSManaged var avaliacoes: Avaliacao?
    @NSManaged var cupons: Cupom?

}
