#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186404 tableextension52186404 extends Vendor 
{
    fields
    {
        field(50000;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(50145;"Vendor Credit Limit(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50146;"Requisition Default Vendor";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50147;"Vendor Retention Account";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No." where (Retention=const(true));
        }
        field(50148;Retention;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50149;"Vendor Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Implementing Partner,Institution,Source of Funds,External Loans,Landlord,Advocate,SinkFund,Asset Finance';
            OptionMembers = " ","Implementing Partner",Institution,"Source of Funds","External Loans",Landlord,Advocate,SinkFund,"Asset Finance";
        }
        field(50150;Trainers;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50151;"KRA Pin No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                if Rec."KRA Pin No." = '' then exit;
                Vend.Reset;
                Vend.SetFilter("No.",'<>%1',Rec."No.");
                Vend.SetRange("KRA Pin No.",Rec."KRA Pin No.");
                if Vend.FindSet then Error('PIN No. already used by vendor %1',Vend.Name);
            end;
        }
        field(50152;"P.O.Box Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50153;"Physical Address.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }
}
