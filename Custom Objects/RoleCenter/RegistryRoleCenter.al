page 52186802 RegistryRoleCenterPage
{
    PageType = RoleCenter;
    Caption = 'SACCO Registry/Membership Role Center';

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
            group(Member)
            {
                Caption = 'Member';
                Image = Administration;

                group(NormalMember)
                {
                    Caption = 'Normal Member';

                    action("Open Member Application List")
                    {
                        Caption = 'View Applications';
                        ApplicationArea = All;
                        RunObject = page "Open Member Application List";
                    }

                    action("Pending Member Application")
                    {
                        Caption = 'Pending Applications';
                        ApplicationArea = All;
                        RunObject = page "Pending Member Application";
                    }

                    action("Pending Member Application V")
                    {
                        Caption = 'Pending Applications V';
                        ApplicationArea = All;
                        RunObject = page "Pending Member Application V";
                    }

                    action("Approved Member Application")
                    {
                        Caption = 'Approved Applications';
                        ApplicationArea = All;
                        RunObject = page "Approved Member Application";
                    }

                    action("Approved Member Application V")
                    {
                        Caption = 'Approved Applications V';
                        ApplicationArea = All;
                        RunObject = page "Approved Member Application V";
                    }

                    action("Rejected Member Application")
                    {
                        Caption = 'Rejected Applications';
                        ApplicationArea = All;
                        RunObject = page "Rejected Member Application";
                    }

                    action("Rejected Member Application V")
                    {
                        Caption = 'Rejected Applications V';
                        ApplicationArea = All;
                        RunObject = page "Rejected Member Application V";
                    }
                }

                group(VirtualMember)
                {
                    Caption = 'Virtual Member';

                    action("Open Member Application")
                    {
                        Caption = 'Open Applications';
                        ApplicationArea = All;
                        RunObject = page "Virtual Registrations List";
                    }
                }

                group(GroupMember)
                {
                    Caption = 'Member Groups';

                    action("Member Group Application")
                    {
                        Caption = 'Create Application';
                        ApplicationArea = All;
                        RunObject = page "Member Application Group";
                    }

                    action("Member Group Application List")
                    {
                        Caption = 'View Applications';
                        ApplicationArea = All;
                        RunObject = page "Member Application Group List";
                    }
                }

                group(MicroMember)
                {
                    Caption = 'Micro Member';

                    action("Micro Member Application")
                    {
                        Caption = 'Create Application';
                        ApplicationArea = All;
                        RunObject = page "Micro Member Application";
                    }

                    action("Micro Member Application List")
                    {
                        Caption = 'View Applications';
                        ApplicationArea = All;
                        RunObject = page "Micro Member Application List";
                    }
                }
            }

            group(SavingsAccounts)
            {
                Caption = 'Savings Accounts';
                action(SavingsAccountApplication)
                {
                    Caption = 'Create Application';
                    RunObject = Page "Savings Account Application";
                    ApplicationArea = All;
                }

                action(SavingsAccountList)
                {
                    Caption = 'View List';
                    RunObject = Page "Savings Account List";
                    ApplicationArea = All;
                }
            }

            group(Agents)
            {
                Caption = 'Agents';

                action(AgentsMembershipApplication)
                {
                    Caption = 'Create Application';
                    RunObject = Page "Agent Membership Application";
                    ApplicationArea = All;
                }
                action(AgentsMembershipApplicationList)
                {
                    Caption = 'View Application List';
                    RunObject = Page "Agent Membership Applic. List";
                    ApplicationArea = All;
                }
            }
        }

        area(Embedding)
        {
            action("Open Normal Member Application List")
            {
                Caption = 'Normal Member Applications';
                ApplicationArea = All;
                RunObject = page "Open Member Application List";
            }
            action("Open Virtual Member Application")
            {
                Caption = 'Virtual Member Applications';
                ApplicationArea = All;
                RunObject = page "Virtual Registrations List";
            }
            action("Open Member Group Application List")
            {
                Caption = 'Member Group Applications';
                ApplicationArea = All;
                RunObject = page "Member Application Group List";
            }
            action(SavingAccountsApplication)
            {
                Caption = 'Savings Account Application';
                RunObject = Page "Savings Account List";
                ApplicationArea = All;
            }
            action(OpenAgentsMembershipApplicationList)
            {
                Caption = 'Agents Applications';
                RunObject = Page "Agent Membership Applic. List";
                ApplicationArea = All;
            }
        }

        // area(Processing)
        // {
        //     action(SeeSalesInvoices)
        //     {
        //         Caption = 'See Sales Invoices';
        //         RunObject = Page "Posted Sales Invoices";
        //         ApplicationArea = All;
        //     }

        // }

        // area(Creation)
        // {
        //     action(AddSalesInvoice)
        //     {
        //         Caption = 'Add Sales Invoice';
        //         Image = NewInvoice;
        //         RunObject = Page "Sales Invoice";
        //         RunPageMode = Create;
        //         ApplicationArea = All;
        //     }
        // }

        // area(Reporting)
        // {
        //     action(SalesInvoicesReport)
        //     {
        //         Caption = 'Sales Invoices Report';
        //         Image = "Report";
        //         RunObject = Report "Standard Sales - Invoice";
        //         ApplicationArea = All;
        //     }
        // }
    }
}

profile RegistryProfile
{
    ProfileDescription = 'SACCO Registry Profile';
    RoleCenter = RegistryRoleCenterPage;
    Caption = 'SACCO Registry';
}