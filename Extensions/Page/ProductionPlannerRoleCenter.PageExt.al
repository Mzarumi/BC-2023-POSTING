#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186995 pageextension52186995 extends "Production Planner Role Center" 
{
    Caption = 'Role Center';
    layout
    {

        //Unsupported feature: Property Modification (Level) on "Control1905113808(Control 1905113808)".


        //Unsupported feature: Property Modification (Level) on "Control54(Control 54)".


        //Unsupported feature: Property Modification (Visible) on "Control54(Control 54)".


        //Unsupported feature: Property Modification (Level) on "Control1905989608(Control 1905989608)".


        //Unsupported feature: Property Modification (Level) on "Control55(Control 55)".


        //Unsupported feature: Property Modification (Level) on "Control1901377608(Control 1901377608)".

        modify(Control45)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905113808(Control 1905113808)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control54(Control 54)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905989608(Control 1905989608)".

        modify(Control58)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control55(Control 55)".


        //Unsupported feature: Property Deletion (Visible) on "Control55(Control 55)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901377608(Control 1901377608)".

        addfirst(RoleCenter)
        {
            group(Control1900724808)
            {
            }
        }
        addafter(Control1905113808)
        {
            group(Control1900724708)
            {
            }
        }
        // addfirst(Control55)
        // {
        //     part(Control1903012608;"Copy Profile")
        //     {
        //     }
        // }
    }
    actions
    {

        //Unsupported feature: Property Modification (ActionType) on "Capacity(Action 109)".


        //Unsupported feature: Property Modification (Name) on "Capacity(Action 109)".

        modify("Inventory - &Availability Plan")
        {

            //Unsupported feature: Property Modification (Level) on ""Inventory - &Availability Plan"(Action 108)".

            ApplicationArea = Basic;
        }
        modify("Planning Availability")
        {

            //Unsupported feature: Property Modification (Level) on ""Planning Availability"(Action 110)".

            Caption = '&Planning Availability';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Planning Availability"(Action 110)".

        }
        modify("Capacity Task List")
        {

            //Unsupported feature: Property Modification (Level) on ""Capacity Task List"(Action 13)".

            Caption = '&Capacity Task List';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Capacity Task List"(Action 13)".

        }
        modify("Subcontractor - Dispatch List")
        {

            //Unsupported feature: Property Modification (Level) on ""Subcontractor - Dispatch List"(Action 18)".

            Caption = 'Subcontractor - &Dispatch List';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Subcontractor - Dispatch List"(Action 18)".

        }

        //Unsupported feature: Property Modification (ActionType) on "Production(Action 111)".


        //Unsupported feature: Property Modification (Name) on "Production(Action 111)".

        modify("Production Order - &Shortage List")
        {

            //Unsupported feature: Property Modification (Level) on ""Production Order - &Shortage List"(Action 112)".

            ApplicationArea = Basic;
        }
        modify("D&etailed Calculation")
        {

            //Unsupported feature: Property Modification (Level) on ""D&etailed Calculation"(Action 49)".

            ApplicationArea = Basic;
        }
        modify("P&roduction Order - Calculation")
        {

            //Unsupported feature: Property Modification (Level) on ""P&roduction Order - Calculation"(Action 114)".

            ApplicationArea = Basic;
        }
        modify("Sta&tus")
        {

            //Unsupported feature: Property Modification (Level) on ""Sta&tus"(Action 115)".

            ApplicationArea = Basic;
        }
        modify("Inventory &Valuation WIP")
        {

            //Unsupported feature: Property Modification (Level) on ""Inventory &Valuation WIP"(Action 116)".

            ApplicationArea = Basic;
        }
        modify("Demand Forecast")
        {
            Caption = 'Production Forecast';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Demand Forecast"(Action 101)".

        }
        modify("Transfer Orders")
        {
            ApplicationArea = Basic;
        }
        // modify("Production Orders")
        // {

        //     //Unsupported feature: Property Modification (ActionType) on ""Production Orders"(Action 3)".

        //     Caption = 'Vendors';

        //     //Unsupported feature: Property Modification (Name) on ""Production Orders"(Action 3)".


        //     //Unsupported feature: Property Insertion (RunObject) on ""Production Orders"(Action 3)".


        //     //Unsupported feature: Property Insertion (Image) on ""Production Orders"(Action 3)".

        //     ApplicationArea = Basic;
        // }
        modify("Simulated Production Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Simulated Production Orders"(Action 5)".

            ApplicationArea = Basic;
        }
        modify("Planned Production Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Planned Production Orders"(Action 7)".

            ApplicationArea = Basic;
        }
        modify("Firm Planned Production Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Firm Planned Production Orders"(Action 9)".

            ApplicationArea = Basic;
        }
        modify("Released Production Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Released Production Orders"(Action 12)".

            ApplicationArea = Basic;
        }
        modify("Finished Production Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Finished Production Orders"(Action 10)".

            ApplicationArea = Basic;
        }
        modify("Blanket Sales Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Blanket Sales Orders"(Action 102)".

            ApplicationArea = Basic;
        }
        modify("Sales Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales Orders"(Action 14)".

            ApplicationArea = Basic;
        }
        modify("Blanket Purchase Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Blanket Purchase Orders"(Action 103)".

            ApplicationArea = Basic;
        }
        modify("Purchase Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Purchase Orders"(Action 6)".

            ApplicationArea = Basic;
        }
        modify(ItemJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemJournals(Action 22)".

            ApplicationArea = Basic;
        }
        modify(ItemReclassificationJournals)
        {

            //Unsupported feature: Property Modification (Name) on "ItemReclassificationJournals(Action 23)".

            ApplicationArea = Basic;
        }
        modify(RevaluationJournals)
        {

            //Unsupported feature: Property Modification (Name) on "RevaluationJournals(Action 24)".

            ApplicationArea = Basic;
        }
        modify(PlanningWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "PlanningWorksheets(Action 33)".

            ApplicationArea = Basic;
        }
        modify(RequisitionWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "RequisitionWorksheets(Action 32)".

            ApplicationArea = Basic;
        }
        modify(SubcontractingWorksheets)
        {

            //Unsupported feature: Property Modification (Name) on "SubcontractingWorksheets(Action 34)".

            ApplicationArea = Basic;
        }
        modify("Standard Cost Worksheet")
        {
            ApplicationArea = Basic;
        }
        modify(ProductionBOM)
        {

            //Unsupported feature: Property Modification (Name) on "ProductionBOM(Action 15)".

            ApplicationArea = Basic;
        }
        modify(ProductionBOMCertified)
        {

            //Unsupported feature: Property Modification (Name) on "ProductionBOMCertified(Action 25)".

            ApplicationArea = Basic;
        }
        // modify(Routings)
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (Name) on "Routings(Action 26)".

        // }
        modify("Routing Links")
        {
            ApplicationArea = Basic;
        }
        modify("Standard Tasks")
        {
            ApplicationArea = Basic;
        }
        modify(Families)
        {
            ApplicationArea = Basic;
        }
        modify("ProdDesign_Items")
        {

            //Unsupported feature: Property Modification (Name) on ""ProdDesign_Items"(Action 30)".

            ApplicationArea = Basic;
        }
        modify("ProdDesign_ItemsProduced")
        {

            //Unsupported feature: Property Modification (Name) on ""ProdDesign_ItemsProduced"(Action 31)".

            ApplicationArea = Basic;
        }
        modify("ProdDesign_ItemsRawMaterials")
        {

            //Unsupported feature: Property Modification (Name) on ""ProdDesign_ItemsRawMaterials"(Action 36)".

            ApplicationArea = Basic;
        }
        // modify("Stockkeeping Units")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (Name) on ""Stockkeeping Units"(Action 37)".

        // }
        modify(WorkCenters)
        {

            //Unsupported feature: Property Modification (Name) on "WorkCenters(Action 39)".

            ApplicationArea = Basic;
        }
        modify(WorkCentersInternal)
        {

            //Unsupported feature: Property Modification (Name) on "WorkCentersInternal(Action 40)".

            ApplicationArea = Basic;
        }
        modify(WorkCentersSubcontracted)
        {

            //Unsupported feature: Property Modification (Name) on "WorkCentersSubcontracted(Action 41)".

            ApplicationArea = Basic;
        }
        modify("Machine Centers")
        {
            ApplicationArea = Basic;
        }
        modify("Registered Absence")
        {
            ApplicationArea = Basic;
        }
        modify(Vendors)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Vendors(Action 44)".

        }
        modify(Workflows)
        {

            //Unsupported feature: Property Modification (Level) on "Workflows(Action 11)".

            Caption = 'Produced';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Workflows(Action 11)".


            //Unsupported feature: Property Modification (Name) on "Workflows(Action 11)".


            //Unsupported feature: Property Insertion (RunPageView) on "Workflows(Action 11)".

        }
        modify("&Item")
        {
            ApplicationArea = Basic;
        }
        modify("Production &Order")
        {
            ApplicationArea = Basic;
        }
        modify("Production &BOM")
        {
            ApplicationArea = Basic;
        }
        modify("&Routing")
        {
            ApplicationArea = Basic;
        }
        modify("&Purchase Order")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (ActionType) on "Tasks(Action 67)".


        //Unsupported feature: Property Modification (Name) on "Tasks(Action 67)".


        //Unsupported feature: Property Insertion (IsHeader) on "Tasks(Action 67)".

        modify("Item &Journal")
        {

            //Unsupported feature: Property Modification (Level) on ""Item &Journal"(Action 46)".

            ApplicationArea = Basic;
        }
        modify("Re&quisition Worksheet")
        {

            //Unsupported feature: Property Modification (Level) on ""Re&quisition Worksheet"(Action 47)".

            ApplicationArea = Basic;
        }
        modify("Planning Works&heet")
        {

            //Unsupported feature: Property Modification (Level) on ""Planning Works&heet"(Action 48)".

            ApplicationArea = Basic;
        }
        modify("Item Availability by Timeline")
        {

            //Unsupported feature: Property Modification (Level) on ""Item Availability by Timeline"(Action 4)".

            ApplicationArea = Basic;
        }
        modify("Subcontracting &Worksheet")
        {

            //Unsupported feature: Property Modification (Level) on ""Subcontracting &Worksheet"(Action 8)".

            ApplicationArea = Basic;
        }
        modify("Change Pro&duction Order Status")
        {

            //Unsupported feature: Property Modification (Level) on ""Change Pro&duction Order Status"(Action 122)".

            ApplicationArea = Basic;
        }
        modify("Order Pla&nning")
        {

            //Unsupported feature: Property Modification (Level) on ""Order Pla&nning"(Action 123)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (ActionType) on "Administration(Action 84)".


        //Unsupported feature: Property Modification (Name) on "Administration(Action 84)".


        //Unsupported feature: Property Insertion (IsHeader) on "Administration(Action 84)".

        modify("Order Promising S&etup")
        {

            //Unsupported feature: Property Modification (Level) on ""Order Promising S&etup"(Action 124)".

            ApplicationArea = Basic;
        }
        modify("&Manufacturing Setup")
        {

            //Unsupported feature: Property Modification (Level) on ""&Manufacturing Setup"(Action 125)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (ActionType) on "History(Action 89)".


        //Unsupported feature: Property Modification (Name) on "History(Action 89)".


        //Unsupported feature: Property Insertion (IsHeader) on "History(Action 89)".

        modify("Item &Tracing")
        {

            //Unsupported feature: Property Modification (Level) on ""Item &Tracing"(Action 126)".

            ApplicationArea = Basic;
        }
        modify("Navi&gate")
        {

            //Unsupported feature: Property Modification (Level) on ""Navi&gate"(Action 90)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (CaptionML) on "Capacity(Action 109)".

        modify("Routing Sheet")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Inventory - &Availability Plan"(Action 108)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning Availability"(Action 110)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Capacity Task List"(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Subcontractor - Dispatch List"(Action 18)".


        //Unsupported feature: Property Deletion (CaptionML) on "Production(Action 111)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Production Order - &Shortage List"(Action 112)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""D&etailed Calculation"(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""P&roduction Order - Calculation"(Action 114)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sta&tus"(Action 115)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Inventory &Valuation WIP"(Action 116)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Demand Forecast"(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Transfer Orders"(Action 106)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Simulated Production Orders"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planned Production Orders"(Action 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Firm Planned Production Orders"(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Released Production Orders"(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Finished Production Orders"(Action 10)".

        modify("Sales & Purchases")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Sales Orders"(Action 102)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Orders"(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Purchase Orders"(Action 103)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Orders"(Action 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemJournals(Action 22)".


        //Unsupported feature: Property Deletion (Promoted) on "ItemJournals(Action 22)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ItemJournals(Action 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemReclassificationJournals(Action 23)".


        //Unsupported feature: Property Deletion (Promoted) on "ItemReclassificationJournals(Action 23)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ItemReclassificationJournals(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RevaluationJournals(Action 24)".


        //Unsupported feature: Property Deletion (Promoted) on "RevaluationJournals(Action 24)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "RevaluationJournals(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PlanningWorksheets(Action 33)".


        //Unsupported feature: Property Deletion (Promoted) on "PlanningWorksheets(Action 33)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PlanningWorksheets(Action 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RequisitionWorksheets(Action 32)".


        //Unsupported feature: Property Deletion (Promoted) on "RequisitionWorksheets(Action 32)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "RequisitionWorksheets(Action 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SubcontractingWorksheets(Action 34)".


        //Unsupported feature: Property Deletion (Promoted) on "SubcontractingWorksheets(Action 34)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "SubcontractingWorksheets(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Standard Cost Worksheet"(Action 35)".


        //Unsupported feature: Property Deletion (Promoted) on ""Standard Cost Worksheet"(Action 35)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Standard Cost Worksheet"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ProductionBOM(Action 15)".


        //Unsupported feature: Property Deletion (Promoted) on "ProductionBOM(Action 15)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ProductionBOM(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ProductionBOMCertified(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Routings(Action 26)".


        //Unsupported feature: Property Deletion (Promoted) on "Routings(Action 26)".


        //Unsupported feature: Property Deletion (Image) on "Routings(Action 26)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Routings(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Routing Links"(Action 27)".


        //Unsupported feature: Property Deletion (Promoted) on ""Routing Links"(Action 27)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Routing Links"(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Standard Tasks"(Action 28)".


        //Unsupported feature: Property Deletion (Promoted) on ""Standard Tasks"(Action 28)".


        //Unsupported feature: Property Deletion (Image) on ""Standard Tasks"(Action 28)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Standard Tasks"(Action 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Families(Action 29)".


        //Unsupported feature: Property Deletion (Promoted) on "Families(Action 29)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Families(Action 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""ProdDesign_Items"(Action 30)".


        //Unsupported feature: Property Deletion (Promoted) on ""ProdDesign_Items"(Action 30)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""ProdDesign_Items"(Action 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""ProdDesign_ItemsProduced"(Action 31)".


        //Unsupported feature: Property Deletion (Promoted) on ""ProdDesign_ItemsProduced"(Action 31)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""ProdDesign_ItemsProduced"(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""ProdDesign_ItemsRawMaterials"(Action 36)".


        //Unsupported feature: Property Deletion (Promoted) on ""ProdDesign_ItemsRawMaterials"(Action 36)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""ProdDesign_ItemsRawMaterials"(Action 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Stockkeeping Units"(Action 37)".


        //Unsupported feature: Property Deletion (Promoted) on ""Stockkeeping Units"(Action 37)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Stockkeeping Units"(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WorkCenters(Action 39)".


        //Unsupported feature: Property Deletion (Promoted) on "WorkCenters(Action 39)".


        //Unsupported feature: Property Deletion (Image) on "WorkCenters(Action 39)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "WorkCenters(Action 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WorkCentersInternal(Action 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WorkCentersSubcontracted(Action 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Machine Centers"(Action 42)".


        //Unsupported feature: Property Deletion (Promoted) on ""Machine Centers"(Action 42)".


        //Unsupported feature: Property Deletion (Image) on ""Machine Centers"(Action 42)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Machine Centers"(Action 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Absence"(Action 43)".


        //Unsupported feature: Property Deletion (Promoted) on ""Registered Absence"(Action 43)".


        //Unsupported feature: Property Deletion (Image) on ""Registered Absence"(Action 43)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Registered Absence"(Action 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Vendors(Action 44)".


        //Unsupported feature: Property Deletion (Promoted) on "Vendors(Action 44)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Vendors(Action 44)".

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
        modify("Service Connections")
        {
            Visible = false;
        }
        modify(Extensions)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Workflows(Action 11)".


        //Unsupported feature: Property Deletion (Promoted) on "Workflows(Action 11)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Workflows(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Item"(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Production &Order"(Action 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Production &BOM"(Action 51)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Routing"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Purchase Order"(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Journal"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Re&quisition Worksheet"(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning Works&heet"(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Availability by Timeline"(Action 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Subcontracting &Worksheet"(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Change Pro&duction Order Status"(Action 122)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Pla&nning"(Action 123)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Promising S&etup"(Action 124)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Manufacturing Setup"(Action 125)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracing"(Action 126)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Navi&gate"(Action 90)".

        addfirst(Reporting)
        {
            action("Ro&uting Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Ro&uting Sheet';
                Image = "Report";
                RunObject = Report "Routing Sheet";
            }
        }
        addafter(Production)
        {
            separator(Action113)
            {
            }
        }
        addafter("Production Orders")
        {
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
        }
        addafter("Production Orders")
        {
            action("Raw Materials")
            {
                ApplicationArea = Basic;
                Caption = 'Raw Materials';
                RunObject = Page "Item List";
                RunPageView = where("Low-Level Code"=filter(>0),
                                    "Replenishment System"=const(Purchase),
                                    "Production BOM No."=filter(=''));
            }
            // action("Stockkeeping Units")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Stockkeeping Units';
            //     Image = SKU;
            //     RunObject = Page "Stockkeeping Unit List";
            // }
            action("Production BOMs")
            {
                ApplicationArea = Basic;
                Caption = 'Production BOMs';
                RunObject = Page "Production BOM List";
            }
            action(Certified)
            {
                ApplicationArea = Basic;
                Caption = 'Certified';
                RunObject = Page "Production BOM List";
                RunPageView = where(Status=const(Certified));
            }
            // action(Routings)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Routings';
            //     RunObject = Page "Routing List";
            // }
        }
        addafter(Tasks)
        {
            separator(Action45)
            {
            }
        }
        // moveafter(ActionContainer1900000011;"Simulated Production Orders")
        // moveafter("Production Forecast";"Blanket Sales Orders")
        moveafter("Transfer Orders";"Production Orders")
        moveafter(Vendors;Workflows)
    }
}
