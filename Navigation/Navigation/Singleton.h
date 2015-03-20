//
//  Alfabeto.h
//  Navigation
//
//  Created by Orleans Klaus on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+(NSArray *) palavrasDicionario;
+(Singleton* ) instance;

@end
