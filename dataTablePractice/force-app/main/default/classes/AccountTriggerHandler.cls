public with sharing class AccountTriggerHandler {
    
    public static void beforeInsertLogic(List<Account> newAccounts) {
        // List<Account> newAccountCollection = new List<Account>();
        for(Account newAcct : newAccounts) {
            if (newAcct.BillingState == 'TX') {
                newAcct.Rating = 'Hot';
            } else if (newAcct.BillingState == null) {
                newAcct.Rating = 'Cold';
            } else {
                newAcct.Rating = 'Warm';
            }
            // newAccountCollection.add(newAcct);
        }
    }

    public static void beforeUpdateLogic(List<Account> top100Account) {
       // List<Account> top100AccountCollection = new List<Account>();
        for (Account topAccts : top100Account) {
            if (topAccts.AnnualRevenue >= 1000000) {
                topAccts.Description = 'This is a Top Tier account!';
            }
            // top100AccountCollection.add(topAccts);
        }
    }

    public static void afterUpdateNewCustomerDirect(List<Account> customerDirectAccount) {
        List<Task> newTaskCustomerDirect = new List<Task>();
        for (Account upAcct : customerDirectAccount) {
            if (upAcct.Type == 'Customer') {
                System.debug('Type Value: ' + upAcct.Type);
                Task tsk         = new Task();
                tsk.OwnerId      = upAcct.OwnerId;
                tsk.WhatId       = upAcct.Id;
                tsk.ActivityDate = date.today();
                tsk.Subject      = 'New Client: Reach out ASAP!';
                tsk.Priority     = 'High';
                tsk.Status       = 'Not Started';
                tsk.Description  = 'Reach out at your earliest convenience.';
                newTaskCustomerDirect.add(tsk);
            }
        }
        insert newTaskCustomerDirect;
    }
    
    public static void afterInsertCreateCase(List <Account> accountList) {
        // Instantiate a new list of Cases
        List<Case> cases = new List<Case>();
        // Loop through all accounts
        for(Account acct : accountList) {
            // For each account, create a case with the following fields and values
            Case c      = new Case();
            c.AccountId = acct.Id;
            c.OwnerId   = acct.OwnerId;
            c.Subject   = 'Dedupe this Account';
            c.Priority  = 'High';
            // Add the new case to the 'cases' variable
            cases.add(c);
        }
        // Commit the cases to the database
        insert cases;
    }
}