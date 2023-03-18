#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187066 pageextension52187066 extends "User Personalization Card" 
{
    layout
    {
        modify("User ID")
        {
            ApplicationArea = Basic;
        }
        // modify(ProfileID)
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ProfileID(Control 6)".


        //     //Unsupported feature: Property Modification (Name) on "ProfileID(Control 6)".

        // }
        modify("Language ID")
        {
            ApplicationArea = Basic;
        }
        // modify("Locale ID")
        // {
        //     ToolTip = 'Note: This setting does not affect the windows client.';
        //     ApplicationArea = Basic;
        // }
        // modify("Time Zone")
        // {
        //     ToolTip = 'Select the Time Zone setting that controls time and date. This setting does not apply to the Windows client.';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (TableRelation) on ""Time Zone"(Control 3)".

        // }
        modify(Company)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 4)".

        modify(ProfileID)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (DrillDown) on "ProfileID(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ProfileID(Control 6)".


        //Unsupported feature: Property Deletion (Editable) on "ProfileID(Control 6)".


        //Unsupported feature: Code Insertion (VariableCollection) on ""Language ID"(Control 8).OnLookup".

        //trigger (Variable: ApplicationManagement)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Language ID"(Control 8).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
            /*
            LanguageManagement.LookupApplicationLanguage("Language ID");

            IF "Language ID" <> xRec."Language ID" THEN BEGIN
              VALIDATE("Language ID","Language ID");
              SetRestartRequiredIfChangeIsForCurrentUser;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ApplicationManagement.LookupApplicationlLanguage("Language ID");

            IF "Language ID" <> xRec."Language ID" THEN
              VALIDATE("Language ID","Language ID");
            */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Language ID"(Control 8).OnValidate".

        //trigger (Variable: ApplicationManagement)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Language ID"(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            LanguageManagement.ValidateApplicationLanguage("Language ID");
            SetRestartRequiredIfChangeIsForCurrentUser;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ApplicationManagement.ValidateApplicationlLanguage("Language ID");
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Language ID"(Control 8)".

        // modify("Locale ID")
        // {
        //     Visible = false;
        // }
        // modify("Locale ID")
        // {
        //     Visible = false;
        // }
        // modify("Time Zone")
        // {
        //     Visible = false;
        // }
        // modify("Time Zone")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Company(Control 10)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(List)
        {
            ApplicationArea = Basic;
        }
        modify("C&lear Personalized Pages")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""C&lear Personalized Pages"(Action 21)".


        //Unsupported feature: Property Deletion (Promoted) on ""C&lear Personalized Pages"(Action 21)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""C&lear Personalized Pages"(Action 21)".

    }

    var
        //ApplicationManagement: Codeunit ApplicationManagement;

    var
       // ApplicationManagement: Codeunit ApplicationManagement;

    //Unsupported feature: Property Deletion (DelayedInsert).

}
