//
//  Alfabeto.m
//  Navigation
//
//  Created by Orleans Klaus on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *instancia;

+(Singleton *) instance{
    if(instancia==nil)
    {
        instancia = [[Singleton alloc] init];
    }
    return instancia;
}

+(NSArray *)palavrasDicionario;
{
    return @[@"Amor",@"Bota",@"Carro",@"Dado",@"Escola",@"Foca",@"Gato",@"Higiene",@"Igreja",@"Jaca",@"Kiwi",@"Laranja",@"Macaco",@"Navio",@"Ovo",@"Pato",@"Queijo",@"Rua",@"Selo",@"Telha",@"Uva",@"Voz",@"Xadrez",@"Zebra"];
}

@end
