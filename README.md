# Maintenance & Service Management — ERP System

A field service management ERP handling AMC contracts, service calls, invoicing, purchase orders, installation tracking, employee attendance, and multi-center operations.

## Built: 2014

## Tech Stack

- **Backend:** ASP.NET 4.0 (C#)
- **Database:** SQL Server with connection pooling (600-1800)
- **Frontend:** jQuery 1.7, jQuery UI, jqGrid, Validation Engine
- **PDF Export:** iTextSharp
- **Charts:** System.Web.DataVisualization

## Features

### Core Modules (50 ASPX pages)

- **AMC/CMA Management** — Annual Maintenance Contract tracking and renewal
- **Service Call Tracking** — Call logging, assignment, status, closure with timestamps
- **Invoice Generation** — Tax calculation, PDF export, amount tracking
- **Purchase Orders** — PO creation, bank details, cheque tracking, discount calculation
- **Quotation Management** — Quote generation, customer linking, print output
- **Installation Tracking** — Equipment serial numbers, PM schedules, service dates
- **Debit Notes** — Financial debit tracking and reporting

### Supporting Modules

- **Client Management** — Customer database and contact tracking
- **Equipment/Machinery** — Asset registry with manufacturer details
- **Employee & HR** — Staff records, designation, attendance tracking
- **Task Management** — Work assignment and progress tracking
- **Multi-Center Ops** — Branch/center management with user access control

### Reporting (7 report types)
- Service call reports
- Invoice reports
- Purchase order summaries
- Installation reports
- Task progress reports
- Employee reports
- Debit note reports

## Architecture

```
├── *.aspx              — ASPX pages (List + Details pattern)
├── SE/                 — Secondary/shared pages
├── bin/                — Compiled DLLs (App_Code, iTextSharp)
├── CSS/                — Stylesheets (9 files)
├── js/                 — jQuery, jqGrid, validation (196 files)
├── ui/                 — jQuery UI components
├── themes/             — Custom UI themes
├── mImage/             — Icons and images
├── AdminPage.master    — Master page template
└── Web.config          — Configuration
```

## Setup

1. Create SQL Server database with required schema
2. Update `Web.config` connection string (`ConnStr`)
3. Deploy to IIS with ASP.NET 4.0
4. Access `Default.aspx` for login

## Design Patterns

- **List + Detail Page Pairs** — Every module follows CRUD pattern (e.g., `Invoices.aspx` + `InvoicesDetails.aspx`)
- **Master Page Template** — Centralized navigation and layout
- **AJAX UpdatePanel** — Partial page updates for better UX
- **Client-side Validation** — jQuery Validation Engine for form integrity
- **jqGrid** — Advanced data tables with sorting, paging, inline editing

## Note

Deployed for a real field service company managing AMC contracts and service calls across multiple equipment installations. Handles the complete service lifecycle from quotation → installation → AMC → service calls → invoicing.
