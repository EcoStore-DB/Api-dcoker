import app from "./app.js";
import { PORT } from "./config.js";
import path from 'path';
import fs from 'fs';
import { exec } from 'child_process';

app.listen(PORT, () => {
    console.log(`Server ejecutándose en: http://localhost:${PORT}`);

}).on("error", (error) => {
  console.error(`Fallo al conectarse al server en el puerto ${PORT}:`, error.message);
});

// Ruta al archivo package.json (corregida)
const packagePath = path.join(process.cwd(), 'package.json');

// Leer el archivo package.json
try {
  const packageData = JSON.parse(fs.readFileSync(packagePath, 'utf-8'));
  console.log('Contenido de package.json:', packageData);
} catch (err) {
  console.error('Error al leer package.json:', err.message);
}
const args = process.argv.slice(2);

if (args.includes('start:all')) {
  console.log('Ejecutando start:all...');
  exec('npm run start:all', (error, stdout, stderr) => {
    if (error) {
      console.error(`Error al ejecutar start:all: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
    }
    console.log(stdout);
  });
}