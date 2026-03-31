#!/usr/bin/env node
/**
 * Export .excalidraw files to SVG into docs/assets/diagrams/
 * Usage: node scripts/export-diagrams.js
 */

const fs = require("fs");
const path = require("path");
const excalidrawToSvg = require("excalidraw-to-svg");

const ROOT = path.join(__dirname, "..");
const OUT_DIR = path.join(ROOT, "docs", "assets", "diagrams");

// Map: source .excalidraw file → output SVG filename
const DIAGRAMS = [
  "session-05-ai-agent-story",
  "session-06-agentic-ai-story",
  "genai-for-testers-mindmap",
];

if (!fs.existsSync(OUT_DIR)) {
  fs.mkdirSync(OUT_DIR, { recursive: true });
}

(async () => {
  let success = 0;
  let failed = 0;

  for (const name of DIAGRAMS) {
    const srcPath = path.join(ROOT, `${name}.excalidraw`);

    if (!fs.existsSync(srcPath)) {
      console.warn(`⚠️  Not found, skipping: ${name}.excalidraw`);
      failed++;
      continue;
    }

    try {
      const diagram = JSON.parse(fs.readFileSync(srcPath, "utf8"));
      const svg = await excalidrawToSvg(diagram);
      const outPath = path.join(OUT_DIR, `${name}.svg`);
      fs.writeFileSync(outPath, svg.outerHTML ?? svg.toString(), "utf8");
      console.log(`✅  ${name}.svg`);
      success++;
    } catch (err) {
      console.error(`❌  ${name}: ${err.message}`);
      failed++;
    }
  }

  console.log(`\nDone: ${success} exported, ${failed} skipped/failed.`);
  console.log(`Output: ${OUT_DIR}`);
})();
