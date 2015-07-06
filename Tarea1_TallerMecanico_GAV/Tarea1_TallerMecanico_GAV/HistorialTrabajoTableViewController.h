//
//  HistorialTrabajoTableViewController.h
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/4/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomHistorialTableViewCell.h"

@interface HistorialTrabajoTableViewController : UITableViewController{
    
    
    NSArray *autoObjects ;
    int *MontoTotal;

    CustomHistorialTableViewCell *customCell;
    
    
}


@property (strong, nonatomic) IBOutlet CustomHistorialTableViewCell *customCell;
@property (strong, nonatomic) IBOutlet NSArray *autoObjects;

@end
