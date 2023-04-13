page 52186814 LegalManagementRoleCenterPage
{
    PageType = RoleCenter;
    Caption = 'SACCO Legal Management Role Center';

    layout
    {
        area(RoleCenter)
        {
            // part(Part1; "Headline RC Registry")
            // {
            //     ApplicationArea = All;
            // }
        }
    }

    actions
    {
        area(Sections)
        {
            group(LegalCaseManagement)
            {
                Caption = 'Legal Case Management';
                Image = Administration;

                action("Case List")
                {
                    Caption = 'Case List';
                    ApplicationArea = All;
                    RunObject = page "Legal List";
                }
                action("Witness Line")
                {
                    Caption = 'Witness Line';
                    ApplicationArea = All;
                    RunObject = page "Witness Line";
                }
                action("Advocate List")
                {
                    Caption = 'Advocate List';
                    ApplicationArea = All;
                    RunObject = page "Advocate List";
                }
                action("Approved List")
                {
                    Caption = 'Approved List';
                    ApplicationArea = All;
                    RunObject = page "Legal List Aproved";
                }
                action("Verdict List")
                {
                    Caption = 'Verdict List';
                    ApplicationArea = All;
                    RunObject = page "Verdict List";
                }
                action("Damages List")
                {
                    Caption = 'Damages List';
                    ApplicationArea = All;
                    RunObject = page "Damages List";
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                Image = Administration;

                action("Case Invoices")
                {
                    Caption = 'Case Invoices';
                    ApplicationArea = All;
                    RunObject = page "Case Invoice";
                }

                action("Case Payments")
                {
                    Caption = 'Case Payments';
                    ApplicationArea = All;
                    RunObject = page "Case Payment List";
                }
            }
            group(AppealedCases)
            {
                Caption = 'Appealed Cases';
                Image = Administration;

                action("Appealed Legal List")
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    RunObject = page "Appealed Legal List";
                }
            }
            group(ClosedCases)
            {
                Caption = 'Closed Cases';
                Image = Administration;

                action("Closed Legal List")
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    RunObject = page "Legal List";
                }
            }
            group(SuretyManagement)
            {
                Caption = 'Surety Management';
                Image = Administration;

                action("Surety Management List")
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    RunObject = page "Surety Management List";
                }

                action("Approved Surety Management")
                {
                    Caption = 'Approved Surety Management';
                    ApplicationArea = All;
                    RunObject = page "Approved Surety Management";
                }
            }
        }

        area(Embedding)
        {
            action("Legal Cases")
            {
                Caption = 'Legal Cases';
                ApplicationArea = All;
                RunObject = page "Legal List";
            }
            action("Appeals")
            {
                Caption = 'Appeals';
                ApplicationArea = All;
                RunObject = page "Appealed Legal List";
            }
            action("Legal Payments")
            {
                Caption = 'Legal Payments';
                ApplicationArea = All;
                RunObject = page "Case Payment List";
            }
            action("Sureties")
            {
                Caption = 'Sureties';
                ApplicationArea = All;
                RunObject = page "Surety Management List";
            }
        }

        area(Processing)
        {
            action("See Case Invoices")
            {
                Caption = 'See Case Invoices';
                ApplicationArea = All;
                RunObject = page "Case Invoice";
            }
        }

        area(Creation)
        {
            action(AddLegalCase)
            {
                Caption = 'Add Case';
                Image = NewDocument;
                RunObject = page "Legal List";
                RunPageMode = Create;
                ApplicationArea = All;
            }
        }

        area(Reporting)
        {
            action(CaseReport)
            {
                Caption = 'Case';
                Image = "Report";
                RunObject = Report "Case Report";
                ApplicationArea = All;
            }
            action(AdvocateCostReport)
            {
                Caption = 'Advocate Cost';
                Image = "Report";
                RunObject = Report "Avocate Cost Report";
                ApplicationArea = All;
            }
            action(CaseStatusReport)
            {
                Caption = 'Case Status';
                Image = "Report";
                RunObject = Report "Case Status Report";
                ApplicationArea = All;
            }
            action(CaseCostReport)
            {
                Caption = 'Case Cost';
                Image = "Report";
                RunObject = Report "Case Cost";
                ApplicationArea = All;
            }
        }
    }
}

profile LegalManagementProfile
{
    ProfileDescription = 'SACCO Legal Management Profile';
    RoleCenter = LegalManagementRoleCenterPage;
    Caption = 'SACCO Legal Management';
}