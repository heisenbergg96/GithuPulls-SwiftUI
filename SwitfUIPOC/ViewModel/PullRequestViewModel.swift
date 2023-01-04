//
//  PullRequestViewModel.swift
//  GithubPulls
//
//  Created by Vikhyath Shetty on 19/08/22.
//

import Foundation

enum APIState: Equatable {
    case success
    case failure(String)
    case empty
    case loading
    case none
}

class PullRequestViewModel: ObservableObject {
    
    @Published private(set) var pullRequest: [PullRequest] = []
    
    private(set) var state: APIState = .loading
    private let networkService: NetworkService
    
    var pageNumber = 0
    
    init(pulls: [PullRequest] = [], state: APIState = .loading, service: NetworkService = DefaultNetworkService()) {
        self.pullRequest = pulls
        self.state = state
        self.networkService = service
    }
    
    func isLastRow(row: PullRequest) -> Bool {
        
        if pullRequest.last == row {
            
            return true
        }
        
        return false
    }
    
    func fetchPulls() {
        
        
        pageNumber += 1
        
        
        let request = PRListRequest(params: [
            "state" : "closed",
            "page": "\(pageNumber)",
            "per_page": "\(50)"
        ])
        
        networkService.request(request) { [weak self] result in
            
            switch result {
                
            case .success(let model):
                dump(model)
                DispatchQueue.main.async {
                    self?.pullRequest.append(contentsOf: model)
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
    func numberOfItems() -> Int {
        return pullRequest.count
    }
    
    func itemAtIndexPath(indexPath: IndexPath) -> PullRequest {
        return pullRequest[indexPath.row]
    }
    
    func updateDataSource(model: PullRequestViewModel) {
        
        pullRequest.append(contentsOf: model.pullRequest)
        self.state = model.state
    }
}



