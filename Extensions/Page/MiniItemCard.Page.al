// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1302 "Mini Item Card"
// {
//     Caption = 'Item Card';
//     PageType = Card;
//     PromotedActionCategories = 'New,Process,Report,Item,History,View';
//     RefreshOnActivate = true;
//     SourceTable = Item;

//     layout
//     {
//         area(content)
//         {
//             group(Item)
//             {
//                 Caption = 'Item';
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies the number of the item. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

//                     trigger OnAssistEdit()
//                     begin
//                         if Rec.AssistEdit then
//                             CurrPage.Update;
//                     end;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies a description of the item. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field(Blocked; Rec.Blocked)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies if transactions with the item should be blocked, for example, because the item is in quarantine.';
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies if the item card represents a physical item (Inventory) or a service (Service).';

//                     trigger OnValidate()
//                     begin
//                         EnableControls;
//                     end;
//                 }
//                 field("Base Unit of Measure"; Rec."Base Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the unit in which the item is held on inventory. The base unit of measure also serves as the conversion basis for alternate units of measure.';
//                 }
//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Shows when the item card was last modified.';
//                 }
//                 field(GTIN; Rec.GTIN)
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Identifies the item in connection with electronic document sending and receiving. For the PEPPOL format, the field is used as follows: If the StandardItemIdentification/ID element has the SchemeID attribute set to GTIN, then the element is mapped to the GTIN field on the item card.';
//                 }
//             }
//             group(InventoryGrp)
//             {
//                 Caption = 'Inventory';
//                 field(Inventory; Rec.Inventory)
//                 {
//                     ApplicationArea = Basic;
//                     Enabled = InventoryItemEditable;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are on inventory.';
//                 }
//                 field("Stockout Warning"; Rec."Stockout Warning")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Stockout Warning';
//                     OptionCaption = 'Default (Yes),No,Yes';
//                     ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero. The calculation includes all sales document lines that have not yet been posted.';
//                     Visible = ShowStockoutWarningDefaultYes;
//                 }
//                 field(StockoutWarningDefNo; Rec."Stockout Warning")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Stockout Warning';
//                     OptionCaption = 'Default (No),No,Yes';
//                     ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero. The calculation includes all sales document lines that have not yet been posted.';
//                     Visible = ShowStockoutWarningDefaultNo;
//                 }
//                 field("Prevent Negative Inventory"; Rec."Prevent Negative Inventory")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prevent Negative Inventory';
//                     Importance = Additional;
//                     OptionCaption = 'Default (Yes),No,Yes';
//                     ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
//                     Visible = PreventNegInventoryDefaultYes;
//                 }
//                 field(PreventNegativeInventoryDefNo; Rec."Prevent Negative Inventory")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prevent Negative Inventory';
//                     Importance = Additional;
//                     OptionCaption = 'Default (No),No,Yes';
//                     ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
//                     Visible = PreventNegInventoryDefaultNo;
//                 }
//                 field("Net Weight"; Rec."Net Weight")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies the net weight of the item.';
//                 }
//                 field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies that an extended text that you have set up will be added automatically on sales or purchase documents for this item.';
//                 }
//             }
//             group("Price & Posting")
//             {
//                 Caption = 'Price & Posting';
//                 field(Price; Rec."Unit Price")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Price';
//                     Editable = PriceEditable;
//                     ToolTip = 'Specifies the price for one unit of the item, in LCY. You can enter a price manually or have it entered according to the Price/Profit Calculation field.';
//                 }
//                 field(CalcUnitPriceExclVAT; Rec.CalcUnitPriceExclVAT)
//                 {
//                     ApplicationArea = Basic;
//                     CaptionClass = '2,0,' + FIELDCAPTION(Rec."Unit Price");
//                     Importance = Additional;
//                 }
//                 field("Price Includes VAT"; Rec."Price Includes VAT")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales document lines for this item should be shown with or without VAT.';

//                     trigger OnValidate()
//                     begin
//                         if Rec."Price Includes VAT" = xRec."Price Includes VAT" then
//                             exit;

//                         CurrPage.PriceAndLineDisc.Page.RunUpdatePriceIncludesVatAndPrices(Rec."Price Includes VAT");
//                     end;
//                 }
//                 field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies if the Profit % field, the Unit Price field, or neither field is calculated and filled. The value in the Profit % field is what is generally understood as the profit margin.';

