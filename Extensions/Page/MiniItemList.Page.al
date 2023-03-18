// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1303 "Mini Item List"
// {
//     Caption = 'Item List';
//     CardPageID = "Mini Item Card";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,Master Data,History,Prices and Discounts';
//     SourceTable = Item;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the item. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a description of the item. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies if the item card represents a physical item (Inventory) or a service (Service).';
//                 }
//                 field(Inventory; Rec.Inventory)
//                 {
//                     ApplicationArea = Basic;
//                     HideValue = IsService;
//                     ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are on inventory.';
//                 }
//                 field("Unit Cost"; Rec."Unit Cost")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Contains the cost per unit of the item.';
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the price for one unit of the item, in LCY. You can enter a price manually or have it entered according to the Price/Profit Calculation field.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(Item)
//             {
//                 Caption = 'Item';
//                 Image = DataEntry;
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
//                     Scope = Repeater;
//                     ToolTip = 'Set up the different units that the selected item can be traded in, such as piece, box, or hour.';
//                     Visible = false;
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
//                     Scope = Repeater;
//                     ToolTip = 'Set up a customer''s own identification of the selected item. Cross-references to the customer''s item number means that that item number is automatically shown on sales documents instead of the number that you use.';
//                     Visible = false;
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
//                     Scope = Repeater;
//                     ToolTip = 'Set up additional text for the description of the selected item. Extended text can be inserted under the Description field on document lines for the item.';
//                     Visible = false;
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
//                     RunPageLink = "Item No." = field("No."),
//                                   "Variant Code" = const('');
//                     Scope = Repeater;
//                     ToolTip = 'Set up translated item descriptions for the selected item. Translated item descriptions are automatically inserted on documents according to the language code.';
//                     Visible = false;
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
//                     Scope = Repeater;
//                     ToolTip = 'View or add a picture of the selected item.';
//                     Visible = false;
//                 }
//                 action(AdjustInventory)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Adjust Inventory';
//                     Enabled = InventoryItemEditable;
//                     Image = InventoryCalculation;
//                     Scope = Repeater;
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
//                     Scope = Repeater;
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'Set up default dimensions, such as a department or project code, for one or multiple selected items. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
//                     Visible = false;
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
//                         Scope = Repeater;
//                         ShortCutKey = 'Ctrl+F7';
//                         ToolTip = 'View the history of positive and negative inventory changes that reflect transactions with the selected item.';
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
//                         Scope = Repeater;
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
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category6;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Item No." = field("No.");
//                     RunPageView = sorting("Item No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different prices for the selected item. An item price is automatically used on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//                 action("Line Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Line Discounts';
//                     Image = LineDiscount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category6;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = Type = const(Item),
//                                   Code = field("No.");
//                     RunPageView = sorting(Type, Code);
//                     Scope = Repeater;
//                     ToolTip = 'Set up different discounts for the selected item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//                 action("Sales Price Worksheet")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sales Price Worksheet';
//                     Image = PriceWorksheet;
//                     RunObject = Page "Sales Price Worksheet";
//                 }
//             }
//             group("Periodic Activities")
//             {
//                 Caption = 'Periodic Activities';
//                 action("Adjust Cost - Item Entries")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Adjust Cost - Item Entries';
//                     Image = AdjustEntries;
//                     RunObject = Report "Adjust Cost - Item Entries";
//                 }
//                 action("Post Inventory Cost to G/L")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post Inventory Cost to G/L';
//                     Image = PostInventoryToGL;
//                     RunObject = Report "Post Inventory Cost to G/L";
//                 }
//                 action("Physical Inventory Journal")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Physical Inventory Journal';
//                     Image = PhysicalInventory;
//                     RunObject = Page "Phys. Inventory Journal";
//                 }
//                 action("Revaluation Journal")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Revaluation Journal';
//                     Image = Journal;
//                     RunObject = Page "Revaluation Journal";
//                 }
//             }
//             group(ItemReports)
//             {
//                 Caption = 'Reports';
//                 group(Reports)
//                 {
//                     Caption = 'Inventory Reports';
//                     Image = "Report";
//                     action("Price List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Price List';
//                         Image = "Report";
//                         RunObject = Report 715;
//                         ToolTip = 'View, print, or save a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
//                     }
//                     action("Inventory Cost and Price List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory Cost and Price List';
//                         Image = "Report";
//                         RunObject = Report 716;
//                         ToolTip = 'View, print, or save a list of your items and their price and cost information. The report specifies direct unit cost, last direct cost, unit price, profit percentage, and profit.';
//                     }
//                     action("Inventory - Sales Statistics")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory - Sales Statistics';
//                         Image = "Report";
//                         RunObject = Report 712;
//                         ToolTip = 'View, print, or save a summary of selected items'' sales per customer, for example, to analyze the profit on individual items or trends in revenues and profit. The report specifies direct unit cost, unit price, sales quantity, sales in LCY, profit percentage, and profit.';
//                     }
//                     action("Inventory - Customer Sales")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory - Customer Sales';
//                         Image = "Report";
//                         RunObject = Report 713;
//                         ToolTip = 'View, print, or save a list of customers that have purchased selected items within a selected period, for example, to analyze customers'' purchasing patterns. The report specifies quantity, amount, discount, profit percentage, and profit.';
//                     }
//                     action("Inventory Availability")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory Availability';
//                         Image = "Report";
//                         RunObject = Report 705;
//                         ToolTip = 'View, print, or save a summary of historical inventory transactions with selected items, for example, to decide when to purchase the items. The report specifies quantity on sales order, quantity on purchase order, back orders from vendors, minimum inventory, and whether there are reorders.';
//                     }
//                     action("Inventory - Top 10 List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory - Top 10 List';
//                         Image = "Report";
//                         RunObject = Report 711;
//                     }
//                     action("Item Age Composition - Qty.")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Item Age Composition - Qty.';
//                         Image = "Report";
//                         RunObject = Report "Item Age Composition - Qty.";
//                     }
//                 }
//                 group("Finance Reports")
//                 {
//                     Caption = 'Finance Reports';
//                     Image = "Report";
//                     action("Inventory Valuation")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Inventory Valuation';
//                         Image = "Report";
//                         RunObject = Report 1001;
//                     }
//                     action(Status)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Status';
//                         Image = "Report";
//                         RunObject = Report Status;
//                     }
//                     action("Item Age Composition - Value")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Item Age Composition - Value';
//                         Image = "Report";
//                         RunObject = Report "Item Age Composition - Value";
//                     }
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         EnableControls
//     end;

//     var
//         [InDataSet]
//         IsService: Boolean;
//         [InDataSet]
//         InventoryItemEditable: Boolean;

//     local procedure EnableControls()
//     begin
//         IsService := (Rec.Type = Rec.Type::Service);
//         InventoryItemEditable := Rec.Type = Rec.Type::Inventory;
//     end;
// }
