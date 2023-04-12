//
//  TableViewController.m
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

#import "TableViewController.h"
#import "CoreDataManager.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) CoreDataManager *dataManager;
@property (strong, nonatomic) NSArray *itemsData;
@property (strong, nonatomic) UITableView *table;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureData];
    [self configureTableView];
    
    [self setTitle: @"ToDoList"];
}

- (void)configureData {
    _dataManager = [[CoreDataManager alloc] init];
    [_dataManager removeAllItems];
    [_dataManager createStartedData];
    _itemsData = [_dataManager fetchData];
}

- (void)configureTableView {
    self.table = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self.view addSubview: self.table];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier: cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    cell.textLabel.text =  [[_itemsData objectAtIndex: indexPath.row] text];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemsData.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"title of cell %@", [_itemsData objectAtIndex: indexPath.row]);
}


@end
