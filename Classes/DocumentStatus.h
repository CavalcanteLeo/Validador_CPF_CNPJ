//
//  DocumentError.h
//  Exemplo
//
//  Created by Guilherme Machado on 12/12/16.
//  Copyright © 2016 G2M. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    InvalidNumberOfCharacters,
    Sequence,
    Invalid,
    Success
} ValidationStatus;

@interface DocumentStatus : NSObject

@property (nonatomic) ValidationStatus *status;
@property (nonatomic) NSString *textDescription;

-(DocumentStatus *)init:(ValidationStatus)status description:(NSString *)textDescription;

@end
