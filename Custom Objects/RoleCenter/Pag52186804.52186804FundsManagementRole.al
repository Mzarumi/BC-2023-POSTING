page 52186804 "52186804-Funds Management Role"
{
    Caption = '52186804-Funds Management Role';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control99; "Finance Performance")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group("G/L Reports")
            {
                Caption = 'Funds Management Reports';
                action("&Funds Management Reports")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Payment Vouchers';
                    Image = "Report";
                    RunObject = Report "Payment Voucher";
                    ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
                }
                action("&Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Receipts';
                    Image = "Report";
                    RunObject = Report "Daily Cashier Summary";
                    ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
                }

            }
            group("Payement Process Reports")
            {
                Caption = 'Payment Process';
                action("Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Vouchers';
                    Image = "Report";
                    RunObject = Report "Payment History";
                    ToolTip = 'View Payment Vouchers';
                }
                action("Staff Payment Vouchers.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Payment Vouchers';
                    Image = "Report";
                    RunObject = Report "Board Payment Voucher Report";
                    ToolTip = 'View Staff Vouchers';
                }
                action("Board Payment Vouchers.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Payment Vouchers';
                    Image = "Report";
                    RunObject = Report "Board Payment Voucher Report";
                    ToolTip = 'View Board Vouchers';
                }
            }
            group("Imprest and Claims Management.")
            {
                Caption = 'Imprest and Claims Management';
                action("Staff Requisition")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Requisition';
                    Image = "Report";
                    RunObject = Report "Imprest Voucher";
                    ToolTip = 'Imprest Vouchers.';
                }
                action("Staff Claims")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Claims';
                    Image = "Report";
                    RunObject = Report "OverTimeClaims Voucher";//
                    ToolTip = 'Overtime Claims';
                }

            }
        }
        area(embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }

            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                Image = Invoice;
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }

            action(Budgets)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Budgets';
                RunObject = Page "G/L Budget Names";
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }

        }
        area(sections)
        {
            group(Action172)
            {
                Caption = 'Payment and Receipts';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                group(PaymentProcessing)
                {
                    Caption = 'Payment Processing';
                    ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                    action("Payment Voucher")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Vouchers';
                        Image = Payment;
                        RunObject = Page "Payment Vouchers List";
                        ToolTip = 'Payment Vouchers List.';
                    }
                    action("Petty Cash Vouchers")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Petty Cash Vouchers';
                        RunObject = Page "Petty Cash Vouchers List";
                        ToolTip = 'Petty Cash Vouchers List';
                    }
                    action("Payment Voucher Board")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Voucher Board';
                        RunObject = Page "Payment Voucher Board List";
                        ToolTip = 'Payment Voucher Board List.';
                    }
                    action("Payment Voucher Staff ")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Voucher Staff';
                        Image = Payment;
                        RunObject = Page "Payment Voucher Staff List";
                        ToolTip = 'Payment Voucher Staff List .';
                    }
                    action("Payment Voucher Delegate")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Payment Voucher Delegate';
                        Image = Payment;
                        RunObject = Page "Payment Voucher Delegate  List";
                        ToolTip = 'Payment Voucher Delegate  List.';
                    }

                }
                group(Receipting)
                {
                    Caption = 'Receipting Process';
                    ToolTip = 'Post financial transactions.';
                    action(GeneralJournals)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Receipts List ';
                        Image = Receipt;
                        RunObject = Page "Receipts List";
                        ToolTip = 'Receipts List ';
                    }
                    action("<Action3>")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Checkoff Receipt';
                        Image = CheckList;
                        RunObject = page "Checkoff Receipt Trans List";
                        ToolTip = 'Checkoff Receipt Trans List ';
                    }

                }
            }
            group("Bank Transfers")
            {
                Caption = 'Cash Transfers';
                ToolTip = 'Bank & Cash Transfer .  ';
                action(CashReceiptJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank & Cash Transfer ';
                    Image = BankAccountLedger;
                    RunObject = Page "Bank & Cash Transfers List";
                    ToolTip = 'Bank & Cash Transfers List .';
                }
                action(PaymentJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vote Transfer List ';
                    Image = TransferFunds;
                    RunObject = Page "Vote Transfer List.";
                    ToolTip = 'Vote Transfer List.';
                }
                action(Action164)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Direct Debit Collections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';
                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }

                action(Deposit)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Deposit';
                    Image = DepositSlip;
                    RunObject = Codeunit "Open Deposits Page";
                    ToolTip = 'Create a new deposit. ';
                }

            }
            group(Action84)
            {
                Caption = 'Staff Advancing and Accounting';
                ToolTip = 'Manages Imprest requisition, accounting, Staff claims and overtime';
                group(ImprestRequisition)
                {
                    Caption = 'Staff Advancing and Accounting';
                    ToolTip = 'Manages Imprest requisition, accounting';

                    action("Imprest Requisition")
                    {
                        ApplicationArea = imprest;
                        Caption = 'Imprest Requisition List';
                        RunObject = Page "Imprest Vouchers List";
                        ToolTip = 'Imprest Vouchers List .';
                    }
                    action("Imprest Surrender")
                    {
                        ApplicationArea = Imprest;
                        Caption = 'Imprest Accounting';
                        RunObject = Page "Imprest Surrender List";
                        ToolTip = 'Imprest Surrender List .';
                    }
                }
                group(OvertimeClaims)
                {
                    Caption = 'Overtime Claims';
                    ToolTip = 'Manages Imprest Overtime';
                    action("Overtime Claims")
                    {
                        ApplicationArea = OvertimeClaims;
                        Caption = 'Overtime Claims ';
                        RunObject = Page "Overtime Claim List";
                        ToolTip = 'Overtime Claim List';
                    }
                    action("Approved Overtime Claims")
                    {
                        ApplicationArea = OvertimeClaims;
                        Caption = 'Approved Overtime Claims';
                        RunObject = Page "Overtime Claim List-Approved";
                        ToolTip = 'Overtime Claim List-Approved.';
                    }
                }
                group(StaffClaims)
                {
                    Caption = 'Staff Claims';
                    ToolTip = 'Manages Staff Claims';
                    action("Staff Claims List")
                    {
                        ApplicationArea = StaffClaims;
                        Caption = 'Staff Claims List';
                        RunObject = Page "Staff Claims List";
                        ToolTip = 'Staff Claims List .';
                    }
                }
                group(StaffAdvanceRequest)
                {
                    Caption = 'Staff Advances';
                    ToolTip = 'Manages Staff Advance requisition and accounting';
                    action("Staff Advance Request List")
                    {
                        ApplicationArea = StaffAdvance;
                        Caption = 'Staff Advance Request List';
                        RunObject = Page "Staff Advance Request List";
                        ToolTip = 'Staff Advance Request List';
                    }

                    action("Staff Advance Liquidation")
                    {
                        ApplicationArea = StaffAdvance;
                        Caption = 'Staff Advance Liquidation';
                        RunObject = Page "Staff Advance Surrender List";
                        ToolTip = 'Staff Advance Liquidation List';
                    }
                }
                group(PurchaseRequisition)
                {
                    Caption = 'Staff Purchase Requisition';
                    ToolTip = 'Manages Staff Purchase requisition';
                    action("Purchase Requisition")
                    {
                        ApplicationArea = PurchaseRequisition;
                        Caption = 'Purchase Requisition';
                        RunObject = Page "Purchase Requisitions";
                        ToolTip = 'Purchase Requisitions';
                    }
                    action("RFQ List ")
                    {
                        ApplicationArea = PurchaseRequisition;
                        Caption = 'RFQ List ';
                        RunObject = Page "RFQ List";
                        ToolTip = 'RFQ List ';
                    }
                }
            }
            group("Funds Management Reports")
            {
                Caption = 'Reports';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action("Board Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Payment Voucher ';
                    Image = PaymentHistory;
                    RunObject = report "Board Payment Voucher Report";
                    ToolTip = 'Board Payment Vouchers.';
                }
                action("Staff Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Payment Voucher ';
                    Image = PaymentHistory;
                    RunObject = report "Board Payment Voucher Report";
                    ToolTip = 'Staff Payment Vouchers.';
                }

            }
