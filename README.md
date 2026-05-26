<h1 align="center">⚡ FieldOps 360</h1>

<p align="center">
  <b>Enterprise Salesforce CRM for Sales Pipeline & Field Service Management</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white"/>
  <img src="https://img.shields.io/badge/Apex-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white"/>
  <img src="https://img.shields.io/badge/LWC-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-In_Progress-orange?style=for-the-badge"/>
</p>

---

## 📌 Overview

**FieldOps 360** is a personal Salesforce CRM project built to demonstrate
real-world enterprise development skills on the Salesforce platform.

It covers the full lifecycle of a field operations business — from
lead capture and sales pipeline management to field service scheduling
and customer 360 visibility — all built natively on Salesforce.

> Built by a **Salesforce Certified Platform Developer I & Administrator**
> to showcase Apex, LWC, Flow Builder, and REST API skills in a
> real-world CRM context.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Backend Logic** | Apex Triggers, Apex Classes, Batch Apex |
| **Testing** | Mock Test Classes, 90%+ Code Coverage |
| **UI Components** | Lightning Web Components (LWC) |
| **Automation** | Flow Builder, Process Builder |
| **Database** | SOQL optimised queries |
| **Integration** | Salesforce REST API, Customer 360 |
| **Deployment** | Salesforce DX (SFDX) |
| **Auth** | OTP Authentication, REST API Security |

---

## 📦 Modules

### ✅ Sales Pipeline Module
- Lead to Opportunity conversion tracking
- Custom Apex Triggers on Opportunity object
- LWC dashboard for pipeline visibility
- Automated follow-up reminders via Flow Builder

### ✅ Field Service Module
- Field agent assignment and scheduling
- Real-time job status updates
- Service appointment management
- Mobile-first LWC components

### ✅ Customer 360 Integration
- Unified customer view across Sales & Service Cloud
- REST API integration for external data sync
- Custom SOQL queries for reporting

### ✅ Automation Layer
- 15+ Flow Builder automations
- Process Builder workflows
- Email alert triggers
- Approval processes

---

## 🗂️ Project Structure

FieldOps360/
├── force-app/
│   └── main/
│       └── default/
│           ├── classes/
│           │   ├── FieldOpsController.cls
│           │   ├── FieldOpsController_Test.cls
│           │   ├── FieldOpsTriggerHandler.cls
│           │   └── FieldOpsBatchJob.cls
│           ├── triggers/
│           │   ├── OpportunityTrigger.trigger
│           │   └── ServiceAppointmentTrigger.trigger
│           ├── lwc/
│           │   ├── salesPipelineDashboard/
│           │   ├── fieldServiceMap/
│           │   └── customer360View/
│           └── flows/
│               ├── LeadFollowUpReminder.flow
│               └── ServiceJobAssignment.flow
├── config/
│   └── project-scratch-def.json
└── sfdx-project.json

---

## 🚀 Deployment Guide

### Prerequisites
- Salesforce CLI installed
- Developer org or Sandbox access

### Steps

```bash
# Step 1 — Authenticate to Salesforce org
sfdx force:auth:web:login -a FieldOps360Org

# Step 2 — Create scratch org
sfdx force:org:create -f config/project-scratch-def.json -a FieldOps360 -d 30

# Step 3 — Push source to scratch org
sfdx force:source:push -u FieldOps360

# Step 4 — Run all test classes
sfdx force:apex:test:run -u FieldOps360 --code-coverage

# Step 5 — Open the org
sfdx force:org:open -u FieldOps360
```

---

## 📊 Development Status

| Module | Status | Code Coverage |
|---|---|---|
| Project Setup & Data Modelling | ✅ Complete | - |
| Apex Triggers & Test Classes | ✅ Complete | 90%+ |
| Sales Pipeline LWC | 🔄 In Progress | - |
| Field Service Module | 🔄 In Progress | - |
| Customer 360 Integration | ⬜ Planned | - |
| REST API Layer | ⬜ Planned | - |

---

## 🏆 Key Salesforce Concepts Demonstrated

- ✅ Apex Trigger best practices (one trigger per object)
- ✅ Trigger Handler pattern for clean separation of logic
- ✅ Batch Apex for large data volume processing
- ✅ Mock Test Classes with 90%+ code coverage
- ✅ LWC component lifecycle and wire adapters
- ✅ SOQL query optimisation (no SOQL in loops)
- ✅ Flow Builder for declarative automation
- ✅ Salesforce DX project structure & deployment

---

## 👨‍💻 Author

**Faiz Sheikh**
Salesforce Certified Platform Developer I & Administrator

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/faizsheikh113)
[![Trailhead](https://img.shields.io/badge/Trailhead-00A1E0?style=flat&logo=salesforce&logoColor=white)](https://salesforce.com/trailblazer/uyxif8ind5vuhely5f)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Faizsheikh113)

📧 faizsheikh113@gmail.com
