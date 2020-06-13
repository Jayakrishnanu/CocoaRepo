import UIKit

public class CocoaRepo {
    
    /// Converts hexastring value to uicolor
    /// - Warning - The # symbol is for the warning comments
    /// - Parameters:
    ///   - hexString: hexstring color value
    ///   - alpha: alpha value 0 to 1.0
    /// - Returns: UIColor.
    internal class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        
        let r, g, b: CGFloat
        
        let offset = hexString.hasPrefix("#") ? 1 : 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        print(hexColor.count)
        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
              
                
                return UIColor(red: r, green: g, blue: b, alpha: alpha)
            }
        }
        
        
        return .black
     }
   
    
    /// The most color for all humanity
    public static var cocoaColor: UIColor {
        return self.colorFromHexString("006736")
    }
    
}
