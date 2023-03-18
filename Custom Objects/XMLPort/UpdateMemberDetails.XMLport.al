#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185531 "Update Member Details"
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(meb)
        {
            tableelement(Members; Members)
            {
                AutoUpdate = true;
                XmlName = 'Member';
                fieldelement(MemberNo; Members."No.")
                {
                }
                fieldelement(Salutation; Members.Salutation)
                {
                }
                fieldelement(FirstName; Members."First Name")
                {
                }
                fieldelement(SecondName; Members."Second Name")
                {
                }
                fieldelement(LastName; Members."Last Name")
                {
                }
                fieldelement(Name; Members.Name)
                {
                }
                fieldelement(IDNo; Members."ID No.")
                {
                }
                fieldelement(PINNumber; Members."P.I.N Number")
                {
                }
                fieldelement(DateofBirth; Members."Date of Birth")
                {
                }
                fieldelement(PayrollNumber; Members."Payroll/Staff No.")
                {
                    FieldValidate = no;
                }
                fieldelement(OfficePhoneNumber; Members."Office Telephone No.")
                {
                }
                fieldelement(MobilePhoneNumber; Members."Mobile Phone No")
                {
                }
                fieldelement(Gender; Members.Gender)
                {
                }

                trigger OnAfterModifyRecord()
                begin
                    Members."Office Telephone No." := '';
                    Members."Mobile Phone No" := '';
                    Members."Phone No." := '';
                    Members.Modify;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin

        Message('Member Details Update Complete');
    end;

    var
        Memberss: Record Members;
}
