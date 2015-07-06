//
//  HistorialTrabajoTableViewController.m
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/4/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import "HistorialTrabajoTableViewController.h"
#import <Parse/Parse.h>
#import "CustomHistorialTableViewCell.h"
#import "Auto.h"
#import "DejalActivityView.h"

static NSString* CELL_IDENTIFIER =@"CustomHistorialTableViewCell";
static int NUMBER_SECTION =1;
NSArray *ListaAutos;


@interface HistorialTrabajoTableViewController ()

@end

@implementation HistorialTrabajoTableViewController
@synthesize customCell;
@synthesize autoObjects;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCustomCellInTableView];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Auto"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            autoObjects = objects;
            [self.tableView reloadData];
            
            NSString *MontoTotalReparacion = [NSString stringWithFormat:@"%d", MontoTotal];
            
           // self.Monto.text = MontoTotalReparacion;
          
           
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -OTHER METHODS
-(void)registerCustomCellInTableView{
    UINib *nib = [UINib nibWithNibName:CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_IDENTIFIER];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return NUMBER_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
        return autoObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    
    
    
    CustomHistorialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    NSArray *autosArray = autoObjects;
    PFObject *autoObject = [autosArray objectAtIndex:indexPath.row];
    
    MontoTotal = MontoTotal + [autoObject[@"Monto"] intValue] ;
    
    cell.lbl_InfoReparacionAuto.text = autoObject[@"Propietario"];
   cell.lblAutoMarca.text = autoObject[@"Marca"];
    cell.lblAutoModelo.text = autoObject[@"Modelo"];
   cell.lblMonto.text = autoObject[@"Monto"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