#if not CLEAN18
            Group("Setups")
            {
                Caption = 'Setups';
                Image = Administration;
                ToolTip = 'View the Funds Management Setups';
                action("Cash Office Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Office Setup';
                    Image = CashFlowSetup;
                    RunObject = Page "Cash Office Setup";
                    ToolTip = 'Cash Office Setup .';
                }
                action("Cash Office User Template")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Office User Template';
                    Image = PostedOrder;
                    RunObject = Page "Cash Office User Template";
                    ToolTip = 'Cash Office User Template.';
                }
                action("Budgetary Control Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Budgetary Control Setup';
                    RunObject = Page "Budgetary Control Setup";
                    ToolTip = 'Open the Budgetary Control Setup.';
                }
                action("Receipt Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipt Types';
                    RunObject = Page "Receipt Types";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Payment Types List")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Payment Types Lists";
                    ToolTip = 'Open the list of issued reminders.';
                }
                action("ClaimsTypesList")
                {
                    ApplicationArea = Suite;
                    Caption = 'Claims Types List';
                    Image = PostedMemo;
                    RunObject = Page "Claim Types List";
                    ToolTip = 'Open the Claims Types List.';
                }
                action("Advance Types List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Advance Types List';
                    Image = ActivateDiscounts;
                    RunObject = Page "Advance Types List";
                    ToolTip = 'View auditing details for all general ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Tariff Codes List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tariff Codes List';
                    Image = PostedDeposit;
                    RunObject = page "Tariff Codes";
                    ToolTip = 'View the posted deposit header, deposit header lines, deposit comments, and deposit dimensions.';
                }
                action("Expense Code")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Expense Code';
                    RunObject = Page "Expense Code";
                    ToolTip = 'View Expense Code.';
                }
                action("Imprest Types")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Imprest Types';
                    RunObject = Page "Imprest Types List";
                    ToolTip = 'Imprest Types.';
                }
                action("Destination Codes")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Destination Codes';
                    RunObject = Page "Destination Code List";
                    ToolTip = 'Destination Codes';
                }
                action("Staff Allowance Setup")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Staff Allowance Setup';
                    RunObject = Page "Staff Allowance Setup";
                    ToolTip = 'Staff Allowance Setup.';
                }
                action("Staff Member List ")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Staff Member List ';
                    RunObject = Page "Staff Member List";
                    ToolTip = 'Staff Member List .';
                }
                action("Staff Allowance Grade")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Staff Allowance Grade';
                    RunObject = Page "Staff Allowance Grade";
                    ToolTip = 'Staff Allowance Grade.';
                }
            }


            group(SetupAndExtensions)
            {
                Caption = 'Setup & Extensions';
                Image = Setup;
                ToolTip = 'Overview and change system and application settings, and manage extensions and services';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                ObsoleteTag = '18.0';
                action("Assisted Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action("Manual Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Manual Setup';
                    RunObject = Page "Manual Setup";
                    ToolTip = 'Define your company policies for business departments and for general activities.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action("Service Connections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Connections';
                    Image = ServiceTasks;
                    RunObject = Page "Service Connections";
                    ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action(Extensions)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Extensions';
                    Image = NonStockItemSetup;
                    RunObject = Page "Extension Management";
                    ToolTip = 'Install Extensions for greater functionality of the system.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action(Workflows)
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflows';
                    RunObject = Page Workflows;
                    ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
            }
#endif
        }
        area(creation)
        {
            action("PaymentVoucher")
            {
                //  AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Voucher';
                RunObject = Page "Payment Vouchers List";
                RunPageMode = Create;
                ToolTip = 'Create a new payment Voucher.';
            }
            action("Receipts")
            {
                //AccessByPermission = TableData "G/L Entry" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Receipts';
                RunObject = Page "Receipts List";
                ToolTip = 'Prepare to post any receipts to the company books.';
            }

            action(Action1020012)
            {
                AccessByPermission = TableData "Gen. Journal Template" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Deposit';
                RunObject = Codeunit "Open Deposit Page";
                RunPageMode = Create;
                ToolTip = 'Create a new bank deposit. ';
            }
            action("Payment Journal Entry")
            {
                AccessByPermission = TableData "Gen. Journal Batch" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journal Entry';
                RunObject = Page "Payment Journal";
                ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
            }
        }
        area(processing)
        {
            group(Payments)
            {
                Caption = 'Payments';
                action("Cas&h Receipt Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cas&h Receipt Journal';
                    Image = CashReceiptJournal;
                    RunObject = Page "Cash Receipt Journal";
                    ToolTip = 'Apply received payments to the related non-posted sales documents.';
                }
                action("Pa&yment Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pa&yment Journal';
                    Image = PaymentJournal;
                    RunObject = Page "Payment Journal";
                    ToolTip = 'Make payments to vendors.';
                }
            }

            group(Tasks)
            {


                action("Bank Account R&econciliation")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account R&econciliation';
                    Image = BankAccountRec;
                    RunObject = Page "Bank Acc. Reconciliation";
                    ToolTip = 'View the entries and the balance on your bank accounts against a statement from the bank.';
                }
                action("Payment Reconciliation Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Reconciliation Journals';
                    Image = ApplyEntries;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    RunPageMode = View;
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }

            }
            group(Create)
            {
                Caption = 'Create';
                action("C&reate Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'C&reate Reminders';
                    Ellipsis = true;
                    Image = CreateReminders;
                    RunObject = Report "Create Reminders";
                    ToolTip = 'Create reminders for one or more customers with overdue payments.';
                }
                action("Create Finance Charge &Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Finance Charge &Memos';
                    Ellipsis = true;
                    Image = CreateFinanceChargememo;
                    RunObject = Report "Create Finance Charge Memos";
                    ToolTip = 'Create finance charge memos for one or more customers with overdue payments.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Financial Statements")
                {
                    Caption = 'Financial Statements';
                    Image = ReferenceData;
                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";

                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View a report that shows your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";

                        RunObject = Report "Income Statement";
                        ToolTip = 'View a report that shows your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";
                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";
                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                }
                group("Excel Reports")
                {
                    Caption = 'Excel Reports';
                    Image = Excel;
                    action(ExcelTemplatesBalanceSheet)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Balance Sheet";
                        ToolTip = 'Open a spreadsheet that shows your company''s assets, liabilities, and equity.';
                    }
                    action(ExcelTemplateIncomeStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Income Stmt.";
                        ToolTip = 'Open a spreadsheet that shows your company''s income and expenses.';
                    }
                    action(ExcelTemplateCashFlowStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cash Flow Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template CashFlow Stmt.";
                        ToolTip = 'Open a spreadsheet that shows how changes in balance sheet accounts and income affect the company''s cash holdings.';
                    }
                    action(ExcelTemplateRetainedEarn)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Retained Earnings Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Retained Earn.";
                        ToolTip = 'Open a spreadsheet that shows your company''s changes in retained earnings based on net income from the other financial statements.';
                    }
                    action(ExcelTemplateTrialBalance)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Trial Balance';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Trial Balance";
                        ToolTip = 'Open a spreadsheet that shows a summary trial balance by account.';
                    }
                    action(ExcelTemplateAgedAccPay)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Payable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Pay.";
                        ToolTip = 'Open a spreadsheet that shows a list of aged remaining balances for each vendor by period.';
                    }
                    action(ExcelTemplateAgedAccRec)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Receivable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Rec.";
                        ToolTip = 'Open a spreadsheet that shows when customer payments are due or overdue by period.';
                    }
                }
                action("Run Consolidation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Run Consolidation';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Report "Import Consolidation from DB";
                    ToolTip = 'Run the Consolidation report.';
                }
            }
