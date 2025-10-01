# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Maryam Akhyani's personal portfolio website built with Astro 5.14.1. It showcases her work as a Software Product Manager with a background in design and architecture. The site features a single-page application design with sections for Home, About, Projects, Blog, Playground, and Contact.

## Commands

### Development
- `npm run dev` - Start local development server at `localhost:4321`
- `npm run build` - Build production site to `./dist/`
- `npm run preview` - Preview production build locally
- `npm run astro` - Run Astro CLI commands (e.g., `npm run astro add`, `npm run astro check`)

### Installation
- `npm install` - Install dependencies

## Architecture

### Project Structure
```
/
├── public/           # Static assets (favicon, etc.)
├── src/
│   ├── components/   # Reusable Astro components
│   │   └── Navigation.astro  # Desktop (side) and mobile (bottom) navigation with dark mode toggle
│   ├── layouts/      # Page layouts
│   │   ├── Layout.astro      # Main layout with SEO, fonts, navigation, and scroll behavior
│   │   ├── BlogPost.astro    # Blog post layout with hero image and metadata
│   │   └── ProjectDetail.astro  # Project detail layout
│   ├── pages/        # File-based routing
│   │   ├── index.astro       # Homepage (Hero, About, Projects, Contact)
│   │   ├── blog.astro        # Blog listing page
│   │   ├── blog/             # Individual blog posts
│   │   ├── playground.astro  # Playground page
│   │   └── projects/         # Individual project pages
│   └── styles/
│       └── global.css        # CSS variables and global styles
├── astro.config.mjs  # Astro configuration (minimal)
├── tsconfig.json     # TypeScript configuration (extends astro/tsconfigs/strict)
└── package.json
```

### Key Components

**Layout.astro**: Main layout wrapper that includes:
- Navigation component
- SEO meta tags (title, description, author)
- Google Fonts (Playfair Display, Inter)
- Client-side JavaScript for scroll behavior, navigation highlighting, and dark mode
- Special "squeeze to logo" effect on homepage (name transitions to fixed logo on scroll)

**Navigation.astro**: Dual navigation system:
- Desktop: Vertical side navigation on left (fixed position)
- Mobile: Horizontal bottom navigation (fixed position)
- Both include dark mode toggle and smooth scroll to sections
- Active link highlighting based on scroll position

**BlogPost.astro**: Blog layout with:
- Fixed logo in top-left that links back to homepage
- Hero image, title, date, and category metadata
- Content slot for markdown/MDX content

### Design System

**Color Palette** (defined in `src/styles/global.css`):
- Primary Orange: `#d96d2b`
- Secondary Orange: `#f5a623`
- Light Background: `#fdf6ec` (dark mode: `#2c2824`)
- Text Dark: `#3d352e` (dark mode: `#e9e2d9`)
- Navigation icons: `#d3c4b1` (inactive), white (active)

**Typography**:
- Headings: "Playfair Display" (serif)
- Body: "Inter" (sans-serif)

**Dark Mode**: Toggle via navigation buttons, applies `.dark-mode` class to `<body>`, CSS variables automatically adjust colors

### Navigation & Scroll Behavior

The homepage implements sophisticated scroll-based interactions:
1. **Logo transition**: Large hero name "squeezes" into a fixed top-left logo on scroll
2. **Navigation highlighting**: Active section detection based on scroll position
3. **Navigation background**: Transparent navigation becomes solid with shadow after scrolling
4. **Smooth scrolling**: Anchor links scroll smoothly to sections

All scroll logic is implemented in the `<script>` tag in `Layout.astro:44-138`.

### Routing

Astro uses file-based routing:
- `/` → `src/pages/index.astro` (homepage with all sections)
- `/blog` → `src/pages/blog.astro` (blog listing)
- `/blog/analytics` → `src/pages/blog/analytics.astro` (blog post)
- `/playground` → `src/pages/playground.astro`
- `/projects/*` → `src/pages/projects/*.astro`

### Responsive Design

- Desktop: Side navigation on left, content adjusted with left padding
- Tablet (< 1024px): Reduced side navigation spacing
- Mobile (< 768px): Bottom navigation replaces side navigation, content padding reset

Breakpoints are defined in component-specific `<style>` blocks.

## Development Notes

- TypeScript is configured with strict mode (`extends: "astro/tsconfigs/strict"`)
- All `.astro` files support scoped CSS in `<style>` blocks
- Global CSS variables enable consistent theming and dark mode support
- Navigation state is managed purely with vanilla JavaScript (no framework)
- Images are primarily loaded from external URLs (Unsplash, ibb.co) rather than local assets
