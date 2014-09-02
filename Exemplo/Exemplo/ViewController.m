//
//  ViewController.m
//  Validate_CPF_CNPJ
//
//  Created by Guilherme Machado on 02/09/14.
//  Copyright (c) 2014 G2M. All rights reserved.
//

#import "ViewController.h"
#import "Validador_CPF_CNPJ.h"

@interface ViewController ()

- (IBAction)alterarDocumento:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *UISegmentedControl_TipoDocumento;
@property (weak, nonatomic) IBOutlet UIPickerView *UIPickerView_Opcoes;
@property (weak, nonatomic) IBOutlet UITextField *UITextField_Documento;
- (IBAction)validarDocumento:(UIButton *)sender;

@property (nonatomic) NSArray *listaOpcoes;
@property (nonatomic) NSArray *listaCPF;
@property (nonatomic) NSArray *listaCNPJ;

@property (nonatomic) Validador_CPF_CNPJ *validador;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.listaOpcoes = @[@"Válido",
                         @"Inválido",
                         @"Sequência de números",
                         @"Quantidade errada"];
    
    
    self.listaCPF = @[@"32657576176",
                      @"32657573173",
                      @"11111111111",
                      @"128386"];
    
    self.listaCNPJ = @[@"82852967000166",
                       @"82852237000166",
                       @"11111111111111",
                       @"128382631235"];
    
    [self pickerView:self.UIPickerView_Opcoes didSelectRow:[self.UIPickerView_Opcoes selectedRowInComponent:0] inComponent:0];
    
    self.validador = [Validador_CPF_CNPJ new];
    
}

- (IBAction)alterarDocumento:(UISegmentedControl *)sender {
    
    [self pickerView:self.UIPickerView_Opcoes didSelectRow:[self.UIPickerView_Opcoes selectedRowInComponent:0] inComponent:0];
    
}

- (IBAction)validarDocumento:(UIButton *)sender {
    
    NSDictionary *retorno = [NSDictionary new];
    
    if (self.UISegmentedControl_TipoDocumento.selectedSegmentIndex == 0) {
        retorno = [self.validador validarCPF:self.UITextField_Documento.text];
    }
    else {
        retorno = [self.validador validarCNPJ:self.UITextField_Documento.text];
    }
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:nil
                                                     message:nil
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil, nil];
    if (retorno != nil) {
        [alerta setMessage:[NSString stringWithFormat:@"%@",[retorno valueForKey:@"mensagem"]]];
    }
    else {
        [alerta setMessage:@"Válido"];
    }
    
    [alerta show];
    
}

#pragma mark - UIPickerViewDelegate && UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.listaOpcoes count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.listaOpcoes objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.UISegmentedControl_TipoDocumento.selectedSegmentIndex == 0) {
        self.UITextField_Documento.text = [self.listaCPF objectAtIndex:row];
    }
    else {
        self.UITextField_Documento.text = [self.listaCNPJ objectAtIndex:row];
    }
    
}


@end
