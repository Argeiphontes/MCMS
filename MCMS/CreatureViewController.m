//
//  CreatureViewController.m
//  MCMS
//
//  Created by Christopher on 10/7/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property BOOL editMode;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CreatureViewController

- (IBAction)onEditButtonPushed:(UIBarButtonItem*)sender {

        if (self.editMode == NO) {
            sender.title = @"Edit";
            [self.textField setHidden:NO];

        }  else  {
            sender.title = @"Done";
            [self.textField setHidden:YES];

        }
        self.editMode = !self.editMode;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.mcreature.name;
    self.editMode = NO;
    [self.textField setHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
