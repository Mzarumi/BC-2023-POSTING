#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187000 pageextension52187000 extends "Job Project Manager RC"
{
    Caption = 'Role Center';
    layout
    {

        //Unsupported feature: Property Modification (Level) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Modification (Name) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Modification (PagePartID) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Modification (Level) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Modification (Level) on "Control21(Control 21)".


        //Unsupported feature: Property Modification (Level) on "Control1901377608(Control 1901377608)".

        modify(Control102)
        {
            Visible = false;
        }
        modify(Control33)
        {
            Visible = false;
        }
        modify(Control34)
        {
            Visible = false;
        }
        modify("Job Actual Price to Budget Price")
        {
            Visible = false;
        }
        modify("Job Profitability")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Job Actual Cost to Budget Cost"(Control 28)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Deletion (Visible) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Deletion (Enabled) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Deletion (Editable) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control21(Control 21)".

        modify(Control31)
        {
            Visible = false;
        }
        modify(Control77)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901377608(Control 1901377608)".


        //Unsupported feature: Property Deletion (Visible) on "Control1901377608(Control 1901377608)".

        addfirst(RoleCenter)
        {
            group(Control1900724808)
            {
                part(Control1904661108; "Project Manager Activities")
                {
                }
            }
            group(Control1900724708)
            {
            }
        }
        // addfirst(Control21)
        // {
        //     part(Control1903012608;"Copy Profile")
        //     {
        //     }
        // }
        // moveafter(Control1900000008;Control1907692008)
    }
    actions
    {
        modify(Jobs)
        {
            ApplicationArea = Basic;
        }
        modify(JobsOnOrder)
        {

            //Unsupported feature: Property Modification (Name) on "JobsOnOrder(Action 53)".

            Caption = 'On Order';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageView) on "JobsOnOrder(Action 53)".

        }
        modify(JobsPlannedAndQuoted)
        {

            //Unsupported feature: Property Modification (Name) on "JobsPlannedAndQuoted(Action 54)".

            ApplicationArea = Basic;
        }
        modify(JobsCompleted)
        {

            //Unsupported feature: Property Modification (Name) on "JobsCompleted(Action 35)".

            ApplicationArea = Basic;
        }
        modify(JobsUnassigned)
        {

            //Unsupported feature: Property Modification (Name) on "JobsUnassigned(Action 55)".

            ApplicationArea = Basic;
        }
        modify("Job Tasks")
        {
            ApplicationArea = Basic;
        }
        modify(Customers)
        {
            ApplicationArea = Basic;
        }
        modify(Items)
        {
            ApplicationArea = Basic;
        }
        modify(Resources)
        {
            ApplicationArea = Basic;
        }
        modify("Sales & Purchases")
        {

            //Unsupported feature: Property Modification (ActionType) on ""Sales & Purchases"(Action 17)".

            Caption = 'Tasks';

            //Unsupported feature: Property Modification (Name) on ""Sales & Purchases"(Action 17)".


            //Unsupported feature: Property Insertion (IsHeader) on ""Sales & Purchases"(Action 17)".

        }
        modify("Sales Invoices")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales Invoices"(Action 37)".

            ApplicationArea = Basic;
        }
        modify("Sales Credit Memos")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales Credit Memos"(Action 38)".

            ApplicationArea = Basic;
        }
        modify("Purchase Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Purchase Orders"(Action 39)".

            ApplicationArea = Basic;
        }
        modify("Purchase Invoices")
        {

            //Unsupported feature: Property Modification (Level) on ""Purchase Invoices"(Action 40)".

            ApplicationArea = Basic;
        }
        modify("Purchase Credit Memos")
        {

            //Unsupported feature: Property Modification (Level) on ""Purchase Credit Memos"(Action 41)".

            ApplicationArea = Basic;
        }
        // modify(ActionGroup2)
        // {

        //     //Unsupported feature: Property Modification (ActionType) on "ActionGroup2(Action 2)".

        //     Caption = 'C&hange Job Planning Line Date';

        //     //Unsupported feature: Property Modification (Image) on "ActionGroup2(Action 2)".


        //     //Unsupported feature: Property Modification (Name) on "ActionGroup2(Action 2)".


        //     //Unsupported feature: Property Insertion (RunObject) on "ActionGroup2(Action 2)".

        //     ApplicationArea = Basic;
        // }
        modify(Action3)
        {

            //Unsupported feature: Property Modification (Level) on "Action3(Action 3)".

            Caption = 'Split Pla&nning Lines';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Action3(Action 3)".


            //Unsupported feature: Property Modification (Name) on "Action3(Action 3)".


            //Unsupported feature: Property Insertion (Image) on "Action3(Action 3)".

        }
        modify(JobJournals)
        {

            //Unsupported feature: Property Modification (Name) on "JobJournals(Action 18)".

            ApplicationArea = Basic;
        }
        modify(JobGLJournals)
        {

            //Unsupported feature: Property Modification (Name) on "JobGLJournals(Action 19)".

            ApplicationArea = Basic;
        }
        modify(RecurringJobJournals)
        {

            //Unsupported feature: Property Modification (Name) on "RecurringJobJournals(Action 23)".

            ApplicationArea = Basic;
        }
        modify(ResourceJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ResourceJournals(Action 20)".

            ApplicationArea = Basic;
        }
        modify(RecurringResourceJournals)
        {

            //Unsupported feature: Property Modification (Name) on "RecurringResourceJournals(Action 46)".

            ApplicationArea = Basic;
        }
        modify(ItemJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemJournals(Action 22)".

            ApplicationArea = Basic;
        }
        modify(RecurringItemJournals)
        {

            //Unsupported feature: Property Modification (Name) on "RecurringItemJournals(Action 47)".

            ApplicationArea = Basic;
        }
        modify("Posted Shipments")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Sales Invoices")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Sales Credit Memos")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Purchase Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Purchase Invoices")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Purchase Credit Memos")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Registers")
        {
            ApplicationArea = Basic;
        }
        modify(Action74)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Action74(Action 74)".

        }
        modify("Item Registers")
        {
            ApplicationArea = Basic;
        }
        modify(Action76)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Action76(Action 76)".

        }
        modify("Job G/L &Journal")
        {

            //Unsupported feature: Property Modification (Level) on ""Job G/L &Journal"(Action 52)".

            Caption = 'Jobs per &Item';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Job G/L &Journal"(Action 52)".


            //Unsupported feature: Property Modification (Image) on ""Job G/L &Journal"(Action 52)".


            //Unsupported feature: Property Modification (Name) on ""Job G/L &Journal"(Action 52)".

        }
        modify("R&esource Journal")
        {

            //Unsupported feature: Property Modification (Level) on ""R&esource Journal"(Action 51)".

            Caption = 'Items per &Job';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""R&esource Journal"(Action 51)".


            //Unsupported feature: Property Modification (Image) on ""R&esource Journal"(Action 51)".


            //Unsupported feature: Property Modification (Name) on ""R&esource Journal"(Action 51)".

        }
        modify("Job &Create Sales Invoice")
        {

            //Unsupported feature: Property Modification (Level) on ""Job &Create Sales Invoice"(Action 48)".

            Caption = 'Job Actual To &Budget';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Job &Create Sales Invoice"(Action 48)".


            //Unsupported feature: Property Modification (Image) on ""Job &Create Sales Invoice"(Action 48)".


            //Unsupported feature: Property Modification (Name) on ""Job &Create Sales Invoice"(Action 48)".

        }
        modify("Update Job I&tem Cost")
        {

            //Unsupported feature: Property Modification (Level) on ""Update Job I&tem Cost"(Action 49)".

            Caption = 'Job Su&ggested Billing';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Update Job I&tem Cost"(Action 49)".


            //Unsupported feature: Property Modification (Name) on ""Update Job I&tem Cost"(Action 49)".

        }
        // modify(Reports)
        // {

        //     //Unsupported feature: Property Modification (ActionType) on "Reports(Action 50)".

        //     Caption = 'Jobs per &Customer';

        //     //Unsupported feature: Property Modification (Name) on "Reports(Action 50)".


        //     //Unsupported feature: Property Insertion (RunObject) on "Reports(Action 50)".


        //     //Unsupported feature: Property Insertion (Image) on "Reports(Action 50)".

        //     ApplicationArea = Basic;
        // }

        //Unsupported feature: Property Modification (Level) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Modification (ActionType) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Modification (Name) on ""Job &Analysis"(Action 29)".

        // modify("Job Actual To &Budget")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Job Actual To &Budget"(Action 26)".

        //     Caption = 'Job - Pla&nning Line';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on ""Job Actual To &Budget"(Action 26)".


        //     //Unsupported feature: Property Modification (Name) on ""Job Actual To &Budget"(Action 26)".

        // }
        modify("Job - Pla&nning Line")
        {

            //Unsupported feature: Property Modification (Level) on ""Job - Pla&nning Line"(Action 25)".

            Caption = 'Job &Analysis';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Job - Pla&nning Line"(Action 25)".


            //Unsupported feature: Property Modification (Name) on ""Job - Pla&nning Line"(Action 25)".

        }
        // modify(Action16)
        // {

        //     //Unsupported feature: Property Modification (Level) on "Action16(Action 16)".


        //     //Unsupported feature: Property Modification (ActionType) on "Action16(Action 16)".


        //     //Unsupported feature: Property Modification (Name) on "Action16(Action 16)".

        //     Caption = 'R&esource Journal';

        //     //Unsupported feature: Property Insertion (RunObject) on "Action16(Action 16)".


        //     //Unsupported feature: Property Insertion (Image) on "Action16(Action 16)".

        //     ApplicationArea = Basic;
        // }
        // modify("Job Su&ggested Billing")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Job Su&ggested Billing"(Action 15)".

        //     Caption = 'Job G/L &Journal';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on ""Job Su&ggested Billing"(Action 15)".


        //     //Unsupported feature: Property Modification (Image) on ""Job Su&ggested Billing"(Action 15)".


        //     //Unsupported feature: Property Modification (Name) on ""Job Su&ggested Billing"(Action 15)".

        // }
        // modify("Jobs per &Customer")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Jobs per &Customer"(Action 14)".

        //     Caption = 'Job J&ournal';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on ""Jobs per &Customer"(Action 14)".


        //     //Unsupported feature: Property Modification (Image) on ""Jobs per &Customer"(Action 14)".


        //     //Unsupported feature: Property Modification (Name) on ""Jobs per &Customer"(Action 14)".

        // }
        modify("Items per &Job")
        {

            //Unsupported feature: Property Modification (Level) on ""Items per &Job"(Action 8)".

            Caption = 'Update Job I&tem Cost';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Items per &Job"(Action 8)".


            //Unsupported feature: Property Modification (Name) on ""Items per &Job"(Action 8)".

        }
        modify("Jobs per &Item")
        {

            //Unsupported feature: Property Modification (Level) on ""Jobs per &Item"(Action 6)".

            Caption = 'Job &Create Sales Invoice';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Jobs per &Item"(Action 6)".


            //Unsupported feature: Property Modification (Image) on ""Jobs per &Item"(Action 6)".


            //Unsupported feature: Property Modification (Name) on ""Jobs per &Item"(Action 6)".

        }
        modify("Manager Time Sheet by Job")
        {

            //Unsupported feature: Property Modification (Level) on ""Manager Time Sheet by Job"(Action 1)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Level) on "Action5(Action 5)".


        //Unsupported feature: Property Modification (Level) on "Action7(Action 7)".

        modify("Job Calculate &WIP")
        {

            //Unsupported feature: Property Modification (Level) on ""Job Calculate &WIP"(Action 9)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on ""Job Calculate &WIP"(Action 9)".

        }
        modify("Jo&b Post WIP to G/L")
        {

            //Unsupported feature: Property Modification (Level) on ""Jo&b Post WIP to G/L"(Action 10)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on ""Jo&b Post WIP to G/L"(Action 10)".

        }
        modify("Job WIP")
        {

            //Unsupported feature: Property Modification (Level) on ""Job WIP"(Action 27)".

            Caption = 'Job WIP Cockpit';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Job WIP"(Action 27)".

        }
        modify("Navi&gate")
        {

            //Unsupported feature: Property Modification (Level) on ""Navi&gate"(Action 24)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Jobs(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on "JobsOnOrder(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on "JobsPlannedAndQuoted(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "JobsCompleted(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "JobsUnassigned(Action 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Tasks"(Action 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Customers(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Items(Action 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Resources(Action 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Invoices"(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Credit Memos"(Action 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Orders"(Action 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Invoices"(Action 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Credit Memos"(Action 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ActionGroup2(Action 2)".

        modify(Action90)
        {
            Visible = false;
        }
        modify(Open)
        {
            Visible = false;
        }
        modify(JobsPlannedAndQuotd)
        {
            Visible = false;
        }
        modify(JobsComplet)
        {
            Visible = false;
        }
        modify(JobsUnassign)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Action3(Action 3)".


        //Unsupported feature: Property Deletion (Promoted) on "Action3(Action 3)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Action3(Action 3)".

        modify("Job Registers")
        {
            Visible = false;
        }
        modify("Job Planning Lines")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "JobJournals(Action 18)".


        //Unsupported feature: Property Deletion (Promoted) on "JobJournals(Action 18)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "JobJournals(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "JobGLJournals(Action 19)".


        //Unsupported feature: Property Deletion (Promoted) on "JobGLJournals(Action 19)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "JobGLJournals(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RecurringJobJournals(Action 23)".


        //Unsupported feature: Property Deletion (Promoted) on "RecurringJobJournals(Action 23)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "RecurringJobJournals(Action 23)".

        // modify(ActionGroup91)
        // {
        //     Visible = false;
        // }
        // modify(Action93)
        // {
        //     Visible = false;
        // }
        // modify("Resource Groups")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "ResourceJournals(Action 20)".


        //Unsupported feature: Property Deletion (Promoted) on "ResourceJournals(Action 20)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ResourceJournals(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RecurringResourceJournals(Action 46)".


        //Unsupported feature: Property Deletion (Promoted) on "RecurringResourceJournals(Action 46)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "RecurringResourceJournals(Action 46)".

        modify("Resource Registers")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Journals(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemJournals(Action 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RecurringItemJournals(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Documents"(Action 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Shipments"(Action 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Invoices"(Action 68)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Credit Memos"(Action 69)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Purchase Receipts"(Action 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Purchase Invoices"(Action 71)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Purchase Credit Memos"(Action 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Registers"(Action 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action74(Action 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Registers"(Action 75)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action76(Action 76)".

        modify(SetupAndExtensions)
        {
            Visible = false;
        }
        modify("Assisted Setup")
        {
            Visible = false;
        }
        modify("Manual Setup")
        {
            Visible = false;
        }
        // modify(General)
        // {
        //     Visible = false;
        // }
        // modify(Finance)
        // {
        //     Visible = false;
        // }
        // modify(Sales)
        // {
        //     Visible = false;
        // }
        // modify(Purchasing)
        // {
        //     Visible = false;
        // }
        // modify(JobSetup)
        // {
        //     Visible = false;
        // }
        // modify("Fixed Assets")
        // {
        //     Visible = false;
        // }
        // modify(HR)
        // {
        //     Visible = false;
        // }
        // modify(Inventory)
        // {
        //     Visible = false;
        // }
        // modify(Service)
        // {
        //     Visible = false;
        // }
        //modify(System)
        // {
        //     Visible = false;
        // }
        // modify("Relationship Management")
        // {
        //     Visible = false;
        // }
        // modify(Intercompany)
        // {
        //     Visible = false;
        // }
        modify("Service Connections")
        {
            Visible = false;
        }
        modify(Extensions)
        {
            Visible = false;
        }
        modify(Workflows)
        {
            Visible = false;
        }
        modify(NewGroup)
        {
            Visible = false;
        }
        modify("Page Job")
        {
            Visible = false;
        }
        modify("Job J&ournal")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Job G/L &Journal"(Action 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job G/L &Journal"(Action 52)".


        //Unsupported feature: Property Deletion (Promoted) on ""Job G/L &Journal"(Action 52)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Job G/L &Journal"(Action 52)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""R&esource Journal"(Action 51)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""R&esource Journal"(Action 51)".


        //Unsupported feature: Property Deletion (Promoted) on ""R&esource Journal"(Action 51)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""R&esource Journal"(Action 51)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Job &Create Sales Invoice"(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job &Create Sales Invoice"(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Update Job I&tem Cost"(Action 49)".

        modify("Job Reports")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Deletion (RunObject) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Deletion (Image) on ""Job &Analysis"(Action 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Actual To &Budget"(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job - Pla&nning Line"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Su&ggested Billing"(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Jobs per &Customer"(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Items per &Job"(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Jobs per &Item"(Action 6)".

        modify("Absence Reports")
        {
            Visible = false;
        }
        modify("Employee - Staff Absences")
        {
            Visible = false;
        }
        modify("Employee - Absences by Causes")
        {
            Visible = false;
        }
        modify(Manage)
        {
            Visible = false;
        }
        modify(Timesheet)
        {
            Visible = false;
        }
        modify("Create Time Sheets")
        {
            Visible = false;
        }
        modify("Manage Time Sheets")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Manager Time Sheet by Job"(Action 1)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Manager Time Sheet by Job"(Action 1)".

        modify(WIP)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Calculate &WIP"(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Jo&b Post WIP to G/L"(Action 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job WIP"(Action 27)".

        modify(History)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Navi&gate"(Action 24)".

        addfirst(reporting)
        {
        }
        addafter(Resources)
        {
            // action("Resource Groups")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Resource Groups';
            //     RunObject = Page "Resource Groups";
            // }
        }
        addafter(Customers)
        {
            action("Time Sheets")
            {
                ApplicationArea = Basic;
                Caption = 'Time Sheets';
                RunObject = Page "Time Sheet List";
            }
        }
        // addafter(ActionGroup2)
        // {
        //     separator(Action11)
        //     {
        //         Caption = 'History';
        //         IsHeader = true;
        //     }
        // }
        // moveafter(;"Job - Pla&nning Line")
        // moveafter("Job &Analysis";"Job &Create Sales Invoice")
        // moveafter("Job Actual To &Budget";"Job Actual To &Budget")
        // moveafter("Job - Pla&nning Line";"Job &Analysis")
        // moveafter(Action29;"Update Job I&tem Cost")
        // moveafter("Jobs per &Customer";"R&esource Journal")
        // moveafter("Items per &Job";"Job G/L &Journal")
        // moveafter("Job Tasks";"Sales Invoices")
        // moveafter("Purchase Credit Memos";Resources)
        // moveafter(Resources;Items)
        // moveafter(ActionContainer1900000012;Journals)
        // moveafter(Journals;JobJournals)
        // moveafter("Job G/L Journals";ResourceJournals)
        // moveafter("Resource Journals";ItemJournals)
        // moveafter("Item Journals";RecurringJobJournals)
        // moveafter("Recurring Job Journals";RecurringResourceJournals)
        // moveafter("Recurring Resource Journals";RecurringItemJournals)
        // moveafter(Action17;"Jobs per &Customer")
        // moveafter("Job J&ournal";"Job Su&ggested Billing")
        // moveafter("Job G/L &Journal";Action16)
        // moveafter("Split Pla&nning Lines";"Manager Time Sheet by Job")
        moveafter(Action5; "Jobs per &Item")
        moveafter("Job &Create Sales Invoice"; Action7)
        moveafter("Update Job I&tem Cost"; "Job WIP")
    }
}

