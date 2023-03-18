#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185499 "Checkoff Buffer"
{
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Checkoff Buffer"; "Checkoff Buffer")
            {
                XmlName = 'CheckoffBuffer';
                fieldelement(No; "Checkoff Buffer".No)
                {
                }
                fieldelement(CheckoffNo; "Checkoff Buffer"."Checkoff No")
                {
                }
                fieldelement(UploadNo; "Checkoff Buffer"."Upload No.")
                {
                }
                fieldelement(Name; "Checkoff Buffer".Name)
                {
                }
                fieldelement(EmployerCode; "Checkoff Buffer"."Employer Code")
                {
                }
                fieldelement(LoanNo; "Checkoff Buffer"."Loan No")
                {
                }
                fieldelement(Amount; "Checkoff Buffer".Amount)
                {
                }
                fieldelement(Interest; "Checkoff Buffer".Interest)
                {
                    MinOccurs = Zero;
                }
                fieldelement(SearchCode; "Checkoff Buffer"."Search Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Type; "Checkoff Buffer".Type)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Empl; "Checkoff Buffer".Balance)
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterInitRecord()
                begin
                    "Checkoff Buffer"."User Id" := UserId;
                    "Checkoff Buffer"."Upload Response" := Response;
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
        Message(Text01);
    end;

    trigger OnPreXmlPort()
    begin
        // MyComment := Window.InputBox('Enter 1,2 or 3 based on what you are uploading with'
        //                           + '                                                                         1. For Payroll No.                                             '
        //                           + '         2. For Member No.                               '
        //                           + '                   3. For ID No.                                   '
        // + '                                                 ', 'Uplaod Checkoff:', '', 120, 120);


        Evaluate(Response, MyComment);
        if (Response = 1) or (Response = 2) or (Response = 3) then
            "Checkoff Buffer"."Upload Response" := Response
        else
            Error(Error001);
    end;

    var
        // [RunOnClient]
        // Window: dotnet Interaction;
        MyComment: Text;
        Response: Integer;
        Error001: label 'Invalid option, please respond with 1,2 or 3.';
        Text01: label 'Upload done successfully';
}
