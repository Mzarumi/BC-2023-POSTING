#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186406 tableextension52186406 extends "Sales Header" 
{
    fields
    {
        field(825;"Authorization Required";Boolean)
        {
            Caption = 'Authorization Required';
            DataClassification = ToBeClassified;
        }
        field(827;"Credit Card No.";Code[20])
        {
            Caption = 'Credit Card No.';
            DataClassification = ToBeClassified;
            TableRelation = "DO Payment Credit Card" where ("Customer No."=field("Bill-to Customer No."));

            trigger OnValidate()
            var
                DOPaymentTransLogEntry: Record "DO Payment Trans. Log Entry";
            begin
               

                if Rec."Credit Card No." = '' then
                  exit;

                // DOPaymentMgt.CheckCreditCardData(Rec."Credit Card No.");

                // if not DOPaymentMgt.IsValidPaymentMethod(Rec."Payment Method Code") then
                //   Rec.FieldError(Rec."Payment Method Code");
            end;
        }
        field(39005544;Cancelled;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39005545;"Cancelled By";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005546;"Cancelled Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39005547;"Created By";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005548;"Created Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(39005549;"Lease No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        // DOPaymentTransLogMgt: Codeunit UnknownCodeunit829;
        DOPaymentMgt: Codeunit "Sales Post Invoice Events";
}
