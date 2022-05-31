// @ts-check

console.log('versions', JSON.stringify(process.versions));

const qs = new URLSearchParams({
    'example-client': `nwjs/${process.versions.nw} (node/${process.versions.node} chromium/${process.versions.chromium})`,
});

nw.Window.open(`https://example.com:8888?${qs}`, { 'show': false }, w => {
    w.on('loaded', () => {
        console.log('tls-dump-clienthello response:', w.window.document.documentElement.innerText);
        w.close();
    });
});
