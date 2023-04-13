page 52186810 "Management Role Center"
{
    Caption = 'Banking Management Role Center';
    PageType = RoleCenter;
    layout{
        
    }
    actions
    {
        area(Sections)
        {
            group("General Ledgers.")
            {
                Caption = 'General Ledger';
                action("Chart of Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    RunObject = page "Chart of Accounts";
                }
                action("Budgets")
                {
                    ApplicationArea = Suite;
                    Caption = 'G/L Budgets';
                    RunObject = page "G/L Budget Names";
                }
            }      
 
                     group("ATM Management")
                    {
                        Caption = 'ATM Management.';
                        action("ATM Managements.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'ATM Applications';
                            RunObject = page "ATM Application List";
                        }
                        action("Approved ATM Cards")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved ATM Cards';
                            RunObject = page "Approved ATM Application List";
                        }
                        action("ATM Linking Application List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'ATM Linking List';
                            RunObject = page "ATM Linking Application List";
                        }
                        action("ATM Approved Linking List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'ATM Linking List';
                            RunObject = page "Approved ATM Linking List";
                        }
                        action("ATM Reports")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'VAT Exceptions';
                                RunObject = report "ATM Report";
                            }
                            action("Sky ATMTransactions")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Atm Transactions';
                                RunObject = page "Sky Coop Atm Transactions";
                            }
                            action("ATM Transactions")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Atm Transactions';
                                RunObject = page "ATM Transactions";
                            }
                        
                    }

                        group("Delegate Management")
                    {
                        Caption = 'Delegate Management';
                        action("Delegate Operations")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate Members Applicationss';
                            RunObject = page  "Delegate Members Applicationss";
                        }
                        action("Delegate Members List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate Members List';
                            RunObject = page  "Delegate Members List";
                        }
                        action("Delegate Retire Memberss")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate Retire Memberss';
                            RunObject = page "Delegate Retire Memberss";
                        }
                        action("Delegates Payment List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegates Payment List';
                            RunObject = page "Delegates Payment List";
                        }
                        action("Delegate  Memberss Transfer")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate  Memberss Transfer';
                            RunObject = page "Delegate  Memberss Transfer";
                        }
                        action("Delegate Members")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate Members';
                            RunObject = page "Delegate Members";
                        }
                        action("Active Delegate Officials")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Active Delegate Officials';
                            RunObject = page "Active Delegate Officials";
                        }
                        action("Delegate Tariffs")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = '"Delegate Tariffs"';
                            RunObject = page "Delegate Tariffs";
                        }
                        action("Delegate Meeting Attendees")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = '"Delegate Meeting Attendees"';
                            RunObject = page "Delegate Meeting Attendees";
                        }
                        action("Delegate AGM Registrations")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Delegate AGM Registration';
                            RunObject = page "Delegate AGM Registration";
                        }
                          group("Reports")
                        {
                            action("Delegate Payment Reports")
                        {
                            ApplicationArea = Intercompany;
                            Caption = 'Delegate Payment Report';
                            RunObject = report "Delegate Payment Report";
                        }
                            action("Delegate Meeting Reports")
                        {
                            ApplicationArea = Intercompany;
                            Caption = 'Delegate Meeting Report';
                            RunObject = report "Delegate Meeting Report";
                        }
                            action("Delegate Loans Registers")
                        {
                            ApplicationArea = Intercompany;
                            Caption = 'Delegate Loans Register';
                            RunObject = report "Delegate Loans Register";
                        }


                        }
                        
                    }
                    group("Periodic Activities")
                    {
                        Caption = 'Periodic Activities';
                        action("Salary Processing")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Income Processing';
                            RunObject = page "Salary Lists";
                        }
                        action("Cheque Clearance")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Cheque Clearance...';
                            RunObject = page "Cheque Clearance";
                        }
                        group("Fixed Deposits"){
                            action("Process Fixed Deposits")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Cheque Clearance...';
                            RunObject = report "Process Fixed Deposit";
                        }
                            action("Process Fixed Deposit")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Cheque Clearance...';
                            RunObject = report "Fixed Deposit Receipt";
                        }
                        group("Interest Management")
                        {
                            action("Interest Managements")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Account Interest...';
                            RunObject = page "Account Interest List";
                        }
                            action("Posted Account Interest List")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Posted Account Interest List.';
                            RunObject = page "Posted Account Interest List";
                        }
                            action("End Year Interest List")
                        {
                            ApplicationArea = Suite;
                            Caption = 'End Year Interest List.';
                            RunObject = page "End Year Interest List";
                        }
                            action("Posted End Year Interest List.")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Posted End Year Interest List.';
                            RunObject = page "Posted End Year Interest List";
                        }

                        }
                        group("Standing Order.")
                        {
                                action("Standing Order List.")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Posted End Year Interest List.';
                            RunObject = page "Standing Order List";
                        }
                            action("Standing Order Processing.")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Posted End Year Interest List.';
                            RunObject = report "Standard Statement";
                        }

                        }
                    }
                      group("Banking Management.")
            {
                Caption = 'General Ledger';
                action("Banking Closure List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Banking Closure Lists';
                    RunObject = page "Banking Closure List";
                }
                group("Reports and Analysis")
                {
                    action("Banking Closure Lists")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Generate Dormant Accounts.';
                    RunObject = report "Generate Dormant Accounts";
                }
                    action("Salary Through Fosa Report.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Salary Through Fosa Report.';
                    RunObject = report "Salary Through Fosa Report";
                }
                    action("Clear Lien Process")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Clear Lien Process.';
                    RunObject = report "Clear Lien Process";
                }

                }

            } 
                    }
            


                    group("Group6")
                    {
                        Caption = 'Register/Entries';
                        action("G/L Registers")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'G/L Registers';
                            RunObject = page "G/L Registers";
                        }
                        action("Navigate")
                        {
                            ApplicationArea = Basic, Suite, FixedAssets, CostAccounting;
                            Caption = 'Find entries...';
                            ShortCutKey = 'Ctrl+Alt+Q';
                            ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                            RunObject = page "Navigate";
                        }
                        action("General Ledger Entries")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'General Ledger Entries';
                            RunObject = page "General Ledger Entries";
                        }
                        action("G/L Budget Entries")
                        {
                            ApplicationArea = Suite;
                            Caption = 'G/L Budget Entries';
                            RunObject = page "G/L Budget Entries";
                        }
                        action("VAT Entries")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'VAT Entries';
                            RunObject = page "VAT Entries";
                        }
                        action("Analysis View Entries")
                        {
                            ApplicationArea = Dimensions;
                            Caption = 'Analysis View Entries';
                            RunObject = page "Analysis View Entries";
                        }
                        action("Analysis View Budget Entries")
                        {
                            ApplicationArea = Dimensions;
                            Caption = 'Analysis View Budget Entries';
                            RunObject = page "Analysis View Budget Entries";
                        }
                        action("Item Budget Entries")
                        {
                            ApplicationArea = ItemBudget;
                            Caption = 'Item Budget Entries';
                            RunObject = page "Item Budget Entries";
                        }
                    }
                     group("Transfers")
                    {
                        Caption = 'Transfers.';
                        action("Transferss")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Account Transfer';
                            RunObject = page "Account Transfer";
                        }
                        action("Posted Acc Transferss")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Account Transfer List';
                            RunObject = page "Posted Account Transfer List";
                        }
                    }
                   group("SetUps")
                    {
                       group("Transactions")
                    {
                        action("Transaction Types")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Transaction Types';
                            RunObject = page "Transaction Types";
                        }
                        action("Banking User Setups")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Transaction Types';
                            RunObject = page "Banking User Setup";
                        }
                        action("Tiered Charges List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Tiered Charges List.';
                            RunObject = page "Tiered Charges List";
                        }
                        action("Denomination Setup.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Denomination Setup.';
                            RunObject = page "Denomination Setup";
                        }
                    }
                    group("Cheque Management")
                    {
                        Caption = 'Cheque Types.';
                        action("Cheque Types.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Cheque Types';
                            RunObject = page "Cheque Types";
                        }
                    } 
                    group("Notifications")
                    {
                        Caption = 'Cheque Types.';
                        action("Notifications.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Cheque Types';
                            RunObject = page "E-Mail Notification";
                        }
                    }
                    group("Fixed Deposis")
                    {
                        Caption = 'Cheque Types.';
                        action("Fixed Deposits.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Fixed Deposit Type';
                            RunObject = page "Fixed Deposit Type";
                        }
                    }
                    }
          
                group("Accounts")
                    {
                        Caption = 'Accounts';
                        action("Savings Accounts")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Savings Account';
                            RunObject = page "Savings Account List";
                        }
                        action("Savings")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Savings Account';
                            RunObject = page "Savings Account List";
                        }
                    }
                    group("EFT/RTGS")
                    {
                        Caption = 'EFT/RTGS';
                        action("EFT/RTGS.")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'EFT/RTGS';
                            RunObject = page "EFT Transfer List";
                        }
                        action("Posted EFT Transfer List")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted EFT Transfer List';
                            RunObject = page "Posted EFT Transfer List";
                        }
                        group("EFT Report"){
                         action("EFT Reports")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted EFT Transfer List';
                            RunObject = report "EFT Report";
                        }   
                        }
                    }

                group("Cheque Managements")
                {
                    action("Bankers Cheque Application")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bankers Cheque Application';
                        RunObject = page "Bankers Cheque Application";
                    }
                    action("Cheque Book Application Lists")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cheque Book Application List';
                        RunObject = page "Cheque Book Application List";
                    }
                    action("Bankers Cheque Applicationss")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bankers Cheque Application';
                        RunObject = page "Bankers Cheque Application";
                    }
                    action("Cheque Receipts Lists")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cheque Receipts List';
                        RunObject = page "Cheque Receipts List";
                    }
                    

                    
                }
                    group("GStanding Orders")
                    {
                        Caption = 'Standing Orders.';
                        action("Standing Orders")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Standing Orders';
                            RunObject = page "Standing Order";
                        }
                    }
                     group("Bonding Managements")
                    {
                        Caption = 'Bonding Management';
                        action("Bonding Management")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Bonding Management';
                            RunObject = page "Bond List";
                        }
                    }
            }

        }
        
    }

    profile "Admin Role"
    {
        Caption = 'The Banking Management Roles';
        RoleCenter = "Management Role Center";
    }
    

