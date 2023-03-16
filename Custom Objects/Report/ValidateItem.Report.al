#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185448 "Validate Item"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Validate Item.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = where("Product Type" = filter(04), "Product Category" = filter(Benevolent));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*Prodfac.RESET;
                Prodfac.SETRANGE(Prodfac."Product ID","Savings Accounts"."Product Type");
                IF Prodfac.FIND('-') THEN BEGIN
                
                "Savings Accounts"."Product Name":=Prodfac."Product Description";
                "Savings Accounts"."Customer Posting Group":=Prodfac."Product Posting Group";
                "Savings Accounts".MODIFY;
                END;
                */

                "Savings Accounts"."Monthly Contribution" := 200;
                "Savings Accounts".Modify;

            end;
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

    labels
    {
    }

    var
        Prodfac: Record 52185690;
        memb: Record "Members";
}
