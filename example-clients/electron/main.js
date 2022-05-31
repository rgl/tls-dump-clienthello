const { app, BrowserWindow } = require('electron');

// TODO somehow configure the certificate store to trust ../../example.com-crt.pem.
// see https://www.electronjs.org/docs/latest/api/command-line-switches
app.commandLine.appendSwitch('ignore-certificate-errors');

async function createWindow() {
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    show: false,
  });
  //mainWindow.webContents.openDevTools();

  const qs = new URLSearchParams({
    'example-client': `electron/${process.versions.electron} (node/${process.versions.node} chrome=${process.versions.chrome})`,
  });

  await mainWindow.loadURL(`https://example.com:8888?${qs}`);

  const text = await mainWindow.webContents.executeJavaScript('document.documentElement.innerText');

  console.log(text);

  mainWindow.close();
}

app.on('window-all-closed', () => {
  app.quit();
});

app.whenReady().then(async () => {
  await createWindow();
});