//                     trigger OnValidate()
//                     begin
//                         EnableControls;
//                     end;
//                 }
//                 field("Profit %"; Rec."Profit %")
//                 {
//                     ApplicationArea = Basic;
//                     DecimalPlaces = 2 : 2;
//                     Editable = ProfitEditable;
//                     ToolTip = 'Specifies the profit margin that you want to sell the item at. You can enter a profit percentage manually or have it entered according to the Price/Profit Calculation field.';
//                 }
//                 field("Unit Cost"; Rec."Unit Cost")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = UnitCostEditable;
//                     ToolTip = 'Specifies the most recent average cost for one unit of the item. After each sale, the unit cost is updated by automatic cost adjustment.';

//                     trigger OnDrillDown()
//                     var
//                         ShowAvgCalcItem: Codeunit "Show Avg. Calc. - Item";
//                     begin
//                         ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
//                     end;
//                 }
//                 field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies if the item should be included in the calculation of an invoice discount on documents where the item is traded.';
//                 }
//                 field("Item Disc. Group"; Rec."Item Disc. Group")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies an item group code that can be used as a criterion to grant a discount when the item is sold to a certain customer.';
//                 }
//                 group("Cost Details")
//                 {
//                     Caption = 'Cost Details';
//                     field("Costing Method"; Rec."Costing Method")
//                     {
//                         ApplicationArea = Basic;
//                         Enabled = false;
//                         Importance = Additional;
//                         ToolTip = 'Specifies how the item''s cost flow is recorded and whether an actual or budgeted value is capitalized and used in the cost calculation.';
//                     }
//                     field("Indirect Cost %"; Rec."Indirect Cost %")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
//                     }
//                     field("Last Direct Cost"; Rec."Last Direct Cost")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Last Purchase Cost';
//                         Importance = Additional;
//                         ToolTip = 'Specifies the item''s most recent purchase cost as invoiced by your vendor in the last posted purchase invoice for the item.';
//                     }
//                 }
//                 group("Financial Details")
//                 {
//                     Caption = 'Financial Details';
//                     field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ShowMandatory = true;
//                         ToolTip = 'Links business transactions made for this item with the general ledger to account for the value of trade with the item.';
//                     }
//                     field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ShowMandatory = true;
//                         ToolTip = 'Links business transactions made for this item with the general ledger to account for VAT amounts that result from trade with the item.';
//                     }
//                     field("Inventory Posting Group"; Rec."Inventory Posting Group")
//                     {
//                         ApplicationArea = Basic;
//                         Editable = InventoryItemEditable;
//                         Importance = Additional;
//                         ShowMandatory = true;
//                         ToolTip = 'Links business transactions made for the item with an inventory account in the general ledger to group amounts for that item type.';
//                     }
//                     field("Tariff No."; Rec."Tariff No.")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies a code for the item''s tariff number. To see the tariff numbers in the Tariff Numbers window, choose the field.';
//                     }
//                 }
//             }
//             part(PriceAndLineDisc; "Sales Price and Line Discounts")
//             {
//             }
//         }
//         area(factboxes)
//         {
//             part(Control13; "Social Listening FactBox")
//             {
//                 SubPageLink = "Source Type" = const(Item),
//                               "Source No." = field("No.");
//                 Visible = SocialListeningVisible;
//             }
//             part(Control15; "Social Listening Setup FactBox")
//             {
//                 SubPageLink = "Source Type" = const(Item),
//                               "Source No." = field("No.");
//                 UpdatePropagation = Both;
//                 Visible = SocialListeningSetupVisible;
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(ActionGroup42)
//             {
//                 Caption = 'Item';
//                 Image = "<DataEntry>";
//                 action("&Units of Measure")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Units of Measure';
//                     Image = UnitOfMeasure;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Item Units of Measure";
//                     RunPageLink = "Item No." = field("No.");
//                     ToolTip = 'Set up the different units that the item can be traded in, such as piece, box, or hour.';
//                 }
//                 action("Cross Re&ferences")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Cross Re&ferences';
//                     Image = Change;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category4;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Item Cross Reference Entries";
//                     RunPageLink = "Item No." = field("No.");
//                     ToolTip = 'Set up a customer''s own identification of the item. Cross-references to the customer''s item number means that that item number is automatically shown on sales documents instead of the number that you use.';
//                 }
//                 action("E&xtended Texts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'E&xtended Texts';
//                     Image = Text;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category4;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Accountant Portal User Tasks";
//                     RunPageLink = "Table Name" = const(Item),
//                                   "No." = field("No.");
//                     RunPageView = sorting("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
//                     ToolTip = 'Set up additional text for the description of the item. Extended text can be inserted under the Description field on document lines for the item.';
//                 }
//                 action(Translations)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Translations';
//                     Image = Translations;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category4;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Item Translations";
//                     RunPageLink = "Item No." = field("No.");
//                     ToolTip = 'Set up translated item descriptions. Translated item descriptions are automatically inserted on documents according to the language code.';
//                 }
//                 action("&Picture")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Picture';
//                     Image = Picture;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Item Picture";
//                     RunPageLink = "No." = field("No."),
//                                   "Date Filter" = field("Date Filter"),
//                                   "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
//                                   "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
//                                   "Location Filter" = field("Location Filter"),
//                                   "Drop Shipment Filter" = field("Drop Shipment Filter"),
//                                   "Variant Filter" = field("Variant Filter");
//                     ToolTip = 'View or add a picture of the item.';
//                 }
//                 action(AdjustInventory)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Adjust Inventory';
//                     Enabled = InventoryItemEditable;
//                     Image = InventoryCalculation;
//                     ToolTip = 'Increase or decrease the item''s inventory quantity manually by entering a new quantity. Adjusting the inventory quantity manually may be relevant after a physical count or if you do not record purchased quantities.';

