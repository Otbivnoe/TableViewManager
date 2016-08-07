//: Playground - noun: a place where people can play

import UIKit

protocol NUIViewModelBindingProtocol {
    associatedtype T
    func configurateBy(viewModel: T)
}


protocol NUITableViewCellItemProtocol {
    
    
}

protocol NUIHeightConfigurator {
    func configureHeightBy(tableView: UITableView, indexPath: NSIndexPath, viewModel: AnyObject) -> Float
}




class NUITableViewManager: NSObject {
    
    init(tableView: UITableView) {

        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension NUITableViewManager : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension NUITableViewManager: UITableViewDelegate {
    
}




class TestCell: UITableViewCell, NUIViewModelBindingProtocol {
    
    typealias T = SomeViewModel
    
    func configurateBy(viewModel: T) {
        
    }
}

class NUITableViewCellITem<CellType: NUIViewModelBindingProtocol, ViewModelType where CellType: UITableViewCell, CellType.T == ViewModelType>: NUITableViewCellItemProtocol {
    
    init(heightConfigurator: NUIHeightConfigurator, viewModel: ViewModelType) {
        
    }
    
    init(heigh: Float, viewModel: ViewModelType) {
        
    }
    
}

class SomeViewModel {
    
}

let cell = TestCell()
let viewModel = SomeViewModel()


let cellItem = NUITableViewCellITem<TestCell, SomeViewModel>(heigh: 20, viewModel: viewModel)

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)didSelectInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;
- (void)registerCellForTableView:(UITableView *)tableView;

@optional
- (void)willDisplayCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;
 */