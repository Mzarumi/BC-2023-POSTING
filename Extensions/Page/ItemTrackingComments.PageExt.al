#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186755 pageextension52186755 extends "Item Tracking Comments" 
{
    layout
    {
        modify(Date)
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Date(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 4)".

    }
}
