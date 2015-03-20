//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"
#import "Palavras.h"

@implementation LetraViewController
{
    UILabel *letraLabel;
    UIImageView *imageView;
    NSArray *palavrasDicionario;
}
@synthesize  telaSucessora, telaPredecessora;

int indiceTela;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    telaSucessora = [[LetraViewController alloc]init];
    telaPredecessora = [[LetraViewController alloc]init];
    
// botao para controlar a tela sucessora
    UIBarButtonItem *sucessora = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(proximaTela:)];
    self.navigationItem.rightBarButtonItem=sucessora;
    
// botao para controlar a tela predecessora
    UIBarButtonItem *predecessora = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(telaAnterior:)];
    self.navigationItem.leftBarButtonItem=predecessora;
    
// recuperando as palavras da classe
    palavrasDicionario = [Palavras palavrasDicionario];
    
// criando a label para a palavra
    double tamanho = (self.view.frame.size.width)/2.3;
    letraLabel = [[UILabel alloc] initWithFrame:CGRectMake(tamanho, self.view.center.x, tamanho, 30.0)];
    [self.view addSubview:letraLabel];
    
// criando a imagem
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-75, self.view.center.y-025, 125, 125)];
    [self.view addSubview:imageView];
}

-(void)proximaTela:(id)sender
{
    if (indiceTela == palavrasDicionario.count -1)
    {
        LetraViewController.indiceTela = 0;
    }else{
        LetraViewController.indiceTela = ++indiceTela;
    }
    telaSucessora.telaPredecessora = self;
    [self.navigationController pushViewController:telaSucessora animated:YES];
}

-(void)telaAnterior:(id)sender
{
    if (indiceTela == 0)
    {
        indiceTela = 23;
        LetraViewController.indiceTela = indiceTela;
    }else
    {
        LetraViewController.indiceTela = --indiceTela;
    }
    telaPredecessora.telaSucessora = self;
    [self.navigationController pushViewController:telaPredecessora animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
// toda vez que a tela esta para aparecer, atualiza os dados
    letraLabel.text =[palavrasDicionario objectAtIndex:indiceTela];
    char letra = [letraLabel.text characterAtIndex:0];
    self.title = [NSString stringWithFormat:@"%c",letra];
    imageView.image = [UIImage imageNamed:self.title];
    //imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c",letra]];
}

-(int)indiceTela
{
    return indiceTela;
}

+(void)setIndiceTela:(int)valorIndice
{
    indiceTela = valorIndice;
    NSLog(@"valor: %i ", valorIndice);
}

@end
