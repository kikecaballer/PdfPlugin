/*
 Phonegap PDF Plugin
 
 MIT Licensed
 */

#import <Cordova/CDVPlugin.h>
#import "NDHTMLtoPDF.h"


@interface PdfPlugin : CDVPlugin <NDHTMLtoPDFDelegate>

- (void) create:(CDVInvokedUrlCommand*)command;

#pragma mark - Util_Methods

- (void) setData:(NSString *)fileData withName:(NSString *)name;

@property (nonatomic, strong) NDHTMLtoPDF *PDFCreator;

@end