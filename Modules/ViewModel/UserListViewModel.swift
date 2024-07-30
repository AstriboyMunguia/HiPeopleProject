//
//  UserListViewModel.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 28/07/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [Result] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiService = ApiService.shared
    private var currentPage = 1
    private let resultsPerPage = 10
    private var allUsers: [Result] = []
    private var hasMorePages = true
    
    func fetchUsers() {
        guard !isLoading, hasMorePages else { return }
        isLoading = true
        apiService.fetchUsers(page: currentPage, resultsPerPage: resultsPerPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let data):
                    if data.results.isEmpty {
                        self?.hasMorePages = false
                    } else {
                        self?.allUsers.append(contentsOf: data.results)
                        self?.currentPage += 1
                        self?.updateDisplayedUsers()
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    private func updateDisplayedUsers() {
        let shuffledUsers = allUsers.shuffled()
        let numberOfUsersToShow = min(resultsPerPage, shuffledUsers.count)
        self.users = Array(shuffledUsers.prefix(numberOfUsersToShow))
    }
    
    func loadMoreUsersIfNeeded(currentUser: Result?) {
        guard let currentUser = currentUser else { return }
        if currentUser == users.last {
            fetchUsers()
        }
    }
}
