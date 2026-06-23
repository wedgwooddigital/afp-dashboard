/** Client-facing dashboard copy — Air Fryer Probe */
export const site = {
  clientTradingName: "Air Fryer Probe",
  clientLegalName: "Air Fryer Probe",
  preparedFor: "Ben Cribb",
  brand: {
    title: "Client dashboard",
  },
  nav: {
    home: "Home",
    documents: "Documents",
    updates: "Updates",
  },
  paths: {
    home: "/",
    documents: "/documents/",
    document: (id: string) => `/document/${id}/`,
    updates: "/updates/",
    update: (id: string) => `/updates/${id}/`,
  },
  home: {
    title: "Overview",
    description:
      "Your private workspace for project documents, recommendations, and progress updates.",
    intro: {
      eyebrow: "Getting started",
      heading: "Everything in one place",
      paragraphs: [
        "This dashboard brings together work prepared for Air Fryer Probe — project deliverables, recommendations, and summaries as they are published.",
        "Open Documents for full write-ups you can read or print. Updates appear here for shorter progress notes between larger pieces of work.",
      ],
      latestDocumentLabel: "Latest document",
      latestUpdateLabel: "Latest update",
    },
    metrics: {
      documents: {
        label: "Documents",
        hint: "Audits, recommendations, and project summaries",
      },
      updates: {
        label: "Updates",
        hint: "Short progress notes and current work",
      },
    },
    recentDocumentsHeading: "Recent documents",
    recentUpdatesHeading: "Recent updates",
    viewAllDocuments: "View all documents",
    viewAllUpdates: "View all updates",
    emptyDocuments: "No documents are published yet.",
    emptyUpdates: "No short updates are published yet. Documents are listed above.",
  },
  documents: {
    title: "Documents",
    description:
      "Formal deliverables — audits, recommendations, cost comparisons, and project summaries.",
    sidebarHeading: "Latest documents",
    sidebarEmpty: "No published documents yet.",
    listEmpty: "No documents are currently published.",
  },
  updates: {
    title: "Updates",
    description: "Short progress notes and status updates for ongoing work.",
    sidebarHeading: "Latest updates",
    sidebarEmpty: "No updates published yet.",
    listEmpty:
      "No short updates are currently published. Use documents for formal deliverables and add updates when ongoing work needs a lighter status note.",
  },
};
