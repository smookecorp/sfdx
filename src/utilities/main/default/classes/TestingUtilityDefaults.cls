@isTest
public  class TestingUtilityDefaults{

    public class AccountDefaults implements TestingUtility.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Account.Name => 'Test Account'
            };
        }
    }

    public class MyAccountDefaults implements TestingUtility.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Account.Name => 'My Test Account'
            };
        }
    }

    public class ContactDefaults implements TestingUtility.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Contact.FirstName => 'First',
                    Contact.LastName => 'Last'
            };
        }
    }

    public class OpportunityDefaults implements TestingUtility.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Opportunity.Name => 'Test Opportunity',
                    Opportunity.StageName => 'Closed Won',
                    Opportunity.CloseDate => System.today()
            };
        }
    }

    /*public class CaseDefaults implements TestingUtility.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Case.Subject => 'Test Case'
            };
        }
    }*/
}