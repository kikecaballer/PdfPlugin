/*
 Phonegap Pdf Plugin
 */
#import "PdfPlugin.h"
#import <Cordova/CDVAvailability.h>

@implementation PdfPlugin

- (void) create:(CDVInvokedUrlCommand*)command {
    
    NSString *data = [command argumentAtIndex:0];
    
    [self setData:data withName:@"Zenquest"];
    
    // Create an object with a simple success property.
    NSDictionary *jsonObj = [ [NSDictionary alloc] initWithObjectsAndKeys :@"true", @"success",nil];
    
    CDVPluginResult *pluginResult = [ CDVPluginResult resultWithStatus    : CDVCommandStatus_OK messageAsDictionary : jsonObj];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

#pragma mark - Util_Methods

- (void)setData:(NSString *)fileData withName:(NSString *)name{
    NSString *pathForPDF = [NSString stringWithFormat:@"~/Documents/%@.pdf", name];
    
    self.PDFCreator = [NDHTMLtoPDF createPDFWithHTML:fileData pathForPDF:[pathForPDF stringByExpandingTildeInPath] pageSize:kPaperSizeA4 margins:UIEdgeInsetsMake(10, 5, 10, 5) successBlock:^(NDHTMLtoPDF *htmlToPDF) {
        NSLog(@"HTMLtoPDF did succeed (%@ / %@)", htmlToPDF, htmlToPDF.PDFpath);
        
    } errorBlock:^(NDHTMLtoPDF *htmlToPDF) {
        NSLog(@"HTMLtoPDF did fail (%@)", htmlToPDF);
    }];

//    self.PDFCreator = [NDHTMLtoPDF createPDFWithHTML:fileData pathForPDF:[@"~/Documents/ZenQuest.pdf" stringByExpandingTildeInPath] delegate:self pageSize:kPaperSizeA4 margins:UIEdgeInsetsMake(10, 5, 10, 5) successBlock:^(NDHTMLtoPDF *htmlToPDF) {
//        NSLog(@"HTMLtoPDF did succeed (%@ / %@)", htmlToPDF, htmlToPDF.PDFpath);
//    } errorBlock:^(NDHTMLtoPDF *htmlToPDF) {
//        NSLog(@"HTMLtoPDF did fail (%@)", htmlToPDF);
//    }];
    

}

@end