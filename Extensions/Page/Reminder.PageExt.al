#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185720 pageextension52185720 extends Reminder 
{
    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Customer No.")
        {
            ApplicationArea = Basic;
        }
        modify(Name)
        {
            ApplicationArea = Basic;
        }
        modify(Address)
        {
            ApplicationArea = Basic;
        }
        modify("Address 2")
        {
            ApplicationArea = Basic;
        }
        modify("Post Code")
        {
            ApplicationArea = Basic;
        }
        modify(City)
        {
            ApplicationArea = Basic;
        }
        modify(Contact)
        {
            ApplicationArea = Basic;
        }
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Document Date")
        {
            ApplicationArea = Basic;
        }
        modify("Reminder Level")
        {
            ApplicationArea = Basic;
        }
        modify("Use Header Level")
        {
            ApplicationArea = Basic;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Reminder Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Fin. Charge Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Due Date")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 51)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer No."(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Address(Control 10)".


        //Unsupported feature: Property Deletion (QuickEntry) on "Address(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Address 2"(Control 12)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Address 2"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post Code"(Control 41)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Post Code"(Control 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on "City(Control 2)".


        //Unsupported feature: Property Deletion (QuickEntry) on "City(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Contact(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reminder Level"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Use Header Level"(Control 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 34)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "ReminderLines(Control 29)".


        //Unsupported feature: Property Deletion (PartType) on "ReminderLines(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reminder Terms Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Fin. Charge Terms Code"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 1 Code"(Control 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 2 Code"(Control 54)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".

        modify(Control9)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(List)
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("C&ustomer")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 25)".

        }
        modify(CreateReminders)
        {
            ApplicationArea = Basic;
        }
        modify(SuggestReminderLines)
        {
            ApplicationArea = Basic;
        }
        modify(UpdateReminderText)
        {
            ApplicationArea = Basic;
        }
        modify(TestReport)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on "TestReport(Action 50)".


            //Unsupported feature: Property Insertion (PromotedCategory) on "TestReport(Action 50)".

        }
        modify(Issue)
        {
            ApplicationArea = Basic;
        }
        modify("Report Statement")
        {

            //Unsupported feature: Property Modification (Name) on ""Report Statement"(Action 1906768606)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Report Statement"(Action 1906768606)".


            //Unsupported feature: Property Modification (Promoted) on ""Report Statement"(Action 1906768606)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Report Statement"(Action 1906768606)".

        }
        // modify("Customer Detailed Aging")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Customer - Order Summary")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Customer - Detail Trial Bal.")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Aged Accounts Receivable")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Customer - Balance to Date")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Customer - Trial Balance")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Customer - Payment Receipt")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""C&ustomer"(Action 37)".


        //Unsupported feature: Property Deletion (Promoted) on ""C&ustomer"(Action 37)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""C&ustomer"(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 3)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 3)".


        //Unsupported feature: Property Deletion (Enabled) on "Dimensions(Action 3)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Dimensions(Action 3)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 25)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Statistics(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CreateReminders(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SuggestReminderLines(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "UpdateReminderText(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TestReport(Action 50)".


        //Unsupported feature: Property Deletion (Visible) on "TestReport(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Issue(Action 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Report Statement"(Action 1906768606)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer Detailed Aging"(Action 1906813206)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer - Order Summary"(Action 1905727106)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer - Detail Trial Bal."(Action 1906871306)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Aged Accounts Receivable"(Action 1900711606)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer - Balance to Date"(Action 1902299006)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer - Trial Balance"(Action 1906359306)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer - Payment Receipt"(Action 1904039606)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetDocNoVisible;
        IsOfficeAddin := OfficeMgt.IsAvailable;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetDocNoVisible;
        */
    //end;

    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
