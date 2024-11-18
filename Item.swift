import Foundation
import SwiftData

@Model
final class Item {
    var label: String
    var data: String
    var type: String  // will be either "EAN13" or "QR Code"
    var timestamp: Date
    
    init(label: String = "", data: String = "", type: String = "EAN13") {
        self.label = label
        self.data = data
        self.type = type
        self.timestamp = Date()
    }
}
