//
//  main.m
//  Objective-C Playground
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;

-(instancetype)initWithFirstName:(NSString *)aName;

@end

@implementation Person

- (instancetype)initWithFirstName:(NSString *)aName
{
    self = [super init];
    if (self) {
        _firstName = aName.copy;
    }
    return self;
}

@end





void pointerTest() {
    printf("\n\n\n\n\n");
    
    char *message = "Hello xxxxxxxxxxxxx!";
    
    printf("message pointer: %p\n", message);
    printf("message: %s\n", message);
    
    unsigned long length = strlen(message) + 1;
    char *pointer = malloc(sizeof(char) * length);
    pointer = strcpy(pointer, message); //string copy
    
    pointer[6] = 'D';
    *(pointer + 7) = 'o';
    *(pointer + 8) = 'n';
    pointer[9] = 'g';
    pointer[10] = 'w';
    pointer[11] = 'o';
    pointer[12] = 'o';
    pointer[13] = '!';
    pointer[14] = '\0';
    
    printf("message: %s\n", pointer);
    
    free(pointer);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
//primitives - reference type (Object types)
        pointerTest();
        
        int myInteger = 42;

        int anotherInteger = myInteger;  //becuase it is a copy

        myInteger = 43; //this would not change anotherInteger to 43
         

        int myInteger2 = 42; // 32-bits aka 4-bytes 2^32 combinations possible
        // a bit is either a 0 or a 1
        // a byte is composed of 8 bits
        
        long int aBiggerInt = 42; // 64-bits
        
        unsigned int unsignedInteger = 42; // a sign is -/+
        
        float pi = 3.14; // 32-bits data type
        double tau = 6.28;
         
        char letterA = 65; //man ascii 8-bits, 1-byte
        char anotherLetterA = 65;
        
        char *pointerToAString = "Hello, World!";
        //primitives do not generally require pointer but they could be used maybe(?)
        void *pointerToMyInteger = &myInteger;
        
        char letter = '33';
        
        NSLog(@"The letter for %c is %d", letter, letter);
        
        NSLog(@"%s", pointerToAString);
        
        letter = *(pointerToAString + 6);
        NSLog(@"The letter for %c is %d", letter, letter);
        
        printf("For Loop\n");
        for (int index = 0; index < strlen(pointerToAString); index += 1) {
            letter = *(pointerToAString + index);
            printf("%c's original address is %p (new address is %p)\n", letter, (pointerToAString + index)); //p is pointer c is char i guess
        }
    
        //long vs NSInteger(?)
        
        //Additional primitive types
        //NSInteger
        //NSRange
        
        
        //NSArray *myArrayOfNumbers = [NSArray arrayWithObject:3, 4, 5, 6, nil];
    
        NSNumber *one = [NSNumber numberWithInt:1];
        NSNumber *piObject = [NSNumber numberWithFloat:3.14];
        
        NSNumber *two = @(2);
        NSNumber *three = @(3);
        
        //NSRange
        NSRange myRange = NSMakeRange(0, 5);
        NSValue *myRangeObject = [NSValue valueWithRange:myRange];
        
        NSArray *myArrayOfNumbers = [NSArray arrayWithObjects:one, piObject, two, three, @(4), @(5*2), myRangeObject, nil];
        
        //modern way
        NSArray *myArrayOfNumbersModernWay = @[one, piObject, two, three, @(4), @(5*2), myRangeObject];
        
        NSLog(@"myArrayOfNumbers: %@", myArrayOfNumbers);
        
        NSLog(@"myArrayOfNumbersModernWay: %@", myArrayOfNumbersModernWay);
        
        NSArray *testScores = @[@75, @89, @89.5, @90.];
        
        double sum = 0;
        for (NSInteger index = 0; index < testScores.count; index++) {
            NSNumber *score = [testScores objectAtIndex:index];
            
            sum += score.doubleValue;
        }
        double average = sum / (double) testScores.count; //this will cast
        //integer type and double type can be calculated this way
        NSLog(@"Average is %.2f\n", average);
        
        
        
        NSMutableString *firstName = [[NSMutableString alloc] initWithString:@"Dongwoo"];
        Person *aPerson = [[Person alloc] initWithFirstName:firstName];
        NSLog(@"first name is %@", aPerson.firstName);
        
        [firstName appendString:@" dongwoo"];
        NSLog(@"first name %@", aPerson.firstName);
   
//        NSMutableString *supposedMutableString = aPerson.firstName;
//
//        [supposedMutableString replaceCharactersInRange:NSMakeRange(0, 0) withString:@"silly"];
//        NSLog(@"first name is %@", aPerson.firstName);
        
        
    }
    return 0;
}
