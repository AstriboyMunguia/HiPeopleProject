//
//  APIClient.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 28/07/24.
//

import Alamofire

class ApiService {
    static let shared = ApiService()
    private let baseURL = "https://randomuser.me/api"

    func fetchUsers(page: Int, resultsPerPage: Int, completion: @escaping (Swift.Result<HiPeople, Error>) -> Void) {
        let url = "\(baseURL)?results=\(resultsPerPage)&page=\(page)&seed=smartstc&nat=ES"
        AF.request(url).responseDecodable(of: HiPeople.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
