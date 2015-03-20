//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"
#import "Singleton.h"

@implementation LetraViewController
{
    Singleton *singleton;
    NSArray *palavrasDicionario;
}
@synthesize imageView, letraLabel, telaSucessora, telaPredecessora, tabBar;

int indiceTela;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    singleton = [Singleton instance];
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
    palavrasDicionario = [Singleton palavrasDicionario];
    
// criando a label para a palavra
    double tamanho = (self.view.frame.size.width)/2.3;
    letraLabel = [[UILabel alloc] initWithFrame:CGRectMake(tamanho, self.view.center.x, tamanho, 30.0)];
    [letraLabel setTextColor:[UIColor blueColor]];
    [self.view addSubview:letraLabel];
    
// criando a imagem
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-75, self.view.center.y-025, 125, 125)];
    //[self addSubviewWithZoomInAnimation:imageView duration:2.0 option:UIViewAnimationOptionCurveLinear];
    [self.view addSubview:imageView];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
// criando a tabbar
    tabBar = [[UITabBar alloc]initWithFrame:CGRectMake(0, 518, 320, 20)];
    UITabBarItem *dictionaryView = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    UITabBarItem *tableView = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    tabBar.items = @[dictionaryView, tableView];
    [tabBar setItems: tabBar.items];
    [tabBar setItemPositioning:UITabBarItemPositioningAutomatic];
    tabBar.barTintColor = [UIColor whiteColor];
    tabBar.barStyle = UIBarStyleBlackOpaque;
//    editBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(editWord)];
//    tabBar.items = @[_editBarButton];
    [self.view addSubview:tabBar];

}

-(void)disparouTap:(UITapGestureRecognizer *)tap
{
    NSLog(@"Tocou");
    self.imageView.backgroundColor = [UIColor yellowColor];
}

-(void)disparouPan:(UIPanGestureRecognizer *)pan
{
    NSLog(@"disparouPan %@", NSStringFromCGPoint([pan locationInView:self.view]));
    // Resgatar a posição do gesto
    CGPoint posicao = [pan locationInView:self.view];
    // Atribuir a posição do gesto a viewzinha
    self.imageView.center = posicao;
}

-(void)disparouSwipe:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"disparouSwipe");
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
    if (indiceTela == 23) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void)telaAnterior:(id)sender
{
    [self.navigationController pushViewController:telaPredecessora animated:NO];
    if (indiceTela == 0)
    {
        indiceTela = 23;
        LetraViewController.indiceTela = indiceTela;
    }else
    {
        LetraViewController.indiceTela = --indiceTela;
    }
    telaPredecessora.telaSucessora = self;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
// toda vez que a tela esta para aparecer, atualiza os dados
    letraLabel.text = [palavrasDicionario objectAtIndex:indiceTela];
    char letra = [letraLabel.text characterAtIndex:0];
    self.title = [NSString stringWithFormat:@"%c",letra];
    imageView.image = [UIImage imageNamed:self.title];
    //imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c",letra]];
    imageView.userInteractionEnabled = YES;
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.view.backgroundColor = [UIColor greenColor];
    [UIView animateWithDuration:1.0 animations:^{
    self.view.backgroundColor = [UIColor whiteColor]; }];
    
    UITouch *toque = [touches anyObject];
    if ([toque.view isEqual:imageView.image]) {
        imageView.image = [UIImage imageNamed:self.title];
    }
    
    // Criar o objeto de gesto
    UITapGestureRecognizer* gestoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disparouTap:)];
    // Customizaço da quantidade de taps necessários
    gestoTap.numberOfTapsRequired = 5;
    // Definir qual objeto irá responder ao gesto
    [self.view addGestureRecognizer:gestoTap];
    UIPanGestureRecognizer* gestoPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(disparouPan:)];
    
    [self.view addGestureRecognizer:gestoPan];
    UISwipeGestureRecognizer* gestoSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(disparouSwipe:)];
    // Propriedade que controla a direção do gesto
    gestoSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:gestoSwipe];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* toque = [touches anyObject];
    
    if ([toque.view isEqual:imageView.image]) {
        CGPoint posicao = [toque locationInView:self.view];
        
        self->imageView.center = posicao;
        
        if (posicao.x > 160.0) {
            self.view.backgroundColor = [UIColor redColor];
        } else {
            self.view.backgroundColor = [UIColor blueColor];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* toque = [touches anyObject];
    
    if ([toque.view isEqual:imageView.image]) {
        imageView.image = [UIImage imageNamed:self.title];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
// Método que executa animações em objetos UIView
    [UIImageView animateWithDuration:1.0 animations:^{
        float x = arc4random() % 100;
        float y = arc4random() % 200;
        imageView.frame = CGRectMake(x, y, 20, 40);
        float xa = 80;
        float ya = 150;
        letraLabel.frame = CGRectMake(xa, ya, 20, 40);
    }];
    
    [UIImageView animateWithDuration:0.5
                          delay:1.0
     // Parâmetro que controla recursos de aceleração
     // UIViewAnimationOptionCurveEaseIn > Acelera durante a animação
     // UIViewAnimationOptionCurveEaseOut > Desacelera durante a animação
     // UIViewAnimationOptionCurveEaseInOut > Acelera e desacelera durante a animação
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self->letraLabel.bounds = CGRectMake(0, 0, 300, 60);
                         self->imageView.backgroundColor = [UIColor whiteColor];
                     }
     // Disparado quando a animação termina
                     completion:^(BOOL finished) {
    }];
}

@end