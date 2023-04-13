page 52186803 "Credit Management RoleCenter"
{
    PageType = RoleCenter;
    Caption = 'Credit Management RoleCenter';
    UsageCategory = Administration;
    layout
    {
        area(RoleCenter)
        {

        }
    }

    actions
    {
        area(Creation)
        {
            action("Create Member")
            {
                RunObject = page "Member Application Single";
                ApplicationArea = all;

            }
        }
        area(Sections)
        {
            group(Members)
            {
                action("Single Members")
                {
                    RunObject = Page "Member Single List";
                    ApplicationArea = all;
                }
                action("Group list")
                {
                    RunObject = page "Member Group List";
                    ApplicationArea = all;
                }
                action("Credit Accounts List")
                {
                    RunObject = page "Credit Accounts List";
                    ApplicationArea = all;
                }
                action("Micro Members")
                {
                    RunObject = page "Micro Member  List";
                    ApplicationArea = all;
                }
            }
            group(Loans)
            {
                group("Loan Processing")
                {
                    action("Loan Application")
                    {
                        RunObject = page "Loan Application List";
                        RunPageLink = Status = filter(Open);
                        ApplicationArea = all;

                    }
                    action("Loan Appraisal List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Appraisal Loans List";

                    }
                    action("Loan Approved List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Approved Loans List";
                    }
                    action("DCS Member Transaction List")
                    {
                        ApplicationArea = all;
                        RunObject = page "DCS Member Transaction List";
                    }
                    action("Loan Disbursement List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Loan Disbursement List";
                    }
                    action("Collateral Register - List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Collateral Register - List";
                    }
                    action("Collateral Collection - List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Collateral Collection - List";
                    }

                    action("Deferred Loan Application List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Deferred Loan Application List";
                    }
                    action("Rejected Loan Application List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Rejected Loan Application List";
                    }

                }
                group("Loan Processed")
                {
                    action("Loan Posted List")
                    {
                        RunObject = page "Loan Posted List";
                        ApplicationArea = all;

                    }
                    action("Posted Loan Disbursement List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Posted Loan Disbursement List";
                    }
                }
            }

            group("Periodic Activities")
            {
                group("Monthly Billing")
                {
                    action("Interest Due Periods")
                    {
                        RunObject = Page "Interest Due Periods";
                    }
                    action("Interest Header List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Interest Header List";
                    }
                    action("Interest Trans List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Interest Trans List";
                    }
                    action("Periodic Billing  Header List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Periodic Billing  Header List";
                    }
                }
                group("Check Off")
                {
                    action("Checkoff Advice Header List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Checkoff Advice Header List";
                    }
                    action("Checkoff Buffer")
                    {
                        ApplicationArea = all;
                        RunObject = page "Checkoff Buffer";
                    }
                    action("Checkoff Header List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Checkoff Header List";
                    }
                    action("View Checkoff Lines")
                    {
                        ApplicationArea = all;
                        RunObject = page "View Checkoff Lines";
                    }
                }
                group("Loan Activity")
                {
                    action("Loan Rescheduling List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Loan Rescheduling List";
                    }
                    action("Guarantor Subsitution List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Guarantor Subsitution List";
                    }
                    action("Loan Recovery Header List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Loan Recovery Header List";
                    }
                    action("Posted Loan Recovery Header")
                    {
                        ApplicationArea = all;
                        RunObject = page "Posted Loan Recovery Header";
                    }
                    action("Loan Recovery Header(Modified)")
                    {
                        ApplicationArea = all;
                        RunObject = page "Loan Recovery Header(Modified)";
                    }
                }
                group("Member Activity")
                {
                    group("Member withdrawal")
                    {
                        group("Member withdrawal Notice")
                        {
                            action("Open withdrawal Notice")
                            {
                                ApplicationArea = all;
                                RunObject = page "Open withdrawal Notice";
                            }
                            action("Pending Withdrawal Notice")
                            {
                                ApplicationArea = all;
                                RunObject = page "Pending Withdrawal Notice";
                            }
                            action("Approved Withdrawal Notice")
                            {
                                ApplicationArea = all;
                                RunObject = page "Approved Withdrawal Notice";
                            }
                            action("Rejected Withdrawal Notice")
                            {
                                ApplicationArea = all;
                                RunObject = page "Rejected Withdrawal Notice";
                            }
                        }
                        group("Member Securities")
                        {
                            action("Member Change List")
                            {
                                ApplicationArea = all;
                                RunObject = page "Member Change List";
                            }
                            action("+ Member Change List")
                            {
                                ApplicationArea = all;
                                RunObject = page "+ Member Change List";
                            }

                        }

                        group("History")
                        {
                            action("Posted Membership Closure")
                            {
                                ApplicationArea = all;
                                RunObject = page "Posted Membership Closure List";
                            }
                        }
                    }
                }
                group("Loan CRB")
                {
                    group(Tasks)
                    {
                        action("CRB Data")
                        {
                            ApplicationArea = all;
                            RunObject = page "CRB Data";
                        }
                    }
                }
                group("CRM Applications")
                {
                    action("CRM Application List")
                    {
                        ApplicationArea = all;
                        RunObject = page "CRM Application List";
                    }
                }
                group("Marketing")
                {
                    action("BDE Management List")
                    {
                        ApplicationArea = all;
                        RunObject = page "BDE Management List";
                    }
                }
                group("Divedent Process")
                {
                    action("Dividend Progression")
                    {
                        ApplicationArea = all;
                        RunObject = page "Dividend Progression";
                    }
                    action("Dividend Posting Buffer")
                    {
                        ApplicationArea = all;
                        RunObject = page "Dividend Posting Buffer";
                    }
                }
                group("Member Closure")
                {

                    action("Open Closure List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Open Closure List";
                    }
                    action("Pending Closure List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Pending Closure List";
                    }
                    action("Approved Closure List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Approved Closure List";
                    }
                    action("Rejected Closure List")
                    {
                        ApplicationArea = all;
                        RunObject = page "Rejected Closure List";
                    }
                }
            }
        }
        area(Embedding)
        {
        }
        area(Reporting)
        {
            group("Batch Loan")
            {
                action("Batch Loan Register")
                {
                    ApplicationArea = all;
                    RunObject = report "Batch Loan Register";
                }
            }
            group("Monthly Billing Reports")
            {
                action("Summary Billing")
                {
                    ApplicationArea = all;
                    RunObject = report "Monthly Bill Summary";
                }
                action("Empty Dividend Action")
                {
                    ApplicationArea = all;
                    RunObject = report "Empty Dividend Action";
                }
                action("Needs Change Report")
                {
                    ApplicationArea = all;
                    RunObject = report "Needs Change Report";
                }
            }
            group("Loan Activity Report")
            {
                action("Post Lien")
                {
                    ApplicationArea = all;
                    RunObject = report "Post Lien";
                }
            }
            group("Gen.Loan CRB")
            {
                action("Generate CRB Data")
                {
                    ApplicationArea = all;
                    RunObject = report "Generate CRB Data";
                }
            }
            group("Marketing Report")
            {
                action("Process BDE Payments")
                {
                    ApplicationArea = all;
                    RunObject = report "BDE Staff Performance Summary";
                }
            }
            group("Dividend Generation Report")
            {
                action("Dividend Generation")
                {
                    ApplicationArea = all;
                    RunObject = report "Dividend Generation";
                }
                action("Dividend Posting Buffer Report")
                {
                    ApplicationArea = all;
                    RunObject = report "Dividend Posting Buffer";

                }
                action("Dividend Posting")
                {
                    ApplicationArea = all;
                    RunObject = report "Dividend Posting";
                }
                action("Dividend Register")
                {
                    ApplicationArea = all;
                    RunObject = report "Dividend Register";
                }
                action("Dividend Register Summary")
                {
                    ApplicationArea = all;
                    RunObject = report "Dividend Register Summary";
                }
                action("Dividend Application Report")
                {
                    ApplicationArea = all;
                    RunObject = report "Div Application";
                }
            }
        }
    }
}
profile "Credit Management RoleCenter"
{
    Caption = 'Credit Management RoleCenter';
    RoleCenter = "Credit Management RoleCenter";
}