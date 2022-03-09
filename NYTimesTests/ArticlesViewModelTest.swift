//
//  ArticlesViewModelTest.swift
//  NYTimesTests
//
//  Created by Mahmoud Farag on 3/9/22.

//

import XCTest
import RxTest
import RxSwift
import RxBlocking

@testable import NYTimes

class TestClientAPI: ClientAPIType {
    var numberOfCalls = 0
    func getArticlesList(numOfDays: Days, completion: @escaping ([Article]) -> Void) {
        numberOfCalls += 1
        completion([])
    }
}

class ArticlesViewModelTest: XCTestCase {

    var viewModel: ArticleViewModel!
    let apiClient = TestClientAPI()
    
    override func setUp() {
        super.setUp()
        viewModel = ArticleViewModel(clientAPI: apiClient)
    }

    override func tearDown() {
         super.tearDown()
    }

    func testInit() {
        XCTAssertEqual(1, apiClient.numberOfCalls)
    }
    
    
    func testRefreshing() {
        viewModel.shouldRefresh.publish()
        try! viewModel.articles.toBlocking().last()
        XCTAssertEqual(2, apiClient.numberOfCalls)
    }

    

  
}
