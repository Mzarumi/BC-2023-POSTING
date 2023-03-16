#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185676 pageextension52185676 extends "Bank Acc. Reconciliation Lines" 
{
    layout
    {
        modify("Transaction Date")
        {
            ApplicationArea = Basic;
        }
        modify("Value Date")
        {
            ApplicationArea = Basic;
        }
        modify("Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Check No.")
        {
            ApplicationArea = Basic;
        }
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Statement Amount")
        {
            ApplicationArea = Basic;
        }
        modify(Difference)
        {
            ApplicationArea = Basic;
        }
        modify("Applied Entries")
        {
            ApplicationArea = Basic;
        }
        modify("Related-Party Name")
        {
            ApplicationArea = Basic;
        }
        modify("Additional Transaction Info")
        {
            ApplicationArea = Basic;
        }
        modify(Control13)
        {
            ApplicationArea = Basic;
        }
        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify(TotalBalance)
        {
            ApplicationArea = Basic;
        }
        modify(TotalDiff)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Transaction Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Value Date"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Check No."(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Type(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 6)".


        //Unsupported feature: Code Insertion on ""Statement Amount"(Control 8)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            TESTFIELD(Imported,FALSE);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Statement Amount"(Control 8)".

        modify("Applied Amount")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Applied Amount"(Control 10)".



        //Unsupported feature: Code Insertion on "Difference(Control 12)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            TESTFIELD(Imported,FALSE);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Difference(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applied Entries"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Related-Party Name"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Additional Transaction Info"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalDiff(Control 19)".

    }
    actions
    {
        modify(ShowStatementLineDetails)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageLink) on "ShowStatementLineDetails(Action 9)".

        }
        modify(ApplyEntries)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "ShowStatementLineDetails(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ApplyEntries(Action 11)".

    }


    //Unsupported feature: Code Modification on "OnDeleteRecord".

    //trigger OnDeleteRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetUserInteractions;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetUserInteractions;
        //IF Imported = TRUE THEN ERROR('System can not allow deletion of Imported Statement Lines, import the bank statement');
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "GetSelectedRecords(PROCEDURE 4)".


    //Unsupported feature: Property Deletion (Attributes) on "ToggleMatchedFilter(PROCEDURE 1)".

}
