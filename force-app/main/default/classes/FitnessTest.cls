/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class FitnessTest {


    @isTest
    public static void test1CalculateBMI() {
        Decimal weight  = 60;
        Decimal height = 1.2;
        Decimal bmi = Fitness.calculateBMI(weight, height);
        Assert.areEqual(41.67, bmi, 'BMI should be 41.67');
    }
    @isTest
    public static void test2CalculateBMI(){
        Decimal weight  = 0;
        Decimal height = 1.2;
        Decimal bmi = Fitness.calculateBMI(weight, height);
        Assert.areEqual(0, bmi, 'BMI should be 0 for 0kg and 1.2 meter height');
    }
    @isTest
    public static void test3CalculateBMI(){
        Decimal weight  = 60;
        Decimal height = 0;
        Decimal bmi = Fitness.calculateBMI(weight, height);
        Assert.areEqual(-1, bmi, 'Invalid input');
    }
    @isTest
    public static void test4CalculateBMI(){
        Decimal weight  = -60;
        Decimal height = 1.2;
        Decimal bmi = Fitness.calculateBMI(weight, height);
        Assert.areEqual(-1, bmi, 'Invalid input');
    }
    
    @IsTest
    public static void test5CalculateBMI(){
        Decimal weight  = 60;
        Decimal height = -1.2;
        Decimal bmi = Fitness.calculateBMI(weight, height);
        Assert.areEqual(-1, bmi, 'Invalid input');

    }

    @isTest
    public static void test1CalculatePace() {
        Decimal pace = Fitness.calculatePace(10, 60);
        System.assertEquals(pace, 10, 'Pace should be 10');
    }
    @isTest
    public static void test2CalculatePace() {
        Decimal pace = Fitness.calculatePace(-10, 25);
        System.Assert.areEqual(pace, -1, 'Invalid input');
    }
    @isTest
    public static void test3CalculatePace() {
        Decimal pace = Fitness.calculatePace(10, -25);
        System.Assert.areEqual(pace, -1, 'Invalid input');
    }
    @isTest
    public static void test4CalculatePace() {
        Decimal pace = Fitness.calculatePace(-10, -25);
        System.Assert.areEqual(pace, -1, 'Invalid input');
    }
    @isTest
    public static void test5CalculatePace() {
        Decimal pace = Fitness.calculatePace(0, 25);
        System.Assert.areEqual(pace, 0, 'Invalid input');
    }
}