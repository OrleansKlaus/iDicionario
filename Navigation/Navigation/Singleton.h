//
//  Alfabeto.h
//  Navigation
//
//  Created by Orleans Klaus on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <Realm/Realm.h>

@interface Singleton : NSObject

@property (nonatomic, strong) NSMutableArray *palavrasDicionario;
@property (nonatomic, strong) NSMutableArray *alphabet;

-(void)trocaPalavra:(NSString *)palavra atIndex:(NSInteger)index;
+(Singleton* ) instance;

@end
