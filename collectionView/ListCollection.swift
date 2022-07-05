import UIKit
    
struct listAlbums {
    
    enum TypeAlbum {
        case albumTwoRows
        case albumOneRow
        case list
    }

    let type: TypeAlbum
    let title: String
    let button: String?
    let listAlbum: [listAlbumCollection]
}
struct listAlbumCollection {
    var title: String
    var image: UIImage
    var numbersOfPhotos: Int
}


