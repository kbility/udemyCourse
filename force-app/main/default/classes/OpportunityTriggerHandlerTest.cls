/**
 * @description       :To test OpportunityTriggerHandler class for the creation of Task when the opportunity is deleted
 * @author            : Kbility
 * @group             :
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
@isTest
private class OpportunityTriggerHandlerTest {
  @isTest
  public static void testHandleActivitiesAfterDelete() {
    User testUser = createTestUser();
    System.runAs(testUser) {
      List<Account> testAccounts = new List<Account>();
      for (Integer i = 0; i < 2; i++) {
        Account testAccount = new Account(
          Name = 'Test Account ' + i,
          OwnerId = testUser.Id
        );
        testAccounts.add(testAccount);
      }
      insert testAccounts;

      List<Opportunity> testOpportunities = new List<Opportunity>();
      for (Integer i = 0; i < 2; i++) {
        Opportunity testOpportunity = new Opportunity(
          Name = 'Test Opportunity ' + i,
          StageName = 'Prospecting',
          CloseDate = Date.today().addDays(10),
          AccountId = testAccounts[i].Id
        );
        testOpportunities.add(testOpportunity);
      }
      insert testOpportunities;

      Test.startTest();
      delete testOpportunities;
      Test.stopTest();

      List<Task> taskRecords = [SELECT Id FROM Task];
      Assert.areEqual(2,[SELECT Id FROM Task].size(),'Task records size should be 2');
      
    }
  }

  private static User createTestUser() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
    String orgId = UserInfo.getOrganizationId();
    Integer randomInt = Integer.valueOf(math.rint(math.random() * 1000000));
    String uniq = orgId + randomInt;
    User tUser = new User(
      firstname = 'TestFirst' + uniq,
      lastName = 'TestLast' + uniq,
      email = uniq + '@test' + orgId + '.org',
      Username = uniq + '@test' + orgId + '.org',
      EmailEncodingKey = 'ISO-8859-1',
      Alias = uniq.substring(10, 15),
      TimeZoneSidKey = 'America/Los_Angeles',
      LocaleSidKey = 'en_US',
      LanguageLocaleKey = 'en_US',
      ProfileId = p.Id
    );
    return tUser;
  }
}
