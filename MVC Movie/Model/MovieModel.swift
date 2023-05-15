import Foundation

struct Movie: Codable {
    let items: [Item]
    let errorMessage: String?
}

struct Item: Codable {
    let id, rank, title: String?
    let image: String?
    let weekend, gross, weeks: String?
}
