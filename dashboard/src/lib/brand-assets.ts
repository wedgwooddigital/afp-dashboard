import { existsSync, readdirSync } from "node:fs";
import path from "node:path";

export interface BrandAssetFile {
  name: string;
  href: string;
  category: "logos" | "images";
}

const IMAGE_EXT = new Set([".png", ".jpg", ".jpeg", ".gif", ".webp", ".svg"]);

function listCategory(
  publicRoot: string,
  category: BrandAssetFile["category"],
): BrandAssetFile[] {
  const dir = path.join(publicRoot, category);
  if (!existsSync(dir)) {
    return [];
  }

  return readdirSync(dir)
    .filter((file) => {
      if (file.startsWith(".")) {
        return false;
      }
      return IMAGE_EXT.has(path.extname(file).toLowerCase());
    })
    .sort((a, b) => a.localeCompare(b, "en-GB"))
    .map((file) => ({
      name: file,
      href: `/brand-assets/${category}/${file}`,
      category,
    }));
}

/** List synced brand assets under dashboard/public/brand-assets/. */
export function loadBrandAssets(publicRoot = path.join(process.cwd(), "public/brand-assets")): {
  logos: BrandAssetFile[];
  images: BrandAssetFile[];
  all: BrandAssetFile[];
} {
  const logos = listCategory(publicRoot, "logos");
  const images = listCategory(publicRoot, "images");
  return { logos, images, all: [...logos, ...images] };
}
