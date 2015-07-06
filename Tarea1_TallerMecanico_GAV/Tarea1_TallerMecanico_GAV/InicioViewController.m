//
//  InicioViewController.m
//  Tarea1_TallerMecanico_GAV
//
//  Created by Guillermo Azofeifa on 7/1/15.
//  Copyright (c) 2015 Guillermo Azofeifa. All rights reserved.
//

#import "InicioViewController.h"
#import "IngresarTrabajoViewController.h"
#import "HistorialTrabajoTableViewController.h"


@interface InicioViewController ()

@end

@implementation InicioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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


- (IBAction)btn_Historico:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    HistorialTrabajoTableViewController *historicoRepracionAutoViewController = [storyboard instantiateViewControllerWithIdentifier:@"nib_Historico"];
    [self.navigationController pushViewController:historicoRepracionAutoViewController animated:YES];
}

- (IBAction)btn_IngresoHistorico:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    IngresarTrabajoViewController *ingresarTrabajoViewController = [storyboard instantiateViewControllerWithIdentifier:@"nib_bienvenido"];
    [self.navigationController pushViewController:ingresarTrabajoViewController animated:YES];
}


@end
