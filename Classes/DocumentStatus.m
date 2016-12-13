//
//  DocumentError.m
//  Exemplo
//
//  Created by Guilherme Machado on 12/12/16.
//  Copyright © 2016 G2M. All rights reserved.
//

#import "DocumentStatus.h"

@implementation DocumentStatus

-(DocumentStatus *)init:(ValidationStatus)status description:(NSString *)textDescription {
    
    DocumentStatus *error = [DocumentStatus new];
    
    error.status = status;
    
    error.textDescription = textDescription;
    
    return error;
    
}

@end
