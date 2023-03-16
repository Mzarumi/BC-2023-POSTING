#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185934 "Item Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Item Report.rdlc';

    dataset
    {
        dataitem("Item Ledger Entry";"Item Ledger Entry")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompName;company.Name)
            {
            }
            column(CompPic;company.Picture)
            {
            }
            column(positive;addi)
            {
            }
            column(negative;minus)
            {
            }
            column(qumulative;qumulative)
            {
            }
            column(Item_No;"Item Ledger Entry"."Item No.")
            {
            }
            column(PostingDate;"Item Ledger Entry"."Posting Date")
            {
            }
            column(EntryType;"Item Ledger Entry"."Entry Type")
            {
            }
            column(ItemName;ItemName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                addi:=0;
                minus:=0;

                if "Item Ledger Entry".Quantity>0 then
                  addi:="Item Ledger Entry".Quantity;

                if "Item Ledger Entry".Quantity<0 then
                  minus:="Item Ledger Entry".Quantity;

                qumulative:=qumulative+"Item Ledger Entry".Quantity;

                itemtable.Reset;
                itemtable.SetRange("No.","Item Ledger Entry"."Item No.");
                if itemtable.FindFirst then
                  ItemName:=itemtable.Description;
            end;

            trigger OnPreDataItem()
            begin
                company.Get;
                company.CalcFields(Picture);
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
        addi: Decimal;
        minus: Decimal;
        qumulative: Decimal;
        company: Record "Company Information";
        itemtable: Record Item;
        ItemName: Text;
}
