page 52186811 "Sacco Setups Role"
{
    Caption = 'Sacco Setups Role';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {

            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(reporting)
        {
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
            group("VAT Reports")
            {
                Caption = 'VAT Reports';
                action("&VAT Registration No. Check")
                {
                    ApplicationArea = VAT;
                    Caption = '&VAT Registration No. Check';
                    Image = "Report";
                    RunObject = Report "VAT Registration No. Check";
                    ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
                }
                action("VAT E&xceptions")
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT E&xceptions';
                    Image = "Report";
                    RunObject = Report "VAT Exceptions";
                    ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
                }
                action("VAT &Statement")
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT &Statement';
                    Image = "Report";
                    RunObject = Report "VAT Statement";
                    ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
                }
                action("VAT - VIES Declaration Tax Aut&h")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Tax Aut&h';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Tax Auth";
                    ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
                }
                action("VAT - VIES Declaration Dis&k")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Dis&k';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Disk";
                    ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
                }
                action("EC Sales &List")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'EC Sales &List';
                    Image = "Report";
                    RunObject = Report "EC Sales List";
                    ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
                }
            }

            group("Cost Accounting")
            {
                Caption = 'Cost Accounting';
                action("Cost Accounting Analysis")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Analysis';
                    Image = "Report";
                    RunObject = Report "Cost Acctg. Analysis";
                    ToolTip = 'View balances per cost type with columns for seven fields for cost centers and cost objects. It is used as the cost distribution sheet in Cost accounting. The structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
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
        }
        area(sections)
        {
            group(Action172)
            {
                Caption = 'Global General Setups';
                Image = Setup;
                ToolTip = 'Global setups.';
                action("Global General setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Set-up';
                    Image = Setup;
                    RunObject = Page "General Setup";
                    ToolTip = 'General Setups.';
                }
                action("No. Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'No. Setups';
                    RunObject = Page "Banking No Setup";
                    ToolTip = 'No. Setups';
                }
                action("Member Segment/County/Dividend ")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Member Segment/County/Dividend';
                    RunObject = Page "Segment/County/Dividend/Signat";
                    ToolTip = 'Member Segment/County/Dividend ';
                }
                action("Member Category")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Member Category';
                    Image = Setup;
                    RunObject = Page "Member Category";
                    ToolTip = 'Member Category.';
                }
                action("Bank Code Structure")
                {
                    ApplicationArea = Suite;
                    Caption = 'Bank Code Structure';
                    Image = Setup;
                    RunObject = Page "Bank Code Structure";
                    ToolTip = 'Bank Code Structure.';
                }
                action("Application Document")
                {
                    ApplicationArea = Setups;
                    Caption = 'Application Document';

                    RunObject = Page "Employee List";
                    ToolTip = 'View Application Document.';
                }
                action("Electoral Zones")
                {
                    ApplicationArea = Setups;
                    Caption = 'Electoral Zones';

                    RunObject = Page "Electrol Zones/Area Svr Center";
                    ToolTip = 'View Electrol Zones/Area Svr Center.';
                }
                action("Salutation Tittles")
                {
                    ApplicationArea = Setups;
                    Caption = 'Salutation Tittles';

                    RunObject = Page Salutations;
                    ToolTip = 'View Salutation Tittles.';
                }
                action("Loan Rejection Reasons")
                {
                    ApplicationArea = Setups;
                    Caption = 'Loan rejection Reasons';

                    RunObject = Page "Rejection Reasons";
                    ToolTip = 'View Rejection Reasons.';
                }

                action("Product Setups")
                {
                    ApplicationArea = Setups;
                    Caption = 'Product Setups';

                    RunObject = Page "Product Factory";
                    ToolTip = 'View Savings and Loan products.';
                }

            }
            group(CreditManagementSetups)
            {
                Caption = 'Credit Management Setups';
                Image = Setup;
                ToolTip = 'Gredit Management Setups.';
                action("Product Setups.")
                {
                    ApplicationArea = Setups;
                    Caption = 'Product Setups';

                    RunObject = Page "Product Factory";
                    ToolTip = 'View Savings and Loan products.';
                }
                action("Appraisal Setups")
                {
                    ApplicationArea = Setups;
                    Caption = 'Appraisal Setups';

                    RunObject = Page "Appraisal Salary Set-up";
                    ToolTip = 'View Loan products appraisal setups.';
                }
                action("Financial Appraisal Setups")
                {
                    ApplicationArea = Setups;
                    Caption = 'Financial Appraisal Setups';

                    RunObject = Page "Financilal Appraisal";
                    ToolTip = 'View Loan products financial appraisal setups.';
                }

                action("Loan Securities Setup")
                {
                    ApplicationArea = Setups;
                    Caption = 'Loan Securities Setup';

                    RunObject = Page "Loan Securities Set-Up";
                    ToolTip = 'View Loan products securities setups.';
                }
                action("Loan Purpose")
                {
                    ApplicationArea = Setups;
                    Caption = 'Loan Purpose Setup';

                    RunObject = Page "Loan Purpose";
                    ToolTip = 'View Loan purpose setups.';
                }

            }
            group("Dividend Setup")
            {
                Caption = 'Dividend Setup';
                ToolTip = 'Dividend Setup  ';
                action(DividendSetup)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dividend Setup';
                    Image = Setup;
                    RunObject = Page "Dividend Setup";
                    ToolTip = 'Dividend Setup.';
                }
                action(DividendSimulation)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dividend Simulation ';
                    Image = Setup;
                    RunObject = Page "Dividend Simulation Header";
                    ToolTip = 'Dividend Simulation .';
                }

            }
            group(Action84)
            {
                Caption = 'SMS Setups';
                ToolTip = 'SMS Setups.';
                action("SMSSetups")
                {
                    ApplicationArea = SMSSetups;
                    Caption = 'SMS Setups';
                    RunObject = Page "SMS Setup";
                    ToolTip = 'SMS Setup .';
                }
                action("SMS Codes")
                {
                    ApplicationArea = SMSSetups;
                    Caption = 'SMS Codes';
                    RunObject = Page "SMS Codes";
                    ToolTip = 'SMS codes.';
                }
                action("SMSSubscription")
                {
                    ApplicationArea = SMSSetups;
                    Caption = 'SMS Subscriptions';
                    RunObject = Page "SMS Subscription List";
                    ToolTip = 'SMS Subscriptions';
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
        }
        area(creation)
        {
            action("SMember Categories")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Member Categories';
                RunObject = Page "Member Category";
                RunPageMode = Create;
                ToolTip = 'Member Categories';
            }
            action("ElectoralZones")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Electoral Zones';
                RunObject = Page "Electrol Zones/Area Svr Center";
                RunPageMode = Create;
                ToolTip = 'Create a new Electoral Zones.';
            }
            action("Application Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Application Documents';
                RunObject = Page "Product Application Document";
                ToolTip = 'Prepare Application Documents.';
            }
            action("ProductSetups")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Product Setup';
                RunObject = Page "Product Factory";
                ToolTip = 'Product Factory. Create Savings and Credit products.';
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
            group(Analysis)
            {
                Caption = 'Banking No. Setup';
                action("Banking No. Setup")
                {
                    ApplicationArea = BankingNosetups;
                    Caption = 'Banking No. Setup';
                    Image = ElectronicBanking;
                    RunObject = Page "Banking No Setup";
                    ToolTip = 'Banking No. Series set up.';
                }
            }
            group(Tasks)
            {
                Caption = 'Banking Management: Teller and Treasury';
                action("BankingUserSetup")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Banking User Setup';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Banking User Setup";
                    ToolTip = 'Banking User Setup.';
                }
                action("TransactionTypes")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Transaction Types';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Transaction Types List";
                    ToolTip = 'Transaction Types.';
                }
                action("TieredCharges")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Tiered Charges';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Tiered Charges List";
                    ToolTip = 'Tiered Charges List.';
                }
                action("Denominations Setup")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Denominations Setup';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Denomination Setup";
                    ToolTip = 'Denominations Setup.';
                }
                action("ChequeManagement")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Cheque Types';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Cheque Types";
                    ToolTip = 'Cheque Type Setup.';
                }
                action("Fixed Deposit Setup")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Fixed Deposit Types';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "Fixed Deposit Type List";
                    ToolTip = 'Fixed Deposit Setup.';
                }
                action("EmailNotificationSetup")
                {
                    ApplicationArea = BankingUser;
                    Caption = 'Email Notification Setup';
                    Ellipsis = true;
                    Image = BankContact;
                    RunObject = page "E-Mail Notification";
                    ToolTip = 'E-Mail Notification Setup.';
                }



            }
            group(Create)
            {
                Caption = 'Create';
                action("C&reate Products")
                {
                    ApplicationArea = Suite;
                    Caption = 'C&reate Products';
                    Ellipsis = true;
                    Image = CreateReminders;
                    RunObject = page "Product Factory List";
                    ToolTip = 'Create Savings and Credit.';
                }
                action("Create Loan Purpose")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Loan Purpose';
                    Ellipsis = true;
                    Image = CreateFinanceChargememo;
                    RunObject = page "Loan Purpose";
                    ToolTip = 'Create loan purpose.';
                }
            }

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
profile "Sacco Setups"
{
    Caption = 'Sacco Setups Roles';
    RoleCenter = "Sacco Setups Role";
}
