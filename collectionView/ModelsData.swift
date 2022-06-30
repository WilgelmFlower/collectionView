import UIKit

struct Albums {
    
    enum typeAlbum {
        case albumTwoRows
        case albumOneRow
    }

    let type: typeAlbum
    let title: String
    let button: String?
    let albums: [Album]
}

struct Album {
    var title: String
    var image: UIImage
    var numbersOfPhotos: Int
}
