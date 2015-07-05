//
//  main.c
//  MyFirstProgram
//
//  Created by Vajira on 4/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#include <stdio.h>

//Declaration
void calculateTaxAmount(double income);
void calculateTaxAmountwithName(char * name, double income);
float getTemperatureInFarenheit(float value);

int main(int argc, const char * argv[]) {
    
    double income = 200000;
    float taxRate = 0.09;
    double taxAmount = income * taxRate;
    
    printf("Tax amount to be paid is %.2lf\n", taxAmount);
    
    //Function
    
    double alanIncome = 120000;
    double vajiraIncome = 130000;
    double yarbinIncome = 500000;
    double roshanIncome = 20000;
    double sanatIncome = 32000;
 
    calculateTaxAmount(alanIncome);
    calculateTaxAmount(vajiraIncome);
    calculateTaxAmount(yarbinIncome);
    calculateTaxAmount(roshanIncome);
    calculateTaxAmount(sanatIncome);
    
    
    calculateTaxAmountwithName("Alan", alanIncome);
    calculateTaxAmountwithName("Vajira", vajiraIncome);
    calculateTaxAmountwithName("Yarbin", yarbinIncome);
    calculateTaxAmountwithName("Roshan", roshanIncome);
    calculateTaxAmountwithName("Sanat", sanatIncome);

    
    //Excercise
    float result = getTemperatureInFarenheit(1);
    printf("The result is %.2f\n", result);
    
    
    return 0;
}


void calculateTaxAmount(double income) {
    float taxRate = 0.09;
    double taxAmount = income * taxRate;
    
    printf("Tax amount to be paid is %.2lf\n", taxAmount);
}


void calculateTaxAmountwithName(char * name, double income) {
    float taxRate = 0.09;
    double taxAmount = income * taxRate;
    
    printf("Tax amount to be paid is %.2lf for %s\n", taxAmount, name);
}


float getTemperatureInFarenheit(float celsiusValue){
    return celsiusValue*1.8 + 32.0;
}


