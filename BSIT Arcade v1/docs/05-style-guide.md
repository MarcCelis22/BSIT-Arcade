# BSIT Arcade Style Guide

## Colors

Role       | Hex       | Use
           |           |
Primary    | `#313568` | Buttons, links, and headings
Background | `#F4F3EE` | Page background
Text       | `#202228` | Body text; contrast on background: **12.4:1**
Success    | `#18864A` | Success messages and downloads
Error      | `#A54643` | Validation and error messages

The text/background contrast was calculated with the WCAG formula for `#202228` on `#F4F3EE`; it passes AA.

## Typography

- Heading font: Georgia, `"Times New Roman"`, serif
- Body font: Inter, system-ui, sans-serif
- Base size: 16px

## Components

- **Primary button:** solid `#313568`, white text, 10px radius, 44px minimum height.
- **Secondary button:** white background, `#313568` border/text, 10px radius.
- **Text input/select:** white background, `#D3D9D1` border, 10px radius, 44px height, `#313568` focus ring.
- **Error message:** `#A54643` text with a pale red background and red border.

## CSS custom properties

```css
:root {
  --color-primary: #313568;
  --color-bg: #f4f3ee;
  --color-text: #202228;
  --color-success: #18864a;
  --color-error: #a54643;
  --font-heading: Georgia, "Times New Roman", serif;
  --font-body: Inter, system-ui, sans-serif;
  --base-size: 16px;
  --radius: 10px;
}
```
