page 52185711 "Product Factory List"
{
    CardPageID = "Product Factory";
    DataCaptionFields = "Product ID", "Product Description";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Product Factory";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product ID";Rec."Product ID")
                {
                }
                field("Product Description";Rec."Product Description")
                {
                }
                field("Product Category";Rec."Product Category")
                {
                }
                field("Interest Rate (Min.)";Rec."Interest Rate (Min.)")
                {
                }
                field("Interest Rate (Max.)";Rec."Interest Rate (Max.)")
                {
                }
                field("Ordinary Default Intallments";Rec."Ordinary Default Intallments")
                {
                }
                field("Loan Interest Account [G/L]";Rec."Loan Interest Account [G/L]")
                {
                }
                field("Minimum Guarantors";Rec."Minimum Guarantors")
                {
                }
                field("Repay Mode";Rec."Repay Mode")
                {
                }
                field("Maximum Loan Amount";Rec."Maximum Loan Amount")
                {
                }
                field("Minimum Loan Amount";Rec."Minimum Loan Amount")
                {
                }
                field("Repayment Frequency";Rec."Repayment Frequency")
                {
                }
                field("Nature of Loan Type";Rec."Nature of Loan Type")
                {
                }
                field("Product Class Type";Rec."Product Class Type")
                {
                }
                field("Loan Span";Rec."Loan Span")
                {
                }
                field(Category;Rec.Category)
                {
                }
                field("Sort Order";Rec."Sort Order")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; MyNotes)
            {
            }
            systempart(Control9; Links)
            {
            }
        }
    }

   

    trigger OnOpenPage()
        begin
        //     var
        //     ChangePermission: Record "Status Change Permissions.";
        //     ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
        //     begin
        //         ChangePermission.Reset;
        //         ChangePermission.SetRange("User ID", UserId);
        //         ChangePermission.SetRange("Edit Setup", true);
        //         ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::Administrator);
        //         if not ChangePermission.Find('-') then begin
        //             Error(ErrorOnRestrictViewTxt, UserId, TableCaption);
        //         end;
        //     end;
        end;    

}
