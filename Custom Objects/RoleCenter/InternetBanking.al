page 52186805 "Internet Banking Role Center"
{
    Caption = 'Internet Banking', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
           
            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }
            
            part(Control9; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control100; "Cash Flow Forecast Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Mobile Transactions List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Mobile Transactions';
                RunObject = Page "Sky Mobile Transactions";
                ToolTip = 'Mobile Transactions List.';
            }
            action("Mobile Loan List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Mobile Loan list';
                Image = BankAccount;
                RunObject = Page "Sky Mobile Loans";
                ToolTip = 'Mobile Loans.';
            }
            action("Web Portal Transactions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Web Portal Transactions';
                Image = Customer;
                RunObject = Page "Sky Portal Transactions";
                ToolTip = 'Web Portal Transactions List.';
            }
            action("Agency Banking Transactions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Agency Banking Transactions';
                Image = Customer;
                RunObject = Page "Sky Agent Transactions";
                ToolTip = 'Agency Banking Transactions List.';
            }
        }
        area(sections)
        {
            group("Mobile Banking")
            {
                Caption = 'Mobile Banking';
                Image = Journals;
                ToolTip = 'Mobile Banking Tasks and Transactions.';

                group("Transactions")
                {
                    Caption = 'Transactions';
                    ToolTip = 'Transactions.';
                    action("Mobile Transactions")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Mobile Transactions';
                        Image = Journal;
                        RunObject = Page "Sky Mobile Transactions";
                        ToolTip = '.';
                    }
                    action("Paybill Transactions")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Paybill Transactions';
                        RunObject = Page "Sky Paybill Transactions";
                        ToolTip = 'Paybill Transactions';
                    }
                }

                group("Loans")
                {
                    Caption = 'Loans';
                    ToolTip = 'Loans.';
                    action("Loan Appraisals")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Mobile Loan Appraissals';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Sky Mobile Loan Appraisal";
                        ToolTip = 'Mobile Loan Apprassal.';
                    }
                    action("Mobile Loans")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Mobile Loans';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Sky Mobile Loans";
                        ToolTip = 'Sky Mobile Laons.';
                    }
                    action("BOSA Mobile Loans")
                    {
                        ApplicationArea = Suite;
                        Caption = 'BOSA Mobile Loans';
                        Image = Currency;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Msacco Loan Application List";
                        ToolTip = 'BOSA Mobile Loans.';
                    }
                    action(" Appraised Mobile Laon")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Mobile Loan Appraisal';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Msacco Loan Appraised App List";
                        ToolTip = 'Mobile Laon Appraisal List.';
                    }
                    action("Deffered Mobile Loan")
                    {
                        ApplicationArea = VAT;
                        Caption = 'Deffered Mobile Loan';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Msacco Loan Deferred App List";
                        ToolTip = 'Deffered Mobile Loan List.';
                    }
                    action("Rejected Mobile Loan")
                    {
                        ApplicationArea = VAT;
                        Caption = 'Rejected Mobile Loan';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Msacco Loan Rejected App List";
                        ToolTip = 'Rejected Mobile Loan List.';
                    }
                }
                group("Communication")
                {
                    Caption = 'Communication';
                    ToolTip = 'Communication';
                    action("Bulk SMS")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bulk SMS';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "M-SACCO Bulk SMS Header List";
                        ToolTip = 'Bulk SMS.';
                    }
                    action("SMS Messages")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'SMS Messages';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Sky SMS Messages";
                        ToolTip = 'SMS Messages.';
                    }
                    action("Email Updates")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Email Updates';
                        RunObject = Page "Sky Email Update";
                        ToolTip = 'Email Updates.';
                    }
                    action("Posted Email Updates")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Posted Email Updates';
                        RunObject = Page "Sky Email Update -Posted";
                        ToolTip = 'Posted Email Updates.';
                    }
                }
                
                group("Virtual Applications")
                {
                    Caption = 'Virtual Applications';
                    ToolTip = 'Virtual Applications';

                    action("Virtual Member Applications")
                    {
                        ApplicationArea = Intercompany;
                        Caption = 'Virtual Member Applications';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "USSD Member Application";
                        ToolTip = 'Virtual Member Applications.';
                    }
                    action("Created V-Member Applications")
                    {
                        ApplicationArea = Intercompany;
                        Caption = 'Created V-Member Applications';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Created Sky Virtual Member";
                        ToolTip = 'Created V-Member Applications.';
                    }

                }
                
                action("Business Accounts")
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Business Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sky Business Accounts";
                    ToolTip = 'Business Accounts.';
                }
                group("Mortgage Requisitions")
                {
                    Caption = 'Mortgage Requisitions';
                    ToolTip = 'Mortgage Requisitions';
                    action("Mortgage Requisition List")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Mortgage Requisition List';
                        Image = Currency;
                        RunObject = Page "Mortgage Requisition List";
                        ToolTip = 'Mortgage Requisition List.';
                        // ObsoleteState = Pending;
                        // ObsoleteReason = 'Duplicated action use action(Currencies)';
                        // ObsoleteTag = '19.0';
                    }
                    action("Non Member Mortgage List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Non Member Mortgage List';
                        Visible = true;
                        RunObject = Page "Non Member Mortgage List";
                        ToolTip = 'Non Member Mortgage List.';
                        // ObsoleteState = Pending;
                        // ObsoleteReason = 'Duplicated action use action(Employees)';
                        // ObsoleteTag = '19.0';
                    }
                    action("Actioned Mortgage")
                    {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Actioned Mortgage';
                    Image = AccountingPeriods;
                    RunObject = Page "Actioned Mortgage";
                    ToolTip = 'Actioned Mortgage.';
                }
                }
                group("Insurance Requisitions")
                {
                    Caption = 'Insurance Requisition';
                    ToolTip = 'Insurance Requisition';
                    action("Insurance Requisition List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Insurance Requisition List';
                        RunObject = Page "Insurance Requisition List";
                        ToolTip = 'Insurance Requisition List';
                    }
                    #if not CLEAN19
                    action("Actioned Insurance List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Actioned Insurance List';
                        RunObject = Page "Insurance Actioned List";
                        ToolTip = 'Actioned Insurance List.';
                        // ObsoleteState = Pending;
                        // ObsoleteReason = 'Duplicated action use action("G/L Account Categories")';
                        // ObsoleteTag = '19.0';
                    }
                }
                #endif
            }
            group("Web Portal")
            {
                Caption = 'Web Portal';
                Image = Journals;
                ToolTip = 'Web Portal.';
                action("Portal Transactions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Portal Transactions';
                    Image = Journal;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sky Portal Transactions";
                    ToolTip = 'Portal Transactions List.';
                }
                action("Portal Users")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Portal Users';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sky Portal Users";
                    ToolTip = 'Portal Users List';
                }
                action("Sky Checkoff Advice")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sky Checkoff Advice';
                    RunObject = Page "Sky Checkoff Advice";
                    ToolTip = 'Checkoff Advice List .';
                }
                group("Portal Member Applications")
                {
                    Caption = 'Portal Member Applications';
                    ToolTip = 'Portal Member Applications';
                    action("Web Portal Member App")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Web Portal Member App';
                        RunObject = Page "Web Portal Member App";
                        ToolTip = 'Web Portal Member App List.';
                    }
                    action("Created Web Portal App")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Web Portal App';
                        RunObject = Page "Created Web Portal App";
                        ToolTip = 'Created Web Portal App List.';
                    }
                }
                group("Portal Member Onboarding")
                {
                    Caption = 'Portal Member Onboarding';
                    ToolTip = 'Portal Member Onboarding';
                    action("Member Onboarding List")
                    {
                        ApplicationArea = BasicEU;
                        Caption = 'Member Onboarding List';
                        Image = "Report";
                        RunObject = Page "Member Onboarding List";
                        ToolTip = 'Member Onboarding List.';
                    }
                    action("On-Boarded Members")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'On Boarded Members';
                        RunObject = Page "On Boarded Members";
                        ToolTip = 'On Boarded Members.';
                    }
                }
            }
            group("Agency Banking")
            {
                Caption = 'Agency Banking';
                ToolTip = 'Agency Banking Module.';
                action("Agent Transactions List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Agent Transactions List';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sky Agent Transactions";
                    ToolTip = 'Agent Transactions List.';
                }
                action("Agent Withdrawals Buffer")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Agent Withdrawals Buffer';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Agent Withdrawals Buffer";
                    ToolTip = 'Agent Withdrawals Buffer.';
                }
                action("Agent Transfer List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Agent Transfer List';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sky Agent Transfer List";
                    ToolTip = 'Agent Transfer List.';
                }
                action("Agent Transactions Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Agent Transactions Report';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Agent Transactions";
                    ToolTip = 'Agent Transactions Report.';
                }             
            }
            
        }
        area(creation)
        {
            action("M-Banking Application")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'M-banking Applications';
                RunObject = Page "Mbanking Applications";
                RunPageMode = Create;
                ToolTip = 'M-banking Applications.';
            }
            action("Portal Onboarding")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Portal Member Onboarding';
                RunObject = Page "Member Onboarding";
                RunPageMode = Create;
                ToolTip = 'Portal Member Onboarding.';
            }
            action("Agent Applications")
            {
                ApplicationArea = Basic, Suite;
                RunPageMode = Create;
                Caption = 'Agent Application Card';
                RunObject = Page "Agent Application Card";
                ToolTip = 'Agent Application Card.';
            }
        }
        area(processing)
        {                   
            group("M-Banking SetUps")
            {
                Caption = 'M-Banking SetUps';
                action("Mobile Setup List")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Mobile Setup List';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Page "Sky Mobile Setup List";
                    ToolTip = 'Mobile Transaction types and setup.';
                }
                action("Sky Permissions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Black-Listed Accounts';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Page "Sky Permissions";
                    ToolTip = 'Black-Listed Accounts.';
                }
                action("Co-operate Charges")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Co-operate Charges';
                    Image = BankAccountRec;
                    RunObject = Page "Safaricom Charges";
                    ToolTip = 'Co-operate Charges.';
                }
                action("Coop Transaction Codes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Coop Transaction Codes';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Coop Transaction Codes";
                    ToolTip = 'Coop Transaction Codes.';
                }
                action("Coop ATM Setup")
                {
                    ApplicationArea = Suite;
                    Caption = 'Coop ATM Setup';
                    Ellipsis = true;
                    Image = AdjustExchangeRates;
                    RunObject = Page "Coop ATM Setup";
                    ToolTip = 'Coop ATM Setup.';
                }
                action("Mobile Guarantor Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Mobile Guarantor Setup';
                    Image = PostInventoryToGL;
                    RunObject = Page "Mobile Guarantor Setup";
                    ToolTip = 'Mobile Guarantor Setup.';
                }               
            }
            group("M-Banking Documents")
            {
                Caption = 'M-Banking Documents';
                action("Black-Listed Phone Nos")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Black-Listed Phone Nos';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Page "Black-Listed Phone Nos";
                    ToolTip = 'Black-Listed Phone Nos.';
                }
                action("Black-Listed Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Black-Listed Accounts';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Page "Black-Listed Accounts";
                    ToolTip = 'Black-Listed Accounts.';
                }
                action("Black-Listed Names")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Black-Listed Names';
                    Image = BankAccountRec;
                    RunObject = Page "Black-Listed Names";
                    ToolTip = 'Black-Listed Names.';
                }              
            }
            group("Portal SetUps")
            {
                Caption = 'Portal SetUps';
                action("Portal Setup")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Portal Setup';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Page "Portal Setup";
                    ToolTip = 'Portal Setup.';
                }
                action("Member Application Handlers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Member Application Handlers';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Page "Member Application Handlers";
                    ToolTip = 'Member Application Handlers.';
                }
                action("Portal Endpoints")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Portal Endpoints';
                    Image = BankAccountRec;
                    RunObject = Page "Portal Endpoints";
                    ToolTip = 'Portal Endpoints.';
                }                           
            }
             group("Agency Banking SetUps")
            {
                Caption = 'Agency Banking SetUps';
                action("Agent Tariff Header")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Agent Tariff Header';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Page "Agent Tariff Header";
                    ToolTip = 'Agent Tariff Header.';
                }                         
            }                          
        }
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Internet Banking';
    RoleCenter = "Internet Banking Role Center";
    Caption = 'Internet Banking';
}
