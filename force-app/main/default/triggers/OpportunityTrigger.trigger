trigger OpportunityTrigger on Opportunity(before insert, after delete) {
  switch on Trigger.operationType {
    when AFTER_DELETE {
      OpportunityTriggerHandler.handleActivitiesAfterDelete(Trigger.old);
    }
  }

}