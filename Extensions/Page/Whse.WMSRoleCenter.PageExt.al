#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186985 pageextension52186985 extends "Whse. WMS Role Center"
{
    Caption = 'Role Center';
    layout
    {

        //Unsupported feature: Property Modification (Level) on "Control1903327208(Control 1903327208)".


        //Unsupported feature: Property Modification (Level) on "Control1907692008(Control 1907692008)".


        //Unsupported feature: Property Modification (Level) on "Control4(Control 4)".


        //Unsupported feature: Property Modification (Level) on "Control37(Control 37)".


        //Unsupported feature: Property Modification (Level) on "Control40(Control 40)".


        //Unsupported feature: Property Modification (Level) on "Control1901377608(Control 1901377608)".

        modify(Control38)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1903327208(Control 1903327208)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1907692008(Control 1907692008)".

        modify(Control73)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control4(Control 4)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control37(Control 37)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control40(Control 40)".


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
        // addfirst(Control40)
        // {
        //     part(Control1903012608; "Copy Profile")
        //     {
        //         Visible = false;
        //     }
        // }
    }
    actions
    {
        modify("&Picking List")
        {
            ApplicationArea = Basic;
        }
        modify("P&ut-away List")
        {
            ApplicationArea = Basic;
        }
        modify("M&ovement List")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. &Shipment Status")
        {
            ApplicationArea = Basic;
        }
        modify("Warehouse &Bin List")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. &Adjustment Bin")
        {
            ApplicationArea = Basic;
        }
        modify("Warehouse Physical Inventory &List")
        {
            Caption = 'Whse. Phys. Inventory &List';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Warehouse Physical Inventory &List"(Action 15)".

        }
        modify("P&hys. Inventory List")
        {
            ApplicationArea = Basic;
        }
        modify("&Customer - Labels")
        {
            ApplicationArea = Basic;
        }
        modify(WhseShpt)
        {

            //Unsupported feature: Property Modification (Name) on "WhseShpt(Action 9)".

            ApplicationArea = Basic;
        }
        modify(WhseShptReleased)
        {

            //Unsupported feature: Property Modification (Name) on "WhseShptReleased(Action 22)".

            ApplicationArea = Basic;
        }
        modify(WhseShptPartPicked)
        {

            //Unsupported feature: Property Modification (Name) on "WhseShptPartPicked(Action 23)".

            ApplicationArea = Basic;
        }
        modify(WhseShptComplPicked)
        {

            //Unsupported feature: Property Modification (Name) on "WhseShptComplPicked(Action 24)".

            ApplicationArea = Basic;
        }
        modify(WhseShptPartShipped)
        {

            //Unsupported feature: Property Modification (Name) on "WhseShptPartShipped(Action 25)".

            ApplicationArea = Basic;
        }
        modify(WhseRcpt)
        {

            //Unsupported feature: Property Modification (Name) on "WhseRcpt(Action 11)".

            ApplicationArea = Basic;
        }
        modify(WhseRcptPartReceived)
        {

            //Unsupported feature: Property Modification (Name) on "WhseRcptPartReceived(Action 77)".

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

            //Unsupported feature: Property Modification (Name) on "AssemblyOrders(Action 27)".

            ApplicationArea = Basic;
        }
        modify(Picks)
        {
            ApplicationArea = Basic;
        }
        modify(PicksUnassigned)
        {

            //Unsupported feature: Property Modification (Name) on "PicksUnassigned(Action 87)".

            ApplicationArea = Basic;
        }
        modify(Putaway)
        {

            //Unsupported feature: Property Modification (Name) on "Putaway(Action 58)".

            ApplicationArea = Basic;
        }
        modify(PutawayUnassigned)
        {

            //Unsupported feature: Property Modification (Name) on "PutawayUnassigned(Action 90)".

            ApplicationArea = Basic;
        }
        modify(Movements)
        {
            ApplicationArea = Basic;
        }
        modify(MovementsUnassigned)
        {

            //Unsupported feature: Property Modification (Name) on "MovementsUnassigned(Action 93)".

            ApplicationArea = Basic;
        }
        modify(BinContents)
        {

            //Unsupported feature: Property Modification (Name) on "BinContents(Action 94)".

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
        modify(Items)
        {
            ApplicationArea = Basic;
        }
        modify(Customers)
        {
            ApplicationArea = Basic;
        }
        modify(Vendors)
        {
            ApplicationArea = Basic;
        }
        modify(Locations)
        {
            ApplicationArea = Basic;
        }
        modify("Shipping Agent")
        {
            ApplicationArea = Basic;
        }
        modify(WhseItemJournals)
        {

            //Unsupported feature: Property Modification (Name) on "WhseItemJournals(Action 12)".

            Caption = 'Whse. Item Journals';
            ApplicationArea = Basic;
        }
        modify(WhseReclassJournals)
        {

            //Unsupported feature: Property Modification (Name) on "WhseReclassJournals(Action 17)".

            Caption = 'Whse. Reclass. Journals';
            ApplicationArea = Basic;
        }
        modify(WhsePhysInvtJournals)
        {

            //Unsupported feature: Property Modification (Name) on "WhsePhysInvtJournals(Action 18)".

            Caption = 'Whse. Phys. Invt. Journals';
            ApplicationArea = Basic;
        }
        modify(ItemJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemJournals(Action 19)".

            ApplicationArea = Basic;
        }
        modify(ItemReclassJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemReclassJournals(Action 123)".

            ApplicationArea = Basic;
        }
        modify(PhysInventoryJournals)
        {

            //Unsupported feature: Property Modification (Name) on "PhysInventoryJournals(Action 126)".

            ApplicationArea = Basic;
        }
        modify(PutawayWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "PutawayWorksheets(Action 130)".

            ApplicationArea = Basic;
        }
        modify(PickWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "PickWorksheets(Action 131)".

            ApplicationArea = Basic;
        }
        modify(MovementWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "MovementWorksheets(Action 132)".

            ApplicationArea = Basic;
        }
        modify("Internal Put-aways")
        {
            ApplicationArea = Basic;
        }
        modify("Internal Picks")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Whse Shipments")
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
        modify("Posted Whse Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Purchase Receipts")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Transfer Receipts")
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
        modify("Registered Picks")
        {
            ApplicationArea = Basic;
        }
        modify("Registered Put-aways")
        {
            ApplicationArea = Basic;
        }
        modify("Registered Movements")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Level) on "Inventory(Action 54)".


        //Unsupported feature: Property Modification (ActionType) on "Inventory(Action 54)".


        //Unsupported feature: Property Modification (Name) on "Inventory(Action 54)".

        // modify(Service)
        // {

        //     //Unsupported feature: Property Modification (Level) on "Service(Action 53)".


        //Unsupported feature: Property Modification (ActionType) on "Service(Action 53)".


        //Unsupported feature: Property Modification (Name) on "Service(Action 53)".

        //     Caption = 'History';

        //     //Unsupported feature: Property Insertion (IsHeader) on "Service(Action 53)".

        // }
        // modify(System)
        // {

        //     //Unsupported feature: Property Modification (Level) on "System(Action 52)".


        //     //Unsupported feature: Property Modification (ActionType) on "System(Action 52)".


        //     //Unsupported feature: Property Modification (Name) on "System(Action 52)".

        //     Caption = 'Tasks';

        //     //Unsupported feature: Property Insertion (IsHeader) on "System(Action 52)".

        // }

        //Unsupported feature: Property Modification (Level) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Modification (ActionType) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Modification (Name) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Modification (Level) on "Intercompany(Action 49)".


        //Unsupported feature: Property Modification (ActionType) on "Intercompany(Action 49)".


        //Unsupported feature: Property Modification (Name) on "Intercompany(Action 49)".

        modify(Workflows)
        {

            //Unsupported feature: Property Modification (Level) on "Workflows(Action 60)".

            Caption = 'Movement Worksheets';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Workflows(Action 60)".


            //Unsupported feature: Property Modification (Name) on "Workflows(Action 60)".


            //Unsupported feature: Property Insertion (RunPageView) on "Workflows(Action 60)".

        }
        modify("Whse. &Shipment")
        {
            ApplicationArea = Basic;
        }
        modify("T&ransfer Order")
        {
            ApplicationArea = Basic;
        }
        modify("&Purchase Order")
        {
            ApplicationArea = Basic;
        }
        modify("&Whse. Receipt")
        {
            ApplicationArea = Basic;
        }
        modify("P&ut-away Worksheet")
        {
            ApplicationArea = Basic;
        }
        modify("Pi&ck Worksheet")
        {
            ApplicationArea = Basic;
        }
        modify("M&ovement Worksheet")
        {
            ApplicationArea = Basic;
        }
        modify("W&hse. Item Journal")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. &Phys. Invt. Journal")
        {
            ApplicationArea = Basic;
        }
        modify("Item &Tracing")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""&Picking List"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""P&ut-away List"(Action 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""M&ovement List"(Action 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. &Shipment Status"(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Warehouse &Bin List"(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. &Adjustment Bin"(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Warehouse Physical Inventory &List"(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""P&hys. Inventory List"(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Customer - Labels"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseShpt(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseShptReleased(Action 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseShptPartPicked(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseShptComplPicked(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseShptPartShipped(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseRcpt(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseRcptPartReceived(Action 77)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TransferOrders(Action 83)".

        modify(PhysInvtOrders)
        {
            Visible = false;
        }
        modify(PhysInvtRecordings)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "ReleasedProductionOrders(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AssemblyOrders(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Picks(Action 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PicksUnassigned(Action 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Putaway(Action 58)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PutawayUnassigned(Action 90)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Movements(Action 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on "MovementsUnassigned(Action 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BinContents(Action 94)".

        modify("Sales & Purchases")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrders(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrdersReleased(Action 79)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesOrdersPartShipped(Action 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SalesReturnOrders(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrders(Action 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrdersReleased(Action 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseOrdersPartReceived(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PurchaseReturnOrders(Action 82)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Items(Action 117)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Customers(Action 118)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Vendors(Action 119)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Locations(Action 120)".


        //Unsupported feature: Property Deletion (Promoted) on "Locations(Action 120)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Locations(Action 120)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipping Agent"(Action 121)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseItemJournals(Action 12)".


        //Unsupported feature: Property Deletion (Promoted) on "WhseItemJournals(Action 12)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "WhseItemJournals(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhseReclassJournals(Action 17)".


        //Unsupported feature: Property Deletion (Promoted) on "WhseReclassJournals(Action 17)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "WhseReclassJournals(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WhsePhysInvtJournals(Action 18)".


        //Unsupported feature: Property Deletion (Promoted) on "WhsePhysInvtJournals(Action 18)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "WhsePhysInvtJournals(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemJournals(Action 19)".


        //Unsupported feature: Property Deletion (Promoted) on "ItemJournals(Action 19)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ItemJournals(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemReclassJournals(Action 123)".


        //Unsupported feature: Property Deletion (Promoted) on "ItemReclassJournals(Action 123)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ItemReclassJournals(Action 123)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PhysInventoryJournals(Action 126)".


        //Unsupported feature: Property Deletion (Promoted) on "PhysInventoryJournals(Action 126)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PhysInventoryJournals(Action 126)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PutawayWorksheets(Action 130)".


        //Unsupported feature: Property Deletion (Promoted) on "PutawayWorksheets(Action 130)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PutawayWorksheets(Action 130)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PickWorksheets(Action 131)".


        //Unsupported feature: Property Deletion (Promoted) on "PickWorksheets(Action 131)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PickWorksheets(Action 131)".


        //Unsupported feature: Property Deletion (ToolTipML) on "MovementWorksheets(Action 132)".


        //Unsupported feature: Property Deletion (Promoted) on "MovementWorksheets(Action 132)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "MovementWorksheets(Action 132)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Internal Put-aways"(Action 134)".


        //Unsupported feature: Property Deletion (Promoted) on ""Internal Put-aways"(Action 134)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Internal Put-aways"(Action 134)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Internal Picks"(Action 135)".


        //Unsupported feature: Property Deletion (Promoted) on ""Internal Picks"(Action 135)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Internal Picks"(Action 135)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Whse Shipments"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Shipment"(Action 136)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Transfer Shipments"(Action 137)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Return Shipments"(Action 138)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Whse Receipts"(Action 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Purchase Receipts"(Action 139)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Transfer Receipts"(Action 140)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Return Receipts"(Action 141)".

        modify("Posted Phys. Invt. Orders")
        {
            Visible = false;
        }
        modify("Posted Phys. Invt. Recordings")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Assembly Orders"(Action 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Picks"(Action 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Put-aways"(Action 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Movements"(Action 45)".

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

        //Unsupported feature: Property Deletion (CaptionML) on "Inventory(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Inventory(Action 54)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Inventory(Action 54)".


        //Unsupported feature: Property Deletion (RunObject) on "Inventory(Action 54)".


        //Unsupported feature: Property Deletion (RunPageView) on "Inventory(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Service(Action 53)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Service(Action 53)".


        //Unsupported feature: Property Deletion (RunObject) on "Service(Action 53)".


        //Unsupported feature: Property Deletion (RunPageView) on "Service(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on "System(Action 52)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "System(Action 52)".


        //Unsupported feature: Property Deletion (RunObject) on "System(Action 52)".


        //Unsupported feature: Property Deletion (RunPageView) on "System(Action 52)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Deletion (RunObject) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Deletion (RunPageView) on ""Relationship Management"(Action 51)".


        //Unsupported feature: Property Deletion (CaptionML) on "Intercompany(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Intercompany(Action 49)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Intercompany(Action 49)".


        //Unsupported feature: Property Deletion (RunObject) on "Intercompany(Action 49)".


        //Unsupported feature: Property Deletion (RunPageView) on "Intercompany(Action 49)".

        modify("Service Connections")
        {
            Visible = false;
        }
        modify(Extensions)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Workflows(Action 60)".


        //Unsupported feature: Property Deletion (Promoted) on "Workflows(Action 60)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Workflows(Action 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. &Shipment"(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""T&ransfer Order"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Purchase Order"(Action 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Whse. Receipt"(Action 1)".

        modify("Phys. Inv. Order")
        {
            Visible = false;
        }
        modify("Phys. Inv. Recording")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""P&ut-away Worksheet"(Action 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pi&ck Worksheet"(Action 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""M&ovement Worksheet"(Action 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""W&hse. Item Journal"(Action 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. &Phys. Invt. Journal"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracing"(Action 84)".

        addafter(BinContents)
        {
            action("Whse. Item Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Whse. Item Journals';
                RunObject = Page "Whse. Journal Batches List";
                RunPageView = where("Template Type" = const(Item));
            }
        }
        addafter("M&ovement Worksheet")
        {
            separator(Action38)
            {
            }
        }
        // moveafter("M&ovement List";Intercompany)
        // moveafter("Whse. &Adjustment Bin";"Relationship Management")
        // moveafter("P&hys. Inventory List";Inventory)
        // moveafter("Partially Received";SalesOrders)
        // moveafter(Action81;PurchaseReturnOrders)
        // moveafter("Released Production Orders";PurchaseOrders)
        // moveafter("Assembly Orders";SalesReturnOrders)
        // moveafter(Action93;Workflows)
        // moveafter("Registered Movements";ActionContainer26)
        // moveafter(ActionContainer1900000004;System)
        // moveafter(Action52;"P&ut-away Worksheet")
    }
}
