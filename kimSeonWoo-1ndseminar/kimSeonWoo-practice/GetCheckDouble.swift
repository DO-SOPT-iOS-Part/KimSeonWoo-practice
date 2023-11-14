import Foundation

class GetCheckDouble {
    static let shared = GetCheckDouble()
    private init() {}
    
    func makeRequest(userName: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196:8080/api/v1/members/check?username=\(userName)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        print("리쿠퀘스트\(request) 입니다")
        return request
    }
    
    func PostRegisterData(userName: String) async throws -> UserNameCheckDataModel? {
        do {
            let request = self.makeRequest(userName: userName)
            let (data, response) = try await URLSession.shared.data(for: request)
            print("😎😎😎")
            dump(request)
            print("😎😎😎")
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            print("data는 이것입니다\(data)")
            return parseUserNameData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseUserNameData(data: Data) -> UserNameCheckDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(UserNameCheckDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
