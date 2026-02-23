import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    date: z.string(),
    category: z.string(),
    tags: z.array(z.string()),
    heroImage: z.string(),
    heroAlt: z.string(),
    featured: z.boolean().default(false),
  }),
});

const playground = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/playground' }),
  schema: z.object({
    title: z.string(),
    category: z.string(),
    tagline: z.string(),
    image: z.string(),       // path to file in /public/playground/
    order: z.number().default(99),
  }),
});

export const collections = { blog, playground };
