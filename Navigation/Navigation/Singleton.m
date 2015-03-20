//
//  Alfabeto.m
//  Navigation
//
//  Created by Orleans Klaus on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Singleton.h"
//#import <Realm/Realm.h>
#import "ProcuraTableViewController.h"

@implementation Singleton

static Singleton *instancia = nil;
static bool isFirstAccess = YES;

+(id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        instancia = [[super allocWithZone:NULL] init];
        });
    return instancia;
}

+(NSMutableArray *)palavrasDicionario;
{
    return @[@"Amor",@"Bota",@"Carro",@"Dado",@"Escola",@"Foca",@"Gato",@"Higiene",@"Igreja",@"Jaca",@"Kiwi",@"Laranja",@"Macaco",@"Navio",@"Ovo",@"Pato",@"Queijo",@"Rua",@"Selo",@"Telha",@"Uva",@"Voz",@"Xadrez",@"Zebra"];
}

-(void)trocaPalavra:(NSString *)palavra atIndex:(NSInteger)index
{
    NSString *aux = [palavra substringFromIndex:[palavra length] - ([palavra length] - 1)];
    [self.palavrasDicionario replaceObjectAtIndex:index withObject:aux];
}

+(id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+(id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+(id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[Singleton alloc] init];
}

- (id)mutableCopy
{
    return [[Singleton alloc] init];
}

- (id)init
{
    if(instancia){
        return instancia;
        }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
//    if (self) {
        self.alphabet = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    
    self.palavrasDicionario = [[NSMutableArray alloc] initWithObjects:@"Amor",@"Bota",@"Carro",@"Dado",@"Escola",@"Foca",@"Gato",@"Higiene",@"Igreja",@"Jaca",@"Kiwi",@"Laranja",@"Macaco",@"Navio",@"Ovo",@"Pato",@"Queijo",@"Rua",@"Selo",@"Telha",@"Uva",@"Voz",@"Xadrez",@"Zebra", nil];

//        self.images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"anta.jpg"], [UIImage imageNamed:@"bruxa.jpg"], [UIImage imageNamed:@"carro.jpg"], [UIImage imageNamed:@"dedo.jpg"], [UIImage imageNamed:@"espada.jpg"], [UIImage imageNamed:@"flecha.jpg"], [UIImage imageNamed:@"gamba.jpg"], [UIImage imageNamed:@"horta.jpg"], [UIImage imageNamed:@"indio.jpg"], [UIImage imageNamed:@"jacare.jpg"], [UIImage imageNamed:@"karate.jpg"], [UIImage imageNamed:@"labios.jpg"], [UIImage imageNamed:@"macaco.jpg"], [UIImage imageNamed:@"ninja.png"], [UIImage imageNamed:@"operario.png"], [UIImage imageNamed:@"patrao.jpg"], [UIImage imageNamed:@"quadro.jpg"], [UIImage imageNamed:@"rico.jpg"], [UIImage imageNamed:@"sabia.jpg"], [UIImage imageNamed:@"tv.jpg"], [UIImage imageNamed:@"urubu.jpg"], [UIImage imageNamed:@"vinho.jpg"], [UIImage imageNamed:@"wilson.jpg"], [UIImage imageNamed:@"xicara.jpg"], [UIImage imageNamed:@"yakult.png"], [UIImage imageNamed:@"zebra.jpg"], nil];
//        }
    return self;
}

@end
