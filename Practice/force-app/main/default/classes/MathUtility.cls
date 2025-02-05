//****************************************************************************************************
// @Name  of the Lwc   : MathUtility.cls
// @Description        : class used for Calculaiton of the following operations:
//                          1. Addition
//                          2. Subtraction
//                          3. Multiplication
//                          4. Division
//                          5. Modulus
//                         
// @Author             : Komal
// @Created Date       : 04/02/2025
// ********************************************************************************************** 
//

public with sharing class MathUtility {
    public static Decimal add(Decimal a, Decimal b) {
        return a + b;
    }

    /** Subtraction */
    public static Decimal subtract(Decimal a, Decimal b) {
        return a - b;
    }

    /** Multiplication */
    public static Decimal multiply(Decimal a, Decimal b) {
        return a * b;
    }

    /** Division with zero check */
    public static Decimal divide(Decimal a, Decimal b) {
        if (b == 0) {
            throw new System.MathException('Cannot divide by zero');
        }
        return a / b;
    }

    /** Modulus (handles decimals properly) */
    public static Decimal modulus(Decimal a, Decimal b) {
        if (b == 0) {
            throw new System.MathException('Cannot perform modulus by zero');
        }
        return a - (b * (a.divide(b, 0, System.RoundingMode.FLOOR)));
    }
    
}