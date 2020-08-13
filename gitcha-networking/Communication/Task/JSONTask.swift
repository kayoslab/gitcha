import Foundation

public protocol JSONTask: Task where SuccessType: Decodable, ErrorType: Decodable { }

public extension JSONTask {

    func execute(handler: @escaping Handler) {
        guard let dispatcher = Networking.dispatcher else {
            return handler(.failure(NetworkingError(type: .networkingUnconfigured)))
        }

        do {
            try dispatcher.execute(request: request) {
                self.handleResponse(withResponse: $0, handler: handler)
            }
        } catch {
            return handler(.failure(NetworkingError(type: .badInput)))
        }
    }

    private func handleResponse(withResponse response: Response, handler: @escaping Handler) {
        let decoder = JSONDecoder()

        decoder.dateDecodingStrategy = .formatted(DateFormatter.github)
        decoder.dataDecodingStrategy = .base64
        decoder.nonConformingFloatDecodingStrategy = .throw
        decoder.keyDecodingStrategy = .useDefaultKeys

        switch response {
        case .success(let data):
            guard let data = data else {
                return handler(.failure(NetworkingError(type: .badInput)))
            }

            do {
                let decoded = try decoder.decode(SuccessType.self, from: data)
                return handler(.success(decoded))
            } catch {
                guard let errorModel = try? decoder.decode(ErrorType.self, from: data) else {
                    return handler(.failure(NetworkingError(type: .badResult)))
                }
                return handler(.failure(NetworkingError(error: error, errorModel: errorModel)))
            }
        case .failure(let error):
            guard
                let data = error.data,
                let errorModel = try? decoder.decode(ErrorType.self, from: data)
            else {
                return handler(.failure(error))
            }
            return handler(.failure(NetworkingError(error: error, errorModel: errorModel)))
        }
    }
}
