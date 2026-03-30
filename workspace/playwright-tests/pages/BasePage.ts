import { Page, Locator } from '@playwright/test';

/**
 * Base Page Object — tất cả page objects kế thừa class này
 *
 * Session 4 Exercise: Dùng AI để generate thêm page objects
 * Prompt gợi ý: "Generate a LoginPage class extending BasePage
 *               with username, password fields and login button"
 */
export class BasePage {
  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  async goto(path: string = '/') {
    await this.page.goto(path);
  }

  async getTitle(): Promise<string> {
    return this.page.title();
  }

  async waitForLoad() {
    await this.page.waitForLoadState('networkidle');
  }
}
