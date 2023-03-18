page 52186807 "Payroll Role Center"
{
    Caption = 'Payroll Role Center';
    PageType = RoleCenter;
    actions
    {
        area(Sections)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';

                action("Voucher")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Payment Voucher';
                    RunObject = page "Payment Voucher Board";
                }
                action("Payment Voucher Staff")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Payment Voucher Staff';
                    RunObject = page "Payment Voucher Board List";
                }

                action("Adjust Resource Costs/Prices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Adjust Resource Costs/Prices';
                    RunObject = report "Adjust Resource Costs/Prices";
                }
                group("Payroll")
                {
                    Caption = 'Payroll';
                    action("Salary Process")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Payroll';
                        RunObject = page "Payroll Salary Process";
                    }
                    action("Changes requested")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Changes requested';
                        RunObject = page "Payroll Changes Requested";
                    }
                    action("Changes requested Approval")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Changes requested Approval';
                        RunObject = page "Payroll Changes Requested Appr";
                    }
                    action("Import Transactions")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Import Transaction';
                        RunObject = page "Payroll Import Transactions";
                    }
                    action("Setup")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Payroll Setup';
                        RunObject = page "Payroll Setup";
                    }

                }
                group("Payroll Setup")
                {
                    Caption = 'Payroll Setup';
                    action("Rates & Ceilings")
                    {
                        Caption = 'Rates & Ceilings';
                        RunObject = Page "prRates & Ceilings List";
                    }
                    action(Dimensions)
                    {
                        Caption = 'Dimensions';
                        RunObject = Page Dimensions;
                    }
                    action("PAYE Setup")
                    {
                        Caption = 'PAYE Setup';
                        RunObject = Page "prP.A.Y.E Setup";
                    }
                    action("Transactions Setup")
                    {
                        Caption = 'Transactions Setup';
                        RunObject = Page "PR Transaction Codes List";
                    }
                    action("Salary Grades")
                    {
                        Caption = 'Salary Grades';
                        RunObject = Page "Salary Grades";
                    }
                    action("Bank Structure")
                    {
                        Caption = 'Bank Structure';
                        RunObject = Page "PR Bank Accounts";
                    }
                    action("Membership Groups")
                    {
                        Caption = 'Membership Groups';
                        RunObject = Page "prMembership Groups";
                    }
                    action("Payroll Type")
                    {
                        Caption = 'Payroll Type';
                        RunObject = Page "prPayroll Type";
                    }
                    action("Posting Groups")
                    {
                        Caption = 'Posting Groups';
                        RunObject = Page "prEmployee Posting Group";
                    }
                }

            }

        }
    }
}

profile "Payroll RTC"
{
    Caption = 'Payroll';
    RoleCenter = "Payroll Role Center";
}