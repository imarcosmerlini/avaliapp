import MapKit
import UIKit

class PinMap: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let image: UIImage
    let coordinate: CLLocationCoordinate2D
    let estabelecimento : Estabelecimento
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, image: UIImage, estabelecimento : Estabelecimento) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.image = image
        self.estabelecimento = estabelecimento
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    var logo: UIImage? {
        return self.resizeImage(self.image, targetSize: CGSizeMake(40.0, 40.0))
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}