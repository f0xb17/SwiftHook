import Foundation
import FoundationNetworking

// Function to create a URLRequest with the given URL and body data
// Parameters:
// - url: The URL to send the request to
// - body: The data to send in the request
// Returns the created request
func createRequest(url: URL, body: Data) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = body
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
}

// Function to create a message
// Returns the message
func message() -> String {
  return "Meddl Loide"
}

// Main function to execute the webhook request
func main() {
  // Discord webhook URL
  let webhookURL = ""
  guard let url = URL(string: webhookURL) else {
    print("Invalid URL")
    return
  }

  let content: [String: Any] = [
    "content": message(),
  ]
  let jsonData = try! JSONSerialization.data(withJSONObject: content, options: [])
  let semaphore = DispatchSemaphore(value: 0)
  
  let request = createRequest(url: url, body: jsonData)
  let task = URLSession.shared.dataTask(with: request) {data, response, error in
    guard let data = data, error == nil else {
      print(error?.localizedDescription ?? "No data")
      semaphore.signal()
      return
    }
    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
    semaphore.signal()
    if let responseJSON = responseJSON as? [String: Any] {
      semaphore.signal()
      print(responseJSON)
    }
    if let response = response as? HTTPURLResponse, response.statusCode == 204 {
      print("Message sent successfully!")
    } else {
      print("Failed to send message")
    }
    semaphore.signal()
  }
  task.resume()
  semaphore.wait()
}

// Main function to execute the webhook request
main()

