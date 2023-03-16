#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187220 pageextension52187220 extends "User Personalization FactBox" 
{

    //Unsupported feature: Property Modification (Name) on ""User Personalization FactBox"(Page 9821)".

    Caption = 'Permission Sets';

    //Unsupported feature: Property Modification (SourceTable) on ""User Personalization FactBox"(Page 9821)".


    //Unsupported feature: Property Modification (PageType) on ""User Personalization FactBox"(Page 9821)".

    layout
    {
        modify("Profile ID")
        {

            //Unsupported feature: Property Modification (ControlType) on ""Profile ID"(Control 2)".

            Caption = 'Permission Set';

            //Unsupported feature: Property Modification (Name) on ""Profile ID"(Control 2)".


            //Unsupported feature: Property Insertion (GroupType) on ""Profile ID"(Control 2)".

        }
        modify("Language ID")
        {

            //Unsupported feature: Property Modification (Level) on ""Language ID"(Control 3)".

            Caption = 'Permission Set';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Language ID"(Control 3)".


            //Unsupported feature: Property Modification (Name) on ""Language ID"(Control 3)".

           //Editable = RoleIDEditable;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Profile ID"(Control 2)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Profile ID"(Control 2)".


        //Unsupported feature: Property Deletion (SourceExpr) on ""Profile ID"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Language ID"(Control 3)".

        modify("Locale ID")
        {
            Visible = false;
        }
        modify(Company)
        {
            Visible = false;
        }
        modify("Time Zone")
        {
            Visible = false;
        }
//         addfirst("Language ID")
//         {
//             field(Name;Name)
//             {
//                 ApplicationArea = Basic;
//             }
//             field(Version;Scope)
//             {
//                 ApplicationArea = Basic;
// //             }
// Page "Permission Set by User";
// Page "Permission Set by User Group";
// Page "User by User Group";
// Page ""User ;""

           // }
       // }
    }
}