#if not CLEAN19
            group(Setup)
            {
                Caption = 'Setup';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Setup is no longer shown in this page.';
                ObsoleteTag = '19.0';

                action(Action112)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("General &Ledger Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General &Ledger Setup';
                    Image = Setup;
                    RunObject = Page "General Ledger Setup";
                    ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Sales && Receivables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Sales && Receivables Setup';
                    Image = Setup;
                    RunObject = Page "Sales & Receivables Setup";
                    ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Purchases && Payables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Purchases && Payables Setup';
                    Image = Setup;
                    RunObject = Page "Purchases & Payables Setup";
                    ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Fixed Asset Setup")
                {
                    ApplicationArea = FixedAssets;
                    Caption = '&Fixed Asset Setup';
                    Image = Setup;
                    RunObject = Page "Fixed Asset Setup";
                    ToolTip = 'Define your accounting policies for fixed assets, such as the allowed posting period and whether to allow posting to main assets. Set up your number series for creating new fixed assets.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Cash Flow Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Setup';
                    Image = CashFlowSetup;
                    RunObject = Page "Cash Flow Setup";
                    ToolTip = 'Set up the accounts where cash flow figures for sales, purchase, and fixed-asset transactions are stored.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Cost Accounting Setup")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Setup';
                    Image = CostAccountingSetup;
                    RunObject = Page "Cost Accounting Setup";
                    ToolTip = 'Specify how you transfer general ledger entries to cost accounting, how you link dimensions to cost centers and cost objects, and how you handle the allocation ID and allocation document number.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Business Units")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Business Units';
                    Image = Setup;
                    RunObject = Page "Business Unit List";
                    ToolTip = 'Set up Business Units that you need to consolidate into this company.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
            }
#endif
            group(History)
            {
                Caption = 'History';
                action("Navi&gate")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Find entries...';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ShortCutKey = 'Ctrl+Alt+Q';
                    ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
        }
    }
}
profile "Funds Management"
{
    Caption = 'The Funds Management Roles';
    RoleCenter = "Management Role Center";
}
