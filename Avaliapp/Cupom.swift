//
//  Cupom.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Cupom: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Cupom", inManagedObjectContext: context)
        
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
}
