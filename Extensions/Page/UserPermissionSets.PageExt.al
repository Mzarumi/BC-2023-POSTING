#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187208 pageextension52187208 extends "User Permission Sets" 
{
    layout
    {
        modify(UserSecurityID)
        {

            //Unsupported feature: Property Modification (Name) on "UserSecurityID(Control 6)".

            ApplicationArea = Basic;
        }
        modify(PermissionSet)
        {

            //Unsupported feature: Property Modification (Name) on "PermissionSet(Control 3)".

            ApplicationArea = Basic;
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Name) on "Description(Control 4)".

            ApplicationArea = Basic;
        }
        modify(Company)
        {

            //Unsupported feature: Property Modification (Name) on "Company(Control 5)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "UserSecurityID(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PermissionSet(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Company(Control 5)".

    }
    actions
    {
        modify(Permissions)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Permissions(Action 9)".

    }
}
