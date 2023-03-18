#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186993 pageextension52186993 extends "Whse. Basic Role Center" 
{
    Caption = 'Role Center';
    layout
    {

        //Unsupported feature: Property Modification (Level) on "Control1906245608(Control 1906245608)".


        //Unsupported feature: Property Modification (Level) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Modification (Level) on "Control4(Control 4)".


        //Unsupported feature: Property Modification (Level) on "Control18(Control 18)".


        //Unsupported feature: Property Modification (Level) on "Control19(Control 19)".


        //Unsupported feature: Property Modification (Level) on "Control1901377608(Control 1901377608)".

        modify(Control51)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1906245608(Control 1906245608)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1907692008(Control 1907692008)".

        modify(Control52)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control4(Control 4)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control18(Control 18)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control19(Control 19)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901377608(Control 1901377608)".

        addfirst(RoleCenter)
        {
            group(Control1900724808)
            {
            }
        }
        addafter(Control1907692008)
        {
            group(Control1900724708)
            {
            }
        }
        // addfirst(Control19)
        // {
        //     part(Control1903012608;"Copy Profile")
        //     {
        //         Visible = false;
        //     }
        // }
    }
    actions
    {
        modify("Warehouse &Bin List")
        {
            ApplicationArea = Basic;
        }
        modify("Physical &Inventory List")
        {
            ApplicationArea = Basic;
        }
        modify("Customer &Labels")
        {
            ApplicationArea = Basic;
        }
        modify(TransferOrders)
        {

            //Unsupported feature: Property Modification (Name) on "TransferOrders(Action 83)".

            ApplicationArea = Basic;
        }
        modify(ReleasedProductionOrders)
        {

            //Unsupported feature: Property Modification (Name) on "ReleasedProductionOrders(Action 31)".

            ApplicationArea = Basic;
        }
        modify(AssemblyOrders)
        {

            //Unsupported feature: Property Modification (Name) on "AssemblyOrders(Action 16)".

            ApplicationArea = Basic;
        }
        modify(InventoryPicks)
        {

            //Unsupported feature: Property Modification (Name) on "InventoryPicks(Action 85)".

            ApplicationArea = Basic;
        }
        modify(InventoryPutaways)
        {

            //Unsupported feature: Property Modification (Name) on "InventoryPutaways(Action 88)".

            ApplicationArea = Basic;
        }
        modify(InventoryMovements)
        {

            //Unsupported feature: Property Modification (Name) on "InventoryMovements(Action 1)".

            ApplicationArea = Basic;
        }
        modify("Internal Movements")
        {

            //Unsupported feature: Property Modification (Name) on ""Internal Movements"(Action 5)".

            ApplicationArea = Basic;
        }
        modify(BinContents)
        {

            //Unsupported feature: Property Modification (Name) on "BinContents(Action 94)".

            ApplicationArea = Basic;
        }
        modify(Items)
        {
            ApplicationArea = Basic;
        }
        modify(ShippingAgents)
        {

            //Unsupported feature: Property Modification (Name) on "ShippingAgents(Action 25)".

            ApplicationArea = Basic;
        }
        modify(ItemReclassificationJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemReclassificationJournals(Action 27)".

            ApplicationArea = Basic;
        }
        modify(PhysInventoryJournals)
        {

            //Unsupported feature: Property Modification (Name) on "PhysInventoryJournals(Action 28)".

            ApplicationArea = Basic;
        }
        modify(Customers)
        {

            //Unsupported feature: Property Modification (Level) on "Customers(Action 23)".

            ApplicationArea = Basic;
        }
        modify(SalesOrders)
        {

            //Unsupported feature: Property Modification (Level) on "SalesOrders(Action 47)".


            //Unsupported feature: Property Modification (Name) on "SalesOrders(Action 47)".

            ApplicationArea = Basic;
        }
        modify(SalesOrdersReleased)
        {

            //Unsupported feature: Property Modification (Level) on "SalesOrdersReleased(Action 79)".


            //Unsupported feature: Property Modification (Name) on "SalesOrdersReleased(Action 79)".

            ApplicationArea = Basic;
        }
        modify(SalesOrdersPartShipped)
        {

            //Unsupported feature: Property Modification (Level) on "SalesOrdersPartShipped(Action 81)".


            //Unsupported feature: Property Modification (Name) on "SalesOrdersPartShipped(Action 81)".

            ApplicationArea = Basic;
        }
        modify(SalesReturnOrders)
        {

            //Unsupported feature: Property Modification (Level) on "SalesReturnOrders(Action 35)".


            //Unsupported feature: Property Modification (Name) on "SalesReturnOrders(Action 35)".

            ApplicationArea = Basic;
        }
        modify(Vendors)
        {

            //Unsupported feature: Property Modification (Level) on "Vendors(Action 24)".

            ApplicationArea = Basic;
        }
        modify(PurchaseOrders)
        {

            //Unsupported feature: Property Modification (Level) on "PurchaseOrders(Action 55)".


            //Unsupported feature: Property Modification (Name) on "PurchaseOrders(Action 55)".

            ApplicationArea = Basic;
        }
        modify(PurchaseOrdersReleased)
        {

            //Unsupported feature: Property Modification (Level) on "PurchaseOrdersReleased(Action 33)".


            //Unsupported feature: Property Modification (Name) on "PurchaseOrdersReleased(Action 33)".

            ApplicationArea = Basic;
        }
        modify(PurchaseOrdersPartReceived)
        {

            //Unsupported feature: Property Modification (Level) on "PurchaseOrdersPartReceived(Action 34)".


            //Unsupported feature: Property Modification (Name) on "PurchaseOrdersPartReceived(Action 34)".

            ApplicationArea = Basic;
        }
        modify(PurchaseReturnOrders)
        {

            //Unsupported feature: Property Modification (Level) on "PurchaseReturnOrders(Action 82)".


            //Unsupported feature: Property Modification (Name) on "PurchaseReturnOrders(Action 82)".

            ApplicationArea = Basic;
        }
        modify("Posted Invt. Picks")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Sales Shipment")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Transfer Shipments")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Return Shipments")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Invt. Put-aways")
        {
            ApplicationArea = Basic;
        }
        modify("Registered Invt. Movements")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Transfer Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Purchase Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Return Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Assembly Orders")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Level) on "Extensions(Action 9)".


        //Unsupported feature: Property Modification (ActionType) on "Extensions(Action 9)".


        //Unsupported feature: Property Modification (Name) on "Extensions(Action 9)".

        modify("T&ransfer Order")
        {
            ApplicationArea = Basic;
        }
        modify("&Purchase Order")
        {
            ApplicationArea = Basic;
        }
        modify("Inventory Pi&ck")
        {
            ApplicationArea = Basic;
        }
        modify("Inventory P&ut-away")
        {
            ApplicationArea = Basic;
        }
        modify("Edit Item Reclassification &Journal")
        {
            ApplicationArea = Basic;
        }
        modify("Item &Tracing")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Warehouse &Bin List"(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Physical &Inventory List"(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer &Labels"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TransferOrders(Action 83)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ReleasedProductionOrders(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AssemblyOrders(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on "InventoryPicks(Action 85)".


        //Unsupported feature: Property Deletion (ToolTipML) on "InventoryPutaways(Action 88)".


        //Unsupported feature: Property Deletion (ToolTipML) on "InventoryMovements(Action 1)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Internal Movements"(Action 5)".

        modify(PhysInventoryOrders)
        {
            Visible = false;
        }
        modify(PhysInventoryRecordings)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "BinContents(Action 94)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Items(Action 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ShippingAgents(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemReclassificationJournals(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PhysInventoryJournals(Action 28)".

        modify("Sales & Purchases")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Customers(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrders(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrdersReleased(Action 79)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrdersPartShipped(Action 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesReturnOrders(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Vendors(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrders(Action 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrdersReleased(Action 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrdersPartReceived(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseReturnOrders(Action 82)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Invt. Picks"(Action 29)".


        //Unsupported feature: Property Deletion (Promoted) on ""Posted Invt. Picks"(Action 29)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Posted Invt. Picks"(Action 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Shipment"(Action 136)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Transfer Shipments"(Action 137)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Return Shipments"(Action 138)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Invt. Put-aways"(Action 10)".


        //Unsupported feature: Property Deletion (Promoted) on ""Posted Invt. Put-aways"(Action 10)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Posted Invt. Put-aways"(Action 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Invt. Movements"(Action 6)".


        //Unsupported feature: Property Deletion (Promoted) on ""Registered Invt. Movements"(Action 6)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Registered Invt. Movements"(Action 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Transfer Receipts"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Purchase Receipts"(Action 139)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Return Receipts"(Action 141)".

        modify("Posted Phys. Invt. Orders")
        {
            Visible = false;
        }
        modify("Posted Phys. Invt. Recordings")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Assembly Orders"(Action 17)".

        modify(SetupAndExtensions)
        {
            Visible = false;
        }
        modify("Assisted Setup")
        {
            Visible = false;
        }
        modify("Manual Setup")
        {
            Visible = false;
        }
        // modify(General)
        // {
        //     Visible = false;
        // }
        // modify(Finance)
        // {
        //     Visible = false;
        // }
        // modify(Sales)
        // {
        //     Visible = false;
        // }
        // modify(Purchasing)
        // {
        //     Visible = false;
        // }
        // modify(Jobs)
        // {
        //     Visible = false;
        // }
        // modify("Fixed Assets")
        // {
        //     Visible = false;
        // }
        // modify(HR)
        // {
        //     Visible = false;
        // }
        // modify(Inventory)
        // {
        //     Visible = false;
        // }
        // modify(Service)
        // {
        //     Visible = false;
        // }
        // modify(System)
        // {
        //     Visible = false;
        // }
        // modify("Relationship Management")
        // {
        //     Visible = false;
        // }
        // modify(Intercompany)
        // {
        //     Visible = false;
        // }
        // modify("Service Connections")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on "Extensions(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Extensions(Action 9)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Extensions(Action 9)".


        //Unsupported feature: Property Deletion (RunObject) on "Extensions(Action 9)".


        //Unsupported feature: Property Deletion (Image) on "Extensions(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""T&ransfer Order"(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Purchase Order"(Action 11)".

        modify("Phys. Inv. Order")
        {
            Visible = false;
        }
        modify("Phys. Inv. Recording")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Inventory Pi&ck"(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Inventory P&ut-away"(Action 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Edit Item Reclassification &Journal"(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracing"(Action 84)".

        addafter("Warehouse &Bin List")
        {
            separator(Action51)
            {
            }
        }
        addafter("Physical &Inventory List")
        {
            separator(Action54)
            {
            }
        }
        addfirst(Processing)
        {
            separator(Action52)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
        }
        addafter("Edit Item Reclassification &Journal")
        {
            separator(Action53)
            {
                Caption = 'History';
                IsHeader = true;
            }
        }
        // moveafter(ActionContainer1900000011;SalesOrders)
        // moveafter("Partially Shipped";PurchaseReturnOrders)
        // moveafter("Released Production Orders";PurchaseOrders)
        // moveafter("Assembly Orders";SalesReturnOrders)
        // moveafter(Items;Customers)
        // moveafter(Customers;Vendors)
        // moveafter("Posted Assembly Orders";ActionContainer7)
    }
}
