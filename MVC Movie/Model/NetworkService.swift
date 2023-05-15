import Foundation

protocol MovieProtocol {
    static func getResults(completionHandler: @escaping (Movie?) -> Void)
}

class NetworkService: MovieProtocol {
    static func getResults(completionHandler: @escaping (Movie?) -> Void) {
        let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_iw4s8qct")
        guard let newUrl = url else { return }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                completionHandler(movie)
            } catch {
                print("Error decoding movie data:", error)
                completionHandler(nil)
            }
        }
        task.resume()
    }
}
