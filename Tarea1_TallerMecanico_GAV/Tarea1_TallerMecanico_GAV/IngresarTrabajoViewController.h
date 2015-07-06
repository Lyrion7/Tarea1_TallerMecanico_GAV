//
//  IngresarTrabajoViewController.h
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/4/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngresarTrabajoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txt_Marca;

@property (weak, nonatomic) IBOutlet UITextField *txt_Modelo;

@property (weak, nonatomic) IBOutlet UITextField *txt_Propietario;

@property (weak, nonatomic) IBOutlet UITextView *txt_Descripcion;

@property (weak, nonatomic) IBOutlet UITextField *txt_Monto;

- (IBAction)btn_Ingresar:(id)sender;

@end
