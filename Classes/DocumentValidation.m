//
//  DocumentValidation.m
//  Exemplo
//
//  Created by Guilherme Machado on 12/12/16.
//  Copyright © 2016 G2M. All rights reserved.
//

#import "DocumentValidation.h"

@implementation DocumentValidation

-(DocumentValidation *)init:(BOOL)success status:(DocumentStatus *)status {
    
    DocumentValidation *validation = [DocumentValidation new];
    
    validation.success = success;
    
    validation.status = status;
    
    return validation;
    
}

@end
