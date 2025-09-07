# Singapore Innovation Centre (SIC) Official Website

## Project Overview

This is the official website of the Singapore Innovation Centre (SIC), a Singapore Accredited Training Organisation (ATO) mainly offering training in the following areas:

- Food Innovation
- Tech Innovation, including AI, Blockchain, IT technologies, etc.
- Sustainability Innovation
- Special Programmes, such as Singapore-Johor Bahru Special Economic Zone study tours

## Technical Features

- Pure static website, no database or backend code required
- Supports deployment on GitHub Pages
- Responsive design, adapts to all devices
- Modular structure, easy to maintain and update

## Website Structure

```
SIC Website/
├── index.html                 # Homepage
├── css/                       # CSS files
│   ├── normalize.css          # CSS reset
│   ├── styles.css             # Global styles
│   └── courses.css            # Course page styles
├── js/                        # JavaScript files
│   └── main.js                # Main interactive features
├── pages/                     # Main pages
│   ├── courses.html           # Courses page
│   ├── events.html            # Events page
│   ├── about.html             # About Us
│   └── contact.html           # Contact Us
└── resources/                 # Resources folder
    ├── images/                # Image resources
    ├── courses/               # Course detail pages
    │   └── ai-applications.html  # Example course detail
    └── events/                # Event detail pages
        └── blockchain-summit.html # Example event detail
```

## How to Edit Content

### Edit Courses

1. All course information is in the `pages/courses.html` file
2. Each course detail page is in the `pages/courses/` directory
3. To add a new course:
   - Add a new course card under the relevant category in `pages/courses.html`
   - Create a new course detail page in `pages/courses/`, using `ai-applications.html` as a template

### Edit Events

1. All event information is in the `pages/events.html` file
2. Each event detail page is in the `pages/events/` directory
3. To add a new event:
   - Add a new event card in the relevant section of `pages/events.html`
   - Create a new event detail page in `pages/events/`, using `blockchain-summit.html` as a template

### Edit Images

1. All image resources are in the `resources/images/` directory
2. When replacing images, keep the same file name or update the reference path in the HTML

## Deployment Guide

### Local Testing

You can use any static file server to test the website locally, for example:

```bash
# Use Python's built-in HTTP server
python -m http.server

# Or use Node.js http-server
npm install -g http-server
http-server
```

### Deploy to GitHub Pages

1. Create a GitHub repository
2. Upload the entire `SIC Website` directory to the repository
3. Enable GitHub Pages in the repository settings, selecting the main branch as the source

## Performance Optimization

The website has the following performance optimizations:

1. Minified CSS and JavaScript (can be further optimized for production)
2. Image lazy loading (recommended for actual deployment)
3. Responsive images for different devices
4. Optimized CSS selectors for better rendering performance

## Browser Compatibility

The website is compatible with the following modern browsers:

- Chrome (latest version)
- Firefox (latest version)
- Safari (latest version)
- Edge (latest version)

## Contact

For any questions or suggestions, please contact:

- Email: info@singaporeinnovationcentre.com
- Phone: +65 1234 5678