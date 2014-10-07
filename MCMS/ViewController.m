//
//  ViewController.m
//  MCMS
//
//  Created by Christopher on 10/7/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITabBarDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textFieldText;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *krakenCreature = [[MagicalCreature alloc]init];
    krakenCreature.name = @"Kraken";
    MagicalCreature *hydraCreature = [[MagicalCreature alloc] init];
    hydraCreature.name = @"Hydra";
    MagicalCreature *cerberusCreature = [[MagicalCreature alloc] init];
    cerberusCreature.name = @"Cerberus";


    self.creatures = [NSMutableArray arrayWithObjects: krakenCreature, hydraCreature, cerberusCreature,nil];
}


# pragma mark - TableViewDelegate Methods
- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellBoxID" forIndexPath:indexPath];

    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];

    cell.textLabel.text = creature.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

# pragma mark - Buttons
- (IBAction)onAddButtonPressed:(id)sender {
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName: [NSString stringWithFormat:@"%@", self.textFieldText.text]];

    [self.creatures addObject:newCreature];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreatureViewController *creatureController = segue.destinationViewController; // instantiate Controller and attach to desitination view controller segue
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow]; // grabs index path that was touched
    creatureController.mcreature = [self.creatures objectAtIndex:ip.row]; // grab creature using row number as index, and pass to mcreature forward
}
//
//    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//        EnterAdjectiveViewController *enterName = segue.destinationViewController;
//        enterName.name = self.nameTextField.text;



@end
