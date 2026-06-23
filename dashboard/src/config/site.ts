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
    brand: "Brand",
    toolbox: "Toolbox",
  },
  paths: {
    home: "/",
    documents: "/documents/",
    document: (id: string) => `/document/${id}/`,
    updates: "/updates/",
    update: (id: string) => `/updates/${id}/`,
    brand: "/brand/",
    brandPage: (id: string) => `/brand/${id}/`,
    brandAssets: "/brand/assets/",
    toolbox: "/toolbox/",
    toolboxPage: (id: string) => `/toolbox/${id}/`,
  },
  home: {
    title: "Overview",
    description:
      "Your private workspace for brand guidelines, content tools, project documents, and progress updates.",
    intro: {
      eyebrow: "Getting started",
      heading: "Everything in one place",
      paragraphs: [
        "This dashboard brings together work prepared for Air Fryer Probe — brand guidelines, AI-ready prompts, project deliverables, and progress updates.",
        "Use Brand for colours, logos, and design rules. Toolbox holds voice, prompts, and how-to playbooks. Documents and Updates cover formal project work.",
      ],
      latestDocumentLabel: "Latest document",
      latestUpdateLabel: "Latest update",
    },
    metrics: {
      brand: {
        label: "Brand",
        hint: "Colours, logos, design, and video guidelines",
      },
      toolbox: {
        label: "Toolbox",
        hint: "Voice, prompts, templates, and playbooks",
      },
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
    viewBrand: "Open brand guidelines",
    viewToolbox: "Open toolbox",
    emptyDocuments: "No documents are published yet.",
    emptyUpdates: "No short updates are published yet. Documents are listed above.",
    emptyBrand: "No brand pages are published yet.",
    emptyToolbox: "No toolbox pages are published yet.",
  },
  brandSection: {
    title: "Brand",
    description:
      "Visual identity — colours, typography, logos, design patterns, and video guidelines.",
    listEmpty: "No brand pages are published yet.",
    assetsTitle: "Logo & image downloads",
    assetsDescription: "Official logo files and brand imagery ready to download.",
  },
  toolboxSection: {
    title: "Toolbox",
    description:
      "Voice, facts, copy-paste prompts, templates, and step-by-step playbooks for content and AI tools.",
    listEmpty: "No toolbox pages are published yet.",
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
