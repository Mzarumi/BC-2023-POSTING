#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187007 pageextension52187007 extends "Business Manager Role Center"
{

    //Unsupported feature: Property Modification (Name) on ""Business Manager Role Center"(Page 9022)".

    Caption = 'Small Business Role Center';
    layout
    {

        //Unsupported feature: Property Modification (AccessByPermission) on "Control16(Control 16)".


        //Unsupported feature: Property Modification (AccessByPermission) on "Control55(Control 55)".


        //Unsupported feature: Property Modification (PagePartID) on "Control55(Control 55)".

        // modify(Control7)
        // {
        //     Caption = 'Favorite Customers';

        //     //Unsupported feature: Property Modification (PagePartID) on "Control7(Control 7)".

        // }
        modify(Control139)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control16(Control 16)".


        //Unsupported feature: Property Deletion (CaptionML) on "Control55(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Control55(Control 55)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control55(Control 55)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control7(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control9(Control 9)".

        modify(Control98)
        {
            Visible = false;
        }
        modify(Control46)
        {
            Visible = false;
        }
        // modify(Control113)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (AccessByPermission) on "Control96(Control 96)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control96(Control 96)".

    }
    actions
    {

        //Unsupported feature: Property Modification (ActionContainerType) on "ActionContainer1(Action 1)".

        modify("Sales Quote")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales Quote"(Action 52)".

            ToolTip = 'Create a new sales quote so you can offer items at a certain price to a customer.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales Quote"(Action 52)".


            //Unsupported feature: Property Modification (Image) on ""Sales Quote"(Action 52)".

        }
        modify("Sales Invoice")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales Invoice"(Action 2)".

            ToolTip = 'Create a new sales invoice so you can sell items to a customer.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales Invoice"(Action 2)".


            //Unsupported feature: Property Modification (Image) on ""Sales Invoice"(Action 2)".

        }
        modify("<Page Purchase Order>")
        {

            //Unsupported feature: Property Modification (Name) on ""<Page Purchase Order>"(Action 5)".

            Caption = 'Posted Sales Invoices';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Purchase Order>"(Action 5)".

        }
        modify("Purchase Invoice")
        {

            //Unsupported feature: Property Modification (Level) on ""Purchase Invoice"(Action 32)".

            ToolTip = 'Create a new purchase invoice so you can buy items from a vendor.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Purchase Invoice"(Action 32)".


            //Unsupported feature: Property Modification (Image) on ""Purchase Invoice"(Action 32)".

        }
        modify("Register Customer Payments")
        {
            Caption = 'Payment Registration';
            ToolTip = 'Process your customer''s payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post and apply the payments to your books.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Register Customer Payments"(Action 59)".

        }
        modify("Statement of Retained Earnings")
        {
            Caption = 'Service Connections';
            ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Statement of Retained Earnings"(Action 78)".


            //Unsupported feature: Property Modification (Image) on ""Statement of Retained Earnings"(Action 78)".


            //Unsupported feature: Property Modification (Name) on ""Statement of Retained Earnings"(Action 78)".

        }
        modify("Company Settings")
        {
            Caption = 'Show/Hide Getting Started';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Company Settings"(Action 54)".


            //Unsupported feature: Property Modification (Image) on ""Company Settings"(Action 54)".


            //Unsupported feature: Property Modification (Name) on ""Company Settings"(Action 54)".

        }
        modify("Assisted Setup")
        {

            //Unsupported feature: Property Modification (ActionType) on ""Assisted Setup"(Action 27)".

            Caption = 'Setup';

            //Unsupported feature: Property Modification (Image) on ""Assisted Setup"(Action 27)".


            //Unsupported feature: Property Modification (Name) on ""Assisted Setup"(Action 27)".

        }
        modify("Services & Extensions")
        {

            //Unsupported feature: Property Modification (Level) on ""Services & Extensions"(Action 49)".


            //Unsupported feature: Property Modification (ActionType) on ""Services & Extensions"(Action 49)".

            Caption = 'Company Information';

            //Unsupported feature: Property Modification (Image) on ""Services & Extensions"(Action 49)".


            //Unsupported feature: Property Modification (Name) on ""Services & Extensions"(Action 49)".

            ToolTip = 'Enter the company name, address, and bank information that will be inserted on your business documents.';

            //Unsupported feature: Property Insertion (RunObject) on ""Services & Extensions"(Action 49)".

            //ApplicationArea = Basic;
        }
        // modify(ActionContainer4)
        // {

        //     //Unsupported feature: Property Modification (ActionType) on "ActionContainer4(Action 4)".


        //     //Unsupported feature: Property Modification (Name) on "ActionContainer4(Action 4)".


        //     //Unsupported feature: Property Insertion (Level) on "ActionContainer4(Action 4)".

        //     Caption = 'New';
        // }
        modify(Customers)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Customers(Action 14)".

        }
        modify(Vendors)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Vendors(Action 6)".

        }
        modify(Items)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "Items(Action 15)".

        }

        //Unsupported feature: Property Modification (Name) on "ActionGroup39(Action 39)".

        modify(GeneralJournals)
        {

            //Unsupported feature: Property Modification (Name) on "GeneralJournals(Action 11)".

            ApplicationArea = Basic;
        }
        modify(Action3)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Action3(Action 3)".

        }
        modify("G/L Budgets")
        {
            ApplicationArea = Basic;
        }
        // modify("Fixed Assets")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Account Schedules")
        {
            ApplicationArea = Basic;
        }
        modify("Intrastat Journals")
        {
            ApplicationArea = Basic;
        }
        modify("Sales Analysis Reports")
        {
            ApplicationArea = Basic;
        }
        modify("Purchase Analysis Reports")
        {
            ApplicationArea = Basic;
        }
        modify("Inventory Analysis Reports")
        {
            ApplicationArea = Basic;
        }
        // modify("VAT Reports")
        // {
        //     ApplicationArea = Basic;
        // }
        modify(Currencies)
        {
            ApplicationArea = Basic;
        }
        modify(Employees)
        {
            ApplicationArea = Basic;
        }
        modify("VAT Statements")
        {
            ApplicationArea = Basic;
        }
        modify("Cash Management")
        {
            Caption = 'Advanced Finance';
            ToolTip = 'Manage budgets, cash flows, fixed assets, VAT, and analyze sales.';

            //Unsupported feature: Property Modification (Name) on ""Cash Management"(Action 42)".


            //Unsupported feature: Property Insertion (Image) on ""Cash Management"(Action 42)".

        }
        modify("Cash Flow Forecasts")
        {
            ApplicationArea = Basic;
        }
        modify("Chart of Cash Flow Accounts")
        {
            ApplicationArea = Basic;
        }
        modify("Cash Flow Manual Revenues")
        {
            ApplicationArea = Basic;
        }
        modify("Cash Flow Manual Expenses")
        {
            ApplicationArea = Basic;
        }
        modify(CashReceiptJournals)
        {

            //Unsupported feature: Property Modification (Name) on "CashReceiptJournals(Action 18)".

            ApplicationArea = Basic;
        }
        modify(PaymentJournals)
        {

            //Unsupported feature: Property Modification (Name) on "PaymentJournals(Action 17)".

            ApplicationArea = Basic;
        }
        modify(Action23)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Action23(Action 23)".

        }
        modify("Bank Acc. Statements")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Recon. Journals")
        {
            Caption = 'Bank Acc. Reconciliations';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Payment Recon. Journals"(Action 20)".


            //Unsupported feature: Property Modification (Image) on ""Payment Recon. Journals"(Action 20)".


            //Unsupported feature: Property Modification (Name) on ""Payment Recon. Journals"(Action 20)".

        }
        modify("Direct Debit Collections")
        {
            ApplicationArea = Basic;
        }
        modify(BankAccountReconciliations)
        {

            //Unsupported feature: Property Modification (Level) on "BankAccountReconciliations(Action 60)".


            //Unsupported feature: Property Modification (Name) on "BankAccountReconciliations(Action 60)".

            Caption = 'Fixed Assets Setup';
            ToolTip = 'Define your accounting policies for fixed assets, such as the allowed posting period and whether to allow posting to main assets. Set up your number series for creating new fixed assets.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on "BankAccountReconciliations(Action 60)".


            //Unsupported feature: Property Modification (Image) on "BankAccountReconciliations(Action 60)".

        }
        // modify(ActionGroup40)
        // {
        //     ToolTip = 'Make quotes, orders, and credit memos. See customers and transaction history.';

        //     //Unsupported feature: Property Modification (Name) on "ActionGroup40(Action 40)".

        // }
        modify("Sales_CustomerList")
        {

            //Unsupported feature: Property Modification (Name) on ""Sales_CustomerList"(Action 33)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales_CustomerList"(Action 33)".

        }
        modify("Sales Quotes")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales Quotes"(Action 29)".

        }
        modify("Sales Invoices")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales Invoices"(Action 48)".

        }
        modify("Sales Credit Memos")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Sales Credit Memos"(Action 44)".

        }
        modify(Reminders)
        {
            ApplicationArea = Basic;
        }
        modify("Finance Charge Memos")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Sales Invoices")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Posted Sales Invoices"(Action 50)".


            //Unsupported feature: Property Modification (Name) on ""Posted Sales Invoices"(Action 50)".

        }
        modify("Posted Sales Credit Memos")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Posted Sales Credit Memos"(Action 45)".

        }
        modify("Issued Reminders")
        {
            ApplicationArea = Basic;
        }
        modify("Issued Finance Charge Memos")
        {
            ApplicationArea = Basic;
        }
        // modify(ActionGroup41)
        // {
        //     Caption = 'Purchase';

        //     //Unsupported feature: Property Modification (Name) on "ActionGroup41(Action 41)".

        // }
        modify("Purchase_VendorList")
        {

            //Unsupported feature: Property Modification (Name) on ""Purchase_VendorList"(Action 36)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""Purchase_VendorList"(Action 36)".

        }
        modify("Incoming Documents")
        {
            ApplicationArea = Basic;
        }
        modify("<Page Purchase Orders>")
        {

            //Unsupported feature: Property Modification (Level) on ""<Page Purchase Orders>"(Action 22)".


            //Unsupported feature: Property Modification (Name) on ""<Page Purchase Orders>"(Action 22)".

            Caption = 'General Ledger Setup';
            ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Purchase Orders>"(Action 22)".


            //Unsupported feature: Property Insertion (Image) on ""<Page Purchase Orders>"(Action 22)".

        }
        modify("<Page Purchase Invoices>")
        {

            //Unsupported feature: Property Modification (Name) on ""<Page Purchase Invoices>"(Action 57)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Purchase Invoices>"(Action 57)".

        }
        modify("<Page Purchase Credit Memos>")
        {

            //Unsupported feature: Property Modification (Name) on ""<Page Purchase Credit Memos>"(Action 56)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Purchase Credit Memos>"(Action 56)".

        }
        modify("<Page Posted Purchase Invoices>")
        {

            //Unsupported feature: Property Modification (Name) on ""<Page Posted Purchase Invoices>"(Action 53)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Posted Purchase Invoices>"(Action 53)".

        }
        modify("<Page Posted Purchase Credit Memos>")
        {

            //Unsupported feature: Property Modification (Name) on ""<Page Posted Purchase Credit Memos>"(Action 51)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Posted Purchase Credit Memos>"(Action 51)".

        }
        modify("<Page Posted Purchase Receipts>")
        {

            //Unsupported feature: Property Modification (Level) on ""<Page Posted Purchase Receipts>"(Action 31)".


            //Unsupported feature: Property Modification (Name) on ""<Page Posted Purchase Receipts>"(Action 31)".

            Caption = 'Sales & Receivables Setup';
            ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""<Page Posted Purchase Receipts>"(Action 31)".


            //Unsupported feature: Property Insertion (Image) on ""<Page Posted Purchase Receipts>"(Action 31)".

        }
        // modify(Finance)
        // {

        //     //Unsupported feature: Property Modification (Level) on "Finance(Action 47)".


        //     //Unsupported feature: Property Modification (Name) on "Finance(Action 47)".

        //     Caption = 'Inventory Setup';
        //     ToolTip = 'Define your general inventory policies, such as whether to allow negative inventory and how to post and adjust item costs. Set up your number series for creating new inventory items or services.';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on "Finance(Action 47)".


        //     //Unsupported feature: Property Insertion (Image) on "Finance(Action 47)".

        // }
        // modify(Jobs)
        // {

        //     //Unsupported feature: Property Modification (Level) on "Jobs(Action 58)".


        //     //Unsupported feature: Property Modification (ActionType) on "Jobs(Action 58)".


        //     //Unsupported feature: Property Modification (Name) on "Jobs(Action 58)".

        //     Caption = 'Payments';
        // }
        // modify(HR)
        // {

        //     //Unsupported feature: Property Modification (Level) on "HR(Action 69)".


        //     //Unsupported feature: Property Modification (Name) on "HR(Action 69)".

        //     Caption = 'Posted Purchase Invoices';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on "HR(Action 69)".

        // }
        // modify(System)
        // {

        //     //Unsupported feature: Property Modification (Level) on "System(Action 93)".


        //     //Unsupported feature: Property Modification (Name) on "System(Action 93)".

        //     Caption = 'Jobs Setup';
        //     ToolTip = 'Define your accounting policies for jobs, such as which WIP method to use and whether to update job item costs automatically.';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (RunObject) on "System(Action 93)".


        //Unsupported feature: Property Insertion (Image) on "System(Action 93)".

        // }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Sales Quote"(Action 52)".

        modify("Sales Order")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Sales Invoice"(Action 2)".

        modify("Purchase Quote")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""<Page Purchase Order>"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""<Page Purchase Order>"(Action 5)".


        //Unsupported feature: Property Deletion (Image) on ""<Page Purchase Order>"(Action 5)".


        //Unsupported feature: Property Deletion (RunPageMode) on ""<Page Purchase Order>"(Action 5)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Purchase Invoice"(Action 32)".

        // modify(ActionContainer140)
        // {
        //     Visible = false;
        // }
        modify(New)
        {
            Visible = false;
        }
        modify(Customer)
        {
            Visible = false;
        }
        modify(Vendor)
        {
            Visible = false;
        }
        modify(Payments)
        {
            Visible = false;
        }
        modify("Payment Reconciliation Journals")
        {
            Visible = false;
        }
        modify("Import Bank Transactions")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Register Customer Payments"(Action 59)".

        modify("Create Vendor Payments")
        {
            Visible = false;
        }
        modify(Reports)
        {
            Visible = false;
        }
        modify("Financial Statements")
        {
            Visible = false;
        }
        modify("Balance Sheet")
        {
            Visible = false;
        }
        modify("Income Statement")
        {
            Visible = false;
        }
        modify("Statement of Cash Flows")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Promoted) on ""Statement of Retained Earnings"(Action 78)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on ""Statement of Retained Earnings"(Action 78)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Statement of Retained Earnings"(Action 78)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Company Settings"(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assisted Setup"(Action 27)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Assisted Setup"(Action 27)".


        //Unsupported feature: Property Deletion (RunObject) on ""Assisted Setup"(Action 27)".

        modify(Extensions)
        {
            Visible = false;
        }
        modify("Service Connections")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ActionContainerType) on "ActionContainer4(Action 4)".

        modify("Excel Reports")
        {
            Visible = false;
        }
        modify(ExcelTemplatesBalanceSheet)
        {
            Visible = false;
        }
        modify(ExcelTemplateIncomeStmt)
        {
            Visible = false;
        }
        modify(ExcelTemplateCashFlowStmt)
        {
            Visible = false;
        }
        modify(ExcelTemplateRetainedEarn)
        {
            Visible = false;
        }
        modify(ExcelTemplateTrialBalance)
        {
            Visible = false;
        }
        modify(ExcelTemplateAgedAccPay)
        {
            Visible = false;
        }
        modify(ExcelTemplateAgedAccRec)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Customers(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Vendors(Action 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Items(Action 15)".

        modify("Bank Accounts")
        {
            Visible = false;
        }
        modify("Chart of Accounts")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "GeneralJournals(Action 11)".


        //Unsupported feature: Property Deletion (Promoted) on "GeneralJournals(Action 11)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "GeneralJournals(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action3(Action 3)".


        //Unsupported feature: Property Deletion (Promoted) on "Action3(Action 3)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Action3(Action 3)".

        modify("G/L Account Categories")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Budgets"(Action 63)".


        //Unsupported feature: Property Deletion (Promoted) on ""G/L Budgets"(Action 63)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""G/L Budgets"(Action 63)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Assets"(Action 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Schedules"(Action 74)".


        //Unsupported feature: Property Deletion (Promoted) on ""Account Schedules"(Action 74)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Account Schedules"(Action 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Intrastat Journals"(Action 30)".


        //Unsupported feature: Property Deletion (Promoted) on ""Intrastat Journals"(Action 30)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Intrastat Journals"(Action 30)".

        modify("Sales Budgets")
        {
            Visible = false;
        }
        modify("Purchase Budgets")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Analysis Reports"(Action 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Analysis Reports"(Action 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Inventory Analysis Reports"(Action 71)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Reports"(Action 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Currencies(Action 26)".


        //Unsupported feature: Property Deletion (Promoted) on "Currencies(Action 26)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Currencies(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Employees(Action 25)".


        //Unsupported feature: Property Deletion (Promoted) on "Employees(Action 25)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Employees(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Statements"(Action 28)".


        //Unsupported feature: Property Deletion (Promoted) on ""VAT Statements"(Action 28)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""VAT Statements"(Action 28)".

        modify(Dimensions)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cash Flow Forecasts"(Action 68)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Chart of Cash Flow Accounts"(Action 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cash Flow Manual Revenues"(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cash Flow Manual Expenses"(Action 64)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CashReceiptJournals(Action 18)".


        //Unsupported feature: Property Deletion (Promoted) on "CashReceiptJournals(Action 18)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "CashReceiptJournals(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PaymentJournals(Action 17)".


        //Unsupported feature: Property Deletion (Promoted) on "PaymentJournals(Action 17)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PaymentJournals(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action23(Action 23)".


        //Unsupported feature: Property Deletion (Promoted) on "Action23(Action 23)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Action23(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Acc. Statements"(Action 19)".


        //Unsupported feature: Property Deletion (Promoted) on ""Bank Acc. Statements"(Action 19)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Bank Acc. Statements"(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Recon. Journals"(Action 20)".


        //Unsupported feature: Property Deletion (Promoted) on ""Payment Recon. Journals"(Action 20)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Payment Recon. Journals"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Direct Debit Collections"(Action 24)".


        //Unsupported feature: Property Deletion (Promoted) on ""Direct Debit Collections"(Action 24)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Direct Debit Collections"(Action 24)".

        modify("Payment Terms")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Promoted) on "BankAccountReconciliations(Action 60)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "BankAccountReconciliations(Action 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales_CustomerList"(Action 33)".


        //Unsupported feature: Property Deletion (Promoted) on ""Sales_CustomerList"(Action 33)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Sales_CustomerList"(Action 33)".

        modify(Action129)
        {
            Visible = false;
        }
        modify("Item Charges")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Quotes"(Action 29)".


        //Unsupported feature: Property Deletion (Promoted) on ""Sales Quotes"(Action 29)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Sales Quotes"(Action 29)".

        modify("Sales Orders")
        {
            Visible = false;
        }
        modify("Blanket Sales Orders")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Invoices"(Action 48)".


        //Unsupported feature: Property Deletion (Promoted) on ""Sales Invoices"(Action 48)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Sales Invoices"(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Credit Memos"(Action 44)".


        //Unsupported feature: Property Deletion (Promoted) on ""Sales Credit Memos"(Action 44)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Sales Credit Memos"(Action 44)".

        modify("Sales Return Orders")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Reminders(Action 37)".


        //Unsupported feature: Property Deletion (Promoted) on "Reminders(Action 37)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Reminders(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Finance Charge Memos"(Action 35)".


        //Unsupported feature: Property Deletion (Promoted) on ""Finance Charge Memos"(Action 35)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Finance Charge Memos"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Invoices"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Sales Credit Memos"(Action 45)".

        modify("Posted Sales Return Receipts")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Issued Reminders"(Action 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Issued Finance Charge Memos"(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase_VendorList"(Action 36)".


        //Unsupported feature: Property Deletion (Promoted) on ""Purchase_VendorList"(Action 36)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Purchase_VendorList"(Action 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Incoming Documents"(Action 79)".


        //Unsupported feature: Property Deletion (Promoted) on ""Incoming Documents"(Action 79)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Incoming Documents"(Action 79)".


        //Unsupported feature: Property Deletion (Gesture) on ""Incoming Documents"(Action 79)".

        modify(Action131)
        {
            Visible = false;
        }
        modify("Purchase Quotes")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Promoted) on ""<Page Purchase Orders>"(Action 22)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""<Page Purchase Orders>"(Action 22)".

        modify("Blanket Purchase Orders")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""<Page Purchase Invoices>"(Action 57)".


        //Unsupported feature: Property Deletion (Promoted) on ""<Page Purchase Invoices>"(Action 57)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""<Page Purchase Invoices>"(Action 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""<Page Purchase Credit Memos>"(Action 56)".


        //Unsupported feature: Property Deletion (Promoted) on ""<Page Purchase Credit Memos>"(Action 56)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""<Page Purchase Credit Memos>"(Action 56)".

        modify("Purchase Return Orders")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""<Page Posted Purchase Invoices>"(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""<Page Posted Purchase Credit Memos>"(Action 51)".

        modify("Posted Purchase Return Shipments")
        {
            Visible = false;
        }
        modify(SetupAndExtensions)
        {
            Visible = false;
        }
        modify(Action104)
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

        //Unsupported feature: Property Deletion (RunPageView) on "Finance(Action 47)".

        // modify(Sales)
        // {
        //     Visible = false;
        // }
        // modify(Purchasing)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Jobs(Action 58)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Jobs(Action 58)".


        //Unsupported feature: Property Deletion (RunObject) on "Jobs(Action 58)".


        //Unsupported feature: Property Deletion (RunPageView) on "Jobs(Action 58)".

        // modify("Fixed Assets")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "HR(Action 69)".


        //Unsupported feature: Property Deletion (RunPageView) on "HR(Action 69)".

        // modify(Inventory)
        // {
        //     Visible = false;
        // }
        // modify(Service)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (RunPageView) on "System(Action 93)".

        // modify("Relationship Management")
        // {
        //     Visible = false;
        // }
        // modify(Intercompany)
        // {
        //     Visible = false;
        // }
        modify(Action107)
        {
            Visible = false;
        }
        modify(Action106)
        {
            Visible = false;
        }
        modify(Workflows)
        {
            Visible = false;
        }
        // addfirst("<Page Posted Purchase Receipts>")
        // {
        //     action("Purchases & Payables Setup")
        //     {
        //         ApplicationArea = Basic;
        //         Caption = 'Purchases & Payables Setup';
        //         Image = Purchase;
        //         RunObject = Page "Mini Purch. & Payables Setup";
        //         ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
        //     }
        // }
        // addfirst(BankAccountReconciliations)
        // {
        //     action("Human Resources Setup")
        //     {
        //         ApplicationArea = Basic;
        //         Caption = 'Human Resources Setup';
        //         Image = HRSetup;
        //         RunObject = Page "Human Resources Setup";
        //         ToolTip = 'Set up number series for creating new employee cards and define if employment time is measured by days or hours.';
        //     }
        // }
        addafter(Setup)
        {
            group("Getting Started")
            {
                Caption = 'Getting Started';
            }
        }
        // addafter(ActionGroup41)
        // {
        //     group(Approvals)
        //     {
        //         Caption = 'Approvals';
        //         ToolTip = 'Approve requests made by other users.';
        //         action("Requests to Approve")
        //         {
        //             ApplicationArea = Basic;
        //             Caption = 'Requests to Approve';
        //             Image = Approvals;
        //             RunObject = Page "Requests to Approve";
        //         }
        //     }
        // }
        // moveafter(ActionContainer1;ActionContainer4)
        // moveafter("Sales Invoice";"Purchase Invoice")
        // moveafter("Purchase Invoice";Jobs)
        // moveafter(Payments;"Register Customer Payments")
        // moveafter("Payment Registration";Setup)
        // moveafter(Setup;"Assisted Setup")
        // moveafter("Company Information";"<Page Purchase Orders>")
        // moveafter("General Ledger Setup";"<Page Posted Purchase Receipts>")
        // moveafter("Inventory Setup";BankAccountReconciliations)
        // moveafter("Fixed Assets Setup";System)
        // moveafter("Jobs Setup";"Statement of Retained Earnings")
        // moveafter("Service Connections";"Company Settings")
        // moveafter("Show/Hide Getting Started";ActionContainer8)
        // moveafter("Posted Sales Invoices";HR)
        // moveafter("Chart of Accounts";CashReceiptJournals)
        // moveafter("Bank Accounts";"Payment Recon. Journals")
        // moveafter("Bank Acc. Reconciliations";"Bank Acc. Statements")
        // moveafter("Bank Acc. Statements";"Direct Debit Collections")
        // moveafter("Direct Debit Collections";Currencies)
        // moveafter("VAT Statements";"Intrastat Journals")
        // moveafter("Intrastat Journals";ActionGroup40)
        // moveafter("Incoming Documents";"<Page Purchase Invoices>")
        // moveafter("<Page Mini Purchase Invoices>";"<Page Posted Purchase Invoices>")
        // moveafter("<Page Mini Posted Purchase Invoices>";"<Page Purchase Credit Memos>")
        // moveafter("<Page Mini Purchase Credit Memos>";"<Page Posted Purchase Credit Memos>")
        // moveafter("<Page Mini Posted Purchase Credit Memos>";"Cash Management")
    }
}
