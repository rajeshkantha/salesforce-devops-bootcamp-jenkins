@isTest
private class BookDiscountManagerTest {

    @isTest
    static void testApplyDiscountPositive() {
        // 1. Prepare data
        Decimal price = 100.00;
        Decimal discount = 20.0;
        


        // 2. Execute the code for test class

        Test.startTest();
        Decimal result = BookDiscountManager.applyDiscount(price, discount);
        Test.stopTest();
        
        // 3. Verify the results (Assertions)
        System.assertEquals(80.00, result, 'The discount calculation is incorrect.');
    }

    @isTest
    static void testApplyDiscountNullCheck() {
        // Testing how the code handles null inputs
        Test.startTest();
        Decimal result = BookDiscountManager.applyDiscount(null, 10.0);
        Test.stopTest();
        
        System.assertEquals(0, result, 'Method should return 0 if price is null.');
    }
}