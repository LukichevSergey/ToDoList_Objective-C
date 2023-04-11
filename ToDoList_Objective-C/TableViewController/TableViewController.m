//
//  TableViewController.m
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

#import "TableViewController.h"
#import "AppDelegate.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;
@property NSArray *itemsData;
@property (strong, nonatomic) UITableView *table;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self configureData];
    
    [self setTitle: @"ToDoList"];
}

- (void)configureData {
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _context = _appDelegate.persistentContainer.viewContext;
    
//    NSManagedObject *item1 = [NSEntityDescription insertNewObjectForEntityForName: @"ToDoItem" inManagedObjectContext: _context];
//    [item1 setValue: @"Купить продукты" forKey: @"text"];
//    [item1 setValue: [NSDate dateWithTimeIntervalSinceNow: 7200] forKey: @"notificationDate"];
//    [item1 setValue: [NSDate date] forKey: @"creationDate"];
//    
//    [_appDelegate saveContext];
//    
//    NSManagedObject *item2 = [NSEntityDescription insertNewObjectForEntityForName: @"ToDoItem" inManagedObjectContext: _context];
//    [item2 setValue: @"Купить подарок" forKey: @"text"];
//    [item2 setValue: [NSDate dateWithTimeIntervalSinceNow: 3600] forKey: @"notificationDate"];
//    [item2 setValue: [NSDate date] forKey: @"creationDate"];
//    
//    [_appDelegate saveContext];
    
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"ToDoItem"];
    _itemsData = [_context executeFetchRequest: requestExamLocation error: nil];
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
