table 52185962 Verdict
{

    fields
    {
        field(1; "Case No"; Code[20])
        {
        }
        field(2; No; Code[20])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Date; Date)
        {
        }
        field(5; "No. Series"; Code[20])
        {
        }
        field(6; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Case No", No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*IF No = '' THEN
        BEGIN
          GLSetup.GET;
         // GLSetup.TESTFIELD(GLSetup.Verdict");
          //NoSeriesMgtInitSeries(GLSetup.Verdict,xRec."No. Series",0D,No,"No. Series");
        END;
        */

    end;

    var
        GLSetup: Record "General Ledger Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

