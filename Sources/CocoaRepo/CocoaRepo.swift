import UIKit

class CocoaRepo {
    
    /// Converts hexastring value to uicolor
    /// - Warning - The # symbol is for the warning comments
    /// - Parameters:
    ///   - hexString: hexstring color value
    ///   - alpha: alpha value 0 to 1.0
    /// - Returns: UIColor.
    class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        
        let r, g, b, a: CGFloat
        
        let offset = hexString.hasPrefix("#") ? 1 : 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                
                return UIColor.init(red: r, green: g, blue: b, alpha: a)
            }
        }
        
        
        return .black
        
        
    }
    
    
}
