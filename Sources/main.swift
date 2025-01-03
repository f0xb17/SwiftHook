import Foundation
import FoundationNetworking

import Foundation

func createRequest(url: URL, body: Data) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = body
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
}

func message() -> String {
  return "Meddl Loide"
}
