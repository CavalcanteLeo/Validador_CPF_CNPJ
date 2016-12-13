//
//  DocumentValidation.h
//  Exemplo
//
//  Created by Guilherme Machado on 12/12/16.
//  Copyright © 2016 G2M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DocumentStatus.h"

@interface DocumentValidation : NSObject

@property (nonatomic) BOOL success;
@property (nonatomic) DocumentStatus *status;

-(DocumentValidation *)init:(BOOL)success status:(DocumentStatus *)status;

@end
