import { readFileSync } from "node:fs";
import path from "node:path";

export type DashboardTier = "all" | "diy" | "managed";
export type ContentTier = DashboardTier | "all";

const VALID_TIERS = new Set<DashboardTier>(["all", "diy", "managed"]);

/** Read dashboard.tier from company/facts.yaml (build-time). */
export function getDashboardTier(): DashboardTier {
  const factsPath = path.join(process.cwd(), "..", "company", "facts.yaml");

  try {
    const raw = readFileSync(factsPath, "utf8");
    const match = raw.match(/^dashboard:[\s\S]*?\n  tier:[ \t]+([a-z_]+)/m);
    const tier = match?.[1]?.trim();

    if (tier && VALID_TIERS.has(tier as DashboardTier)) {
      return tier as DashboardTier;
    }
  } catch {
    // Template or missing facts — default to showing all tier-gated content.
  }

  return "all";
}

/** Whether a toolbox page tier matches the configured dashboard tier. */
export function matchesContentTier(
  pageTier: ContentTier,
  siteTier: DashboardTier = getDashboardTier(),
): boolean {
  if (pageTier === "all") {
    return true;
  }
  if (siteTier === "all") {
    return true;
  }
  return pageTier === siteTier;
}

export interface PublishableToolboxData {
  clientVisible: boolean;
  tier?: ContentTier;
}

export interface PublishableBrandData {
  clientVisible: boolean;
}

export function isPublishableToolbox(data: PublishableToolboxData): boolean {
  return data.clientVisible && matchesContentTier(data.tier ?? "all");
}

export function isPublishableBrand(data: PublishableBrandData): boolean {
  return data.clientVisible;
}
