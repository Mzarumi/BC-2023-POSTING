#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186405 tableextension52186405 extends Item 
{
    fields
    {
        field(50000;"Item G/L Budget Account";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                // Control to prevent Modification once Entry Exist
                //TestNoEntriesExist(FIELDCAPTION("Item G/L Budget Account"));
            end;
        }
        field(50001;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
    }
}
