//
//  ProcuraTableViewController.m
//  Navigation
//
//  Created by Orleans Klaus on 20/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ProcuraTableViewController.h"
#import "Singleton.h"
#import "PalavraUITableViewCell.h"

@interface ProcuraTableViewController ()

@end

@implementation ProcuraTableViewController
{
    Singleton *dicionario;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dicionario = [Singleton instance];

    UINib *nib = [UINib nibWithNibName:@"Palavra" bundle:nil];
    [self.tabela registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tabela reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return dicionario.palavrasDicionario.count + 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PalavraUITableViewCell *cell = [self.tabela dequeueReusableCellWithIdentifier:@"celulaPadrao" forIndexPath:indexPath];
    if (indexPath.row < 26) {

        cell.Letra.text = [dicionario.alphabet objectAtIndex:indexPath.row];
        cell.Word.text = [dicionario.palavrasDicionario objectAtIndex:indexPath.row];
        }
    else {
        cell.Letra.text = @" ";
        cell.Word.text = @" ";
        }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