//                     trigger OnAction()
//                     begin
//                         Commit;
//                         Page.RunModal(Page::"Mini Adjust Inventory", Rec)
//                     end;
//                 }
//                 action(Dimensions)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category4;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Default Dimensions";
//                     RunPageLink = "Table ID" = const(27),
//                                   "No." = field("No.");
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'Set up default dimensions for the item, such as a department or project code. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 group("E&ntries")
//                 {
//                     Caption = 'E&ntries';
//                     Image = Entries;
//                     action("Ledger E&ntries")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Ledger E&ntries';
//                         Image = ItemLedger;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Category5;
//                         //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedIsBig = true;
//                         RunObject = Page "Item Ledger Entries";
//                         RunPageLink = "Item No." = field("No.");
//                         RunPageView = sorting("Item No.");
//                         ShortCutKey = 'Ctrl+F7';
//                         ToolTip = 'View the history of positive and negative inventory changes that reflect transactions with the item.';
//                     }
//                     action("&Phys. Inventory Ledger Entries")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = '&Phys. Inventory Ledger Entries';
//                         Image = PhysicalInventoryLedger;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Category5;
//                         //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedIsBig = true;
//                         RunObject = Page "Phys. Inventory Ledger Entries";
//                         RunPageLink = "Item No." = field("No.");
//                         RunPageView = sorting("Item No.");
//                         ToolTip = 'View how many units of the item you had in stock at the last physical count.';
//                     }
//                 }
//             }
//             group(PricesandDiscounts)
//             {
//                 Caption = 'Prices and Discounts';
//                 action(Prices)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prices';
//                     Image = Price;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Item No." = field("No.");
//                     RunPageView = sorting("Item No.");
//                     ToolTip = 'Set up different prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//                 action("Line Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Line Discounts';
//                     Image = LineDiscount;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = Type = const(Item),
//                                   Code = field("No.");
//                     RunPageView = sorting(Type, Code);
//                     ToolTip = 'Set up different discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//             }
//             group(DataTemplate)
//             {
//                 Caption = 'Data Template';
//                 action(SaveAsTemplate)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Save as Template';
//                     Ellipsis = true;
//                     Image = Save;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = New;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Save the item card as a template that can be reused to create new item cards. Item templates contain preset information to help you fill in fields on item cards.';

//                     trigger OnAction()
//                     var
//                         TempMiniItemTemplate: Record "Item Template" temporary;
//                     begin
//                         TempMiniItemTemplate.SaveAsTemplate(Rec);
//                     end;
//                 }
//                 action(Templates)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Templates';
//                     Image = Template;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Config Templates";
//                     RunPageView = where("Table ID" = const(27));
//                     ToolTip = 'View or edit item templates.';
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         GetSalesPricesAndSalesLineDisc;
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         EnableControls;
//     end;

