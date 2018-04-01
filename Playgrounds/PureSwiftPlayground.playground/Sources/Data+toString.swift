import Foundation

extension Data {
    public func toString (withEncoding encoding: String.Encoding) -> String {
        return String(data: self, encoding: encoding) ?? ""
    }
}
