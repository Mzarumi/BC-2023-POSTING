#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186176 pageextension52186176 extends "Config Templates" 
{

    //Unsupported feature: Property Modification (Name) on ""Config Templates"(Page 1340)".

    layout
    {
        modify("Template Name")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Template Name"(Control 4)".

        modify(Enabled)
        {
            Visible = false;
        }
    }
    actions
    {
        modify(NewCustomerTemplate)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "NewCustomerTemplate(Action 6)".

        }
        modify(NewVendorTemplate)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "NewVendorTemplate(Action 3)".

        }
        modify(NewItemTemplate)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "NewItemTemplate(Action 8)".

        }
        modify(NewConfigTemplate)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "NewConfigTemplate(Action 9)".

        }
        // modify("Edit Template")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (PromotedIsBig) on ""Edit Template"(Action 10)".

        // }

        //Unsupported feature: Property Deletion (PromotedCategory) on "NewCustomerTemplate(Action 6)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "NewCustomerTemplate(Action 6)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "NewVendorTemplate(Action 3)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "NewVendorTemplate(Action 3)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "NewItemTemplate(Action 8)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "NewItemTemplate(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewConfigTemplate(Action 9)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "NewConfigTemplate(Action 9)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "NewConfigTemplate(Action 9)".

        // modify(ActionContainer7)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Code Modification on ""Edit Template"(Action 10).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CASE "Table ID" OF
              DATABASE::Customer:
                BEGIN
                  TempMiniCustomerTemplate.InitializeTempRecordFromConfigTemplate(TempMiniCustomerTemplate,Rec);
                  PAGE.RUN(PAGE::"Cust. Template Card",TempMiniCustomerTemplate);
                END;
              DATABASE::Item:
                BEGIN
                  TempItemTemplate.InitializeTempRecordFromConfigTemplate(TempItemTemplate,Rec);
                  PAGE.RUN(PAGE::"Item Template Card",TempItemTemplate);
                END;
              DATABASE::Vendor:
                BEGIN
                  TempMiniVendorTemplate.InitializeTempRecordFromConfigTemplate(TempMiniVendorTemplate,Rec);
                  PAGE.RUN(PAGE::"Vendor Template Card",TempMiniVendorTemplate);
                END;
              ELSE
                PAGE.RUN(PAGE::"Config. Template Header",Rec);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
                  PAGE.RUN(PAGE::"Mini Customer Template Card",TempMiniCustomerTemplate);
            #6..8
                  TempMiniItemTemplate.InitializeTempRecordFromConfigTemplate(TempMiniItemTemplate,Rec);
                  PAGE.RUN(PAGE::"Mini Item Template Card",TempMiniItemTemplate);
            #11..14
                  PAGE.RUN(PAGE::"Mini Vendor Template Card",TempMiniVendorTemplate);
            #16..19
            */
        //end;

        //Unsupported feature: Property Deletion (ShortCutKey) on ""Edit Template"(Action 10)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Edit Template"(Action 10)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Edit Template"(Action 10)".

        modify(Delete)
        {
            Visible = false;
        }
    }

    var
        TempMiniItemTemplate: Record "Item Template" temporary;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FilterValue := GETFILTER("Table ID");

        IF NOT EVALUATE(FilteredTableId,FilterValue) THEN
          FilteredTableId := 0;

        UpdateActionsVisibility;
        UpdatePageCaption;

        IF NewMode THEN
          UpdateSelection;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        */
    //end;


    //Unsupported feature: Code Modification on "UpdatePageCaption(PROCEDURE 1)".

    //procedure UpdatePageCaption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT NewMode THEN
          CASE FilteredTableId OF
            DATABASE::Customer:
              PageCaption := CustomerTemplatesCap;
        #5..21
          END;

        CurrPage.CAPTION(PageCaption);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF NOT CurrPage.LOOKUPMODE THEN
        #2..24
        */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (DeleteAllowed).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
