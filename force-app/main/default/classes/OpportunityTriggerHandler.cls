/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OpportunityTriggerHandler {
  public static void handleActivitiesAfterDelete(List<Opportunity> oldRecords) {
    Set<Id> accountIds = new Set<Id>();
    Map<Id, Id> oppVSAccountMap = new Map<Id, Id>();
    Map<Id, Id> accIdVSAccountMap = new Map<Id, Id>();
    for (Opportunity opp : oldRecords) {
      accountIds.add(opp.AccountId);
      oppVSAccountMap.put(opp.Id, opp.AccountId);
    }

    List<Account> accordRecords = [ SELECT Id, OwnerId FROM Account WHERE Id IN :accountIds];

    for (Account acc : accordRecords) {
      accIdVSAccountMap.put(acc.Id, acc.OwnerId);
    }

    List<Task> taskRecordList = new List<Task>();
    System.debug('Before delete' + oldRecords);
    for (Opportunity opp : oldRecords) {
      Task taskRecord = new Task();
      System.debug('Opportunity Deleted : ' + opp);
      taskRecord.Description = 'Please investigate why the opportunity was deleted';
      taskRecord.Priority = 'High';
      taskRecord.OwnerId = accIdVSAccountMap.get(oppVSAccountMap.get(opp.Id));
      taskRecord.Status = 'Not started';
      taskRecord.Subject = 'Follow Up';
      taskRecordList.add(taskRecord);
    }

    if (!taskRecordList.isEmpty()) {
      insert taskRecordList;
    }
  }
}