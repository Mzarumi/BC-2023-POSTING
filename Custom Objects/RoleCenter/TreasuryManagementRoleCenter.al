

page 52186812 "TreasuryManagementRoleCenter"
{
    Caption = 'Service Manager Role Center';
    PageType = RoleCenter;
    actions
    {
        area(Sections)
        {
            group("Group")
            {
                Caption = 'Accounts';
                action("Service Items")
                {
                    ApplicationArea = Service;
                    Caption = 'Main Treasury';
                    RunObject = page "Main Treasury";
                }
                action("Items")
                {
                    ApplicationArea = Service;
                    Caption = 'Items';
                    RunObject = page "Branch Treasury";
                }
            }
                
                group("Group2")
            {
                Caption = 'Payments';
                action("Contract - Salesperson")
                {
                    ApplicationArea = Service;
                    Caption = 'Payment Vouchers List';
                    RunObject = page "Payment Vouchers List";
                }
                action("Contr. GainLoss - Resp. Ctr.")
                {
                    ApplicationArea = Service;
                    Caption = 'Petty Cash Vouchers List.';
                    RunObject = page "Petty Cash Vouchers List";
                }
                   
            }
            group("Group9")
            {
                Caption = 'Setup';
                action("Service Setup")
                {
                    ApplicationArea = Service;
                    Caption = 'Investment Setup';
                    RunObject = page "Investment Type";
                }
            }
            
            group("Group10")
            {
                Caption = 'CashFlow';
                action("Cash Flow")
                {
                    ApplicationArea = Service;
                    Caption = 'Cash Flow Forecast';
                    RunObject = page "Cash Flow Forecast List";
                }
                action("Chart of Cash Flow Accounts")
                {
                    ApplicationArea = Service;
                    Caption = 'Chart of Cash Flow Accounts';
                    RunObject = page "Chart of Cash Flow Accounts";
                }
                action("Cash Flow Manual Revenues")
                {
                    ApplicationArea = Service;
                    Caption = 'Cash Flow Manual Revenues';
                    RunObject = page "Cash Flow Manual Revenues";
                }
                action("Cash Flow Manual Expenses")
                {
                    ApplicationArea = Service;
                    Caption = 'Cash Flow Manual Expenses';
                    RunObject = page "Cash Flow Manual Expenses";
                }
                action("Cash Flow Worksheet")
                {
                    ApplicationArea = Service;
                    Caption = 'Cash Flow Worksheet';
                    RunObject = page "Cash Flow Worksheet";
                }
                action("History")
                {
                    ApplicationArea = Service;
                    Caption = 'Navigate History';
                    RunObject = page Navigate;
                }
                action("Account Schedule")
                {
                    ApplicationArea = Service;
                    Caption = 'Navigate History';
                    RunObject = page "Account Schedule";
                }
                group("Group11")
                {
                    Caption = 'Reports and Analysis';
                    action("Account Schedules")
                    {
                        ApplicationArea = Service;
                        Caption = 'Account Schedule';
                        RunObject = report "Account Schedule";
                    }
                    action("Work-Hour Templates")
                    {
                        ApplicationArea = Jobs, Service;
                        Caption = 'Work-Hour Templates';
                        RunObject = report "Cash Flow Date List";
                    }
                    action("Dimensions - Total")
                    {
                        ApplicationArea = Service;
                        Caption = 'Dimensions - Totals';
                        RunObject = report "Dimensions - Total";
                    }
                    action("Troubleshooting")
                    {
                        ApplicationArea = Service;
                        Caption = 'Cash Flow Dimensions - Detail';
                        RunObject = report "Cash Flow Dimensions - Detail";
                    }
                }
                group("Group12")
                {
                    Caption = 'Status';
                    action("Order Status Setup")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Order Status Setup';
                        RunObject = page "Service Order Status Setup";
                    }
                    action("Repair Status Setup")
                    {
                        ApplicationArea = Service;
                        Caption = 'Repair Status Setup';
                        RunObject = page "Repair Status Setup";
                    }
                }
                group("Administration")
                {
                    Caption = 'Setup';
                    action("Cash Flow Setup")
                    {
                        ApplicationArea = Service;
                        Caption = 'Cash Flow Setups';
                        RunObject = page "Cash Flow Setup";
                    }
                    action("Price Groups")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Price Groups';
                        RunObject = page "Report Selection - Cash Flow";
                    }
                }
                
                group("Group15")
                {
                    Caption = 'Contracts';
                    action("Account Groups")
                    {
                        ApplicationArea = Service;
                        Caption = 'Serv. Contract Account Groups';
                        RunObject = page "Serv. Contract Account Groups";
                    }
                    action("Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Contract Templates';
                        RunObject = page "Service Contract Template List";
                    }
                    action("Groups")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Contract Groups';
                        RunObject = page "Service Contract Groups";
                    }
                    action("Service Item Groups1")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Item Groups';
                        RunObject = page "Service Item Groups";
                    }
                }
            }
        }
    }
}
profile "Treasury Roles"
{
    Caption = 'Treasury Management Roles';
    RoleCenter = "Management Role Center";
}