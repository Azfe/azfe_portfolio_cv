# azfe_portfolio_cv

Página de CV standalone para [azfe.dev](https://azfe.dev), construida con HTML, SCSS y JavaScript vanilla. Consume la API REST del portfolio y permite descargar el CV en PDF directamente desde el navegador.

## Stack

- **HTML5** — estructura semántica
- **SCSS** — estilos modulares compilados con Sass
- **JavaScript (ES Modules)** — sin frameworks, sin bundler
- **[html2pdf.js](https://github.com/eKoopmans/html2pdf.js)** — generación de PDF en cliente

## Estructura

```
portfolio_cv/
├── index.html
├── src/
│   ├── scss/          # Módulos SCSS (_variables, _layout, _sidebar, _main, etc.)
│   └── scripts/       # Módulos JS (api, formatters, renderers, pdf, main)
└── assets/css/        # CSS compilado (generado, no editar manualmente)
```

## Desarrollo local

```bash
npm install
npm run dev       # Compila SCSS en watch mode
npx serve . -p 3001   # Servidor estático en http://localhost:3001
```

Configura la URL de la API en `index.html`:

```js
window.__CV_CONFIG__ = {
  apiUrl: 'http://localhost:8080/api/v1'
};
```

Si la API no está disponible, la página muestra datos de fallback automáticamente.

## Build

```bash
npm run build     # Compila y minifica SCSS → assets/css/styles.css
```

## Descarga de PDF

El botón "Descargar CV" genera el PDF en el cliente a partir del contenido renderizado, usando html2pdf.js. No requiere ningún endpoint de servidor.

## Repositorio relacionado

- **API** — [azfe/azfe_portfolio_backend](https://github.com/Azfe/azfe_portfolio_backend)
- **Portfolio web** — [azfe/azfe_portfolio_frontend](https://github.com/Azfe/azfe_portfolio_frontend)
