import { test, expect } from '@playwright/test';

/**
 * Bài tập Session 4 — AI-generated test starter
 *
 * Dùng GitHub Copilot hoặc Claude để:
 * 1. Generate thêm test cases cho trang này
 * 2. Refactor thành Page Object Model (xem pages/LoginPage.ts)
 * 3. Thêm test data từ fixture
 */

test.describe('Playwright.dev smoke tests', () => {

  test('homepage has correct title', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveTitle(/Playwright/);
  });

  test('Get Started link navigates to docs', async ({ page }) => {
    await page.goto('/');
    await page.getByRole('link', { name: 'Get started' }).click();
    await expect(page).toHaveURL(/.*intro/);
  });

  // TODO (Session 4): AI pair programming exercise
  // Prompt cho Copilot/Claude:
  // "Generate 5 more test cases for playwright.dev homepage
  //  covering navigation, search, and responsive layout"

});