//     trigger OnInit()
//     begin
//         InventoryItemEditable := true;
//         Rec."Costing Method" := Rec."costing method"::FIFO;
//         UnitCostEditable := true;
//     end;

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         InsertItemUnitOfMeasure;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         MiniItemTemplate: Record "Item Template";
//         Item: Record Item;
//         NewItemCode: Code[20];
//     begin
//         EnableControls;
//         if Rec."No." = '' then
//             NewItemCode := MiniItemTemplate.NewItemFromTemplate;
//         if NewItemCode = '' then begin
//             CurrPage.Close;
//             exit;
//         end;
//         Rec.Get(NewItemCode);
//         if Item.Get(Rec."No.") then
//             Item.Delete(true);
//     end;

//     trigger OnOpenPage()
//     begin
//         EnableControls;
//         VisualizingControls;
//         CurrPage.PriceAndLineDisc.Page.InitPage(true);
//     end;

//     var
//         [InDataSet]
//         InventoryItemEditable: Boolean;
//         [InDataSet]
//         UnitCostEditable: Boolean;
//         ShowStockoutWarningDefaultYes: Boolean;
//         ShowStockoutWarningDefaultNo: Boolean;
//         PreventNegInventoryDefaultYes: Boolean;
//         PreventNegInventoryDefaultNo: Boolean;
//         [InDataSet]
//         SocialListeningSetupVisible: Boolean;
//         [InDataSet]
//         SocialListeningVisible: Boolean;
//         ProfitEditable: Boolean;
//         PriceEditable: Boolean;

//     local procedure EnableControls()
//     var
//         ItemLedgerEntry: Record "Item Ledger Entry";
//     begin
//         InventoryItemEditable := Rec.Type = Rec.Type::Inventory;

//         if Rec.Type = Rec.Type::Inventory then begin
//             ItemLedgerEntry.SetRange("Item No.", Rec."No.");
//             UnitCostEditable := ItemLedgerEntry.IsEmpty;
//         end else
//             UnitCostEditable := true;

//         ProfitEditable := true;
//         PriceEditable := true;
//         case Rec."Price/Profit Calculation" of
//             Rec."price/profit calculation"::"Profit=Price-Cost":
//                 ProfitEditable := false;
//             Rec."price/profit calculation"::"Price=Cost+Profit":
//                 PriceEditable := false;
//         end;

//         SetSocialListeningFactboxVisibility
//     end;

//     local procedure VisualizingControls()
//     var
//         SalesSetup: Record "Sales & Receivables Setup";
//         InventorySetup: Record "Inventory Setup";
//     begin
//         SalesSetup.Get;
//         ShowStockoutWarningDefaultYes := SalesSetup."Stockout Warning";
//         ShowStockoutWarningDefaultNo := not ShowStockoutWarningDefaultYes;
//         InventorySetup.Get;
//         PreventNegInventoryDefaultYes := InventorySetup."Prevent Negative Inventory";
//         PreventNegInventoryDefaultNo := not PreventNegInventoryDefaultYes;
//     end;

//     local procedure GetSalesPricesAndSalesLineDisc()
//     begin
//         if Rec."No." <> CurrPage.PriceAndLineDisc.Page.GetLoadedItemNo then begin
//             CurrPage.PriceAndLineDisc.Page.LoadItem(Rec);
//             CurrPage.PriceAndLineDisc.Page.Update(false);
//         end;
//     end;

//     local procedure InsertItemUnitOfMeasure()
//     var
//         ItemUnitOfMeasure: Record "Item Unit of Measure";
//     begin
//         if Rec."Base Unit of Measure" <> '' then begin
//             ItemUnitOfMeasure.Init;
//             ItemUnitOfMeasure."Item No." := Rec."No.";
//             ItemUnitOfMeasure.Validate(Code, Rec."Base Unit of Measure");
//             ItemUnitOfMeasure."Qty. per Unit of Measure" := 1;
//             ItemUnitOfMeasure.Insert;
//         end;
//     end;

//     local procedure SetSocialListeningFactboxVisibility()
//     var
//         SocialListeningMgt: Codeunit 871;
//     begin
//         SocialListeningMgt.GetItemFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
//     end;
// }
