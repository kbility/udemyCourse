/**
 * @description       : calculates the BMI and Pace of a person
 * @author            : kbility
 * @group             : 
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


public with sharing class Fitness {

    /**
    * @description Calculates the BMI of the person using their weight and height
    * @author kbility
    * @param weight (should be in kg)
    * @param height (should be in meters (m) - i.e. 1 meter = 3.28 inches
    * @return Decimal - the BMI of the person
    **/
    public static Decimal calculateBMI(Decimal weight, Decimal height) {
        if (weight < 0 || height <= 0) {
            return -1;
        } else {
            Decimal bmi = weight / (height * height);
            return bmi.setScale(2);
        }
    }

    /**
    * @description calculates the pace of the person using their distance and minutes
    * @author kbility
    * @param distance (should be in km)
    * @param minutes (should be in minutes (min) - i.e. 1 minute = 60 seconds
    * @param minutes 
    * @return Decimal 
    **/
    public static Decimal calculatePace(Decimal distance, Decimal minutes) {

        if (distance < 0 || minutes <= 0) {
            return -1;
        }

        Decimal hr = minutes/60;
        Decimal pace = distance / hr;
        return pace.setScale(2);
    }


    
}