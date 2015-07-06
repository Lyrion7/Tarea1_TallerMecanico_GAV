//
//  CustomHistorialTableViewCell.h
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/5/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHistorialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_InfoReparacionAuto;


@property (weak, nonatomic) IBOutlet UILabel *lblMonto;
@property (weak, nonatomic) IBOutlet UILabel *lblAutoMarca;
@property (weak, nonatomic) IBOutlet UILabel *lblAutoModelo;

@end
