//
//  EmployeesInteractor.swift
//  AvitoTechIOS
//
//  Created by tasya on 09.09.2021.
//

import UIKit

protocol EmployeeInteractorProtocol: class {
    var employeesData: CompanyModel? {get set}
    func loadDataFromJson()
}

class EmployeesInteractor: EmployeeInteractorProtocol {

    weak var presenter: EmployeesPresenterProtocol!
    
    var networkService: EmployeeServiceProtocol
    
    var employeesData: CompanyModel?
    
    init(networkService: EmployeeServiceProtocol) {
        self.networkService = networkService
    }
    
    func loadDataFromJson() {
        networkService.loadData { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.employeesData = data
                    guard let data = self.employeesData else { return }
                    self.presenter.receiveData(dataViewModel: CompanyModel(company: data.company))
                case .failure(let error):
                    self.presenter.didReceive(error: error)
                }
            }
        }
    }
}
