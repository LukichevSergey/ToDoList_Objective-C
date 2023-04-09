//
//  TableViewController.m
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

#import "TableViewController.h"
#import "ToDoItem.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView       *table;
@property (strong, nonatomic) NSMutableArray    *data;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self configureData];
    
    [self setTitle: @"ToDoList"];
}

- (void)configureData {
    self.data = [NSMutableArray array];
    
    NSDate *notificationDate1 = [NSDate dateWithTimeIntervalSinceNow:3600]; // оповещение через час
    NSString *text1 = @"Сделать домашнее задание";

    ToDoItem *item1 = [[ToDoItem alloc] initWithText: text1 notificationDate: notificationDate1];
    [_data addObject:item1];

    NSDate *notificationDate2 = [NSDate dateWithTimeIntervalSinceNow:7200]; // оповещение через два часа
    NSString *text2 = @"Пойти в магазин";

    ToDoItem *item2 = [[ToDoItem alloc] initWithText: text2 notificationDate: notificationDate2];
    [_data addObject:item2];
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
    cell.textLabel.text =  [[_data objectAtIndex: indexPath.row] text];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"title of cell %@", [_data objectAtIndex: indexPath.row]);
}


@end
