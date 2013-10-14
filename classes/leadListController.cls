public with sharing class leadListController {

  Transient Lead[] leads;
  String query = 'SELECT Id, Name, State, Company, Email, LastModifiedDate FROM Lead WHERE Status = \'Open - Not Contacted\' AND Rating = \'Hot\' ORDER BY LastModifiedDate DESC LIMIT 1000';

  public Lead[] getLeads() {
    leads = Database.query(query);
    return leads;
  }

  public PageReference pollAction() {
    leads = Database.query(query);
    return null;
  }

  @RemoteAction
  static public Lead[] getHotLeads() {
    String query = 'SELECT Id, Name, State, Company, Email, LastModifiedDate FROM Lead WHERE Status = \'Open - Not Contacted\' AND Rating = \'Hot\' ORDER BY LastModifiedDate DESC LIMIT 1000';
	Lead[] leads = Database.query(query);
    return leads;
  }
}