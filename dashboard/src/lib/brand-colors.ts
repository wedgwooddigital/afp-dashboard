export interface BrandColor {
  name: string;
  hex: string;
  purpose?: string;
}

const TABLE_ROW =
  /^\|\s*(?:\*\*)?([^|*]+?)(?:\*\*)?\s*\|\s*`?(#[0-9A-Fa-f]{3,8})`?\s*\|\s*(.*?)\s*\|$/;

/** Extract name/hex/purpose rows from brand guideline colour tables. */
export function parseBrandColors(markdown: string): BrandColor[] {
  const colors: BrandColor[] = [];
  const seen = new Set<string>();

  for (const line of markdown.split("\n")) {
    if (line.includes("---") || /^\|\s*Name\s/i.test(line)) {
      continue;
    }

    const match = line.match(TABLE_ROW);
    if (!match) {
      continue;
    }

    const name = match[1].trim();
    const hex = match[2].toUpperCase();
    const purpose = match[3].trim();

    if (!name || seen.has(hex)) {
      continue;
    }

    seen.add(hex);
    colors.push({ name, hex, purpose: purpose || undefined });
  }

  return colors;
}
