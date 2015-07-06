//
//  IngresarTrabajoViewController.m
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/4/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import "IngresarTrabajoViewController.h"
 #import <Parse/Parse.h>
#import "DejalActivityView.h"
#import "InicioViewController.h"

@interface IngresarTrabajoViewController ()

@end

@implementation IngresarTrabajoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Evento que se dispara en el momento que un touch inicia en el UIView
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    //Si es un evento de "Touch Began"
    if (touch.phase == UITouchPhaseBegan) {
        //Los textfield toman el mando del hilo principal
        // y el teclado se esconde automáticamente.
        [self.txt_Marca resignFirstResponder];
        [self.txt_Modelo resignFirstResponder];
        [self.txt_Propietario resignFirstResponder];
        [self.txt_Descripcion resignFirstResponder];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_Ingresar:(id)sender {
    
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Saving..."];
    [self performSelector:@selector(SaveTrabajoReparacionAuto) withObject:nil afterDelay:0.2];
    
    PFObject *autoObject = [PFObject objectWithClassName:@"Auto"];
    autoObject[@"Marca"] = self.txt_Marca.text;
    autoObject[@"Modelo"] = self.txt_Modelo.text;
    autoObject[@"Propietario"] = self.txt_Propietario.text;
     autoObject[@"Monto"] = self.txt_Monto.text;

    [autoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
           
            [self VolverInicio];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Ha ocurrido un error al guardar" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil]
            ;
            [alert show];
            [self LimpiarDatos];
            
        }
    }];
    
}


// Metodo que ingresa la informacion del Trabajo a realizar para el auto.
-(void)SaveTrabajoReparacionAuto{
   
    PFObject *reparacionTrabajoAutoObject = [PFObject objectWithClassName:@"TrabajoReparacionAuto"];
    reparacionTrabajoAutoObject[@"Descripcion"] = self.txt_Descripcion.text;
    [reparacionTrabajoAutoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Datos Guardados" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil]
            ;
            [alert show];
            
            [DejalActivityView removeView];

            [self LimpiarDatos];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Ha ocurrido un error al guardar" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil]
            ;
            [alert show];
            [self LimpiarDatos];
        }
    }];
}


-(void)VolverInicio{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    InicioViewController *inicioViewController = [storyboard instantiateViewControllerWithIdentifier:@"nib_Inicio"];
    [self.navigationController pushViewController:inicioViewController animated:YES];

}

// Metodo que limpia los datos de la pantalla
-(void)LimpiarDatos{
    
     self.txt_Marca.text = @"";
     self.txt_Descripcion.text = @"";
     self.txt_Propietario.text = @"";
     self.txt_Modelo.text = @"";
     self.txt_Monto.text = @"";


}

@end
