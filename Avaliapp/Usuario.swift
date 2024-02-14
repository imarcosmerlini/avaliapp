//
//  Usuario.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Usuario: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: context)
        
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
}
