import { writeFile } from "node:fs/promises";
import type { Page, TestInfo } from "@playwright/test";

export async function e2eCoverageFixture({ page }: { page: Page }, use: () => Promise<void>, testInfo: TestInfo) {
  const dir = process.env["E2E_COVERAGE_RAW_DIR"];
  if (!dir) return use();

  const coverage: Array<unknown> = [];
  const cdp = await page.context().newCDPSession(page);
  await cdp.send("Profiler.enable");
  await cdp.send("Profiler.startPreciseCoverage", { callCount: true, detailed: true });

  async function snapshot() {
    const { result } = await cdp.send("Profiler.takePreciseCoverage");
    coverage.push(...result);
  }

  const goto = page.goto.bind(page);
  const reload = page.reload.bind(page);
  const goBack = page.goBack.bind(page);
  const goForward = page.goForward.bind(page);

  page.goto = async (...args) => {
    await snapshot();
    return goto(...args);
  };
  page.reload = async (...args) => {
    await snapshot();
    return reload(...args);
  };
  page.goBack = async (...args) => {
    await snapshot();
    return goBack(...args);
  };
  page.goForward = async (...args) => {
    await snapshot();
    return goForward(...args);
  };

  await use();

  await snapshot();
  await writeFile(`${dir}/${testInfo.testId}-${testInfo.retry}.json`, JSON.stringify(coverage));
}
