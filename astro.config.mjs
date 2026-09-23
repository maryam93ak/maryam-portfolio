// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { readdirSync } from 'node:fs';

// Keep /playground/ out of the sitemap until it has at least one real photo
const hasPlaygroundPhotos = readdirSync('./src/content/playground')
  .some((f) => f.endsWith('.md') && f !== 'playground-photo-template.md');

// https://astro.build/config
export default defineConfig({
  site: 'https://www.maryamakhyani.com',
  build: { inlineStylesheets: 'always' },
  integrations: [
    sitemap({
      filter: (page) => hasPlaygroundPhotos || !page.includes('/playground/'),
    }),
  ],
});
