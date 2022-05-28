import { chromium, firefox } from "playwright";

function sleep(millis) {
    return new Promise(resolve => setTimeout(resolve, millis));
}

const browsers = [
    ["chrome", () => chromium.launch({ channel: "chrome" })],
    ["firefox", () => firefox.launch()],
];

for (const [name, launch] of browsers) {
    const browser = await launch();
    try {
        const version = browser.version();

        console.log(`Executing the ${name}/${version} example-client...`);
        //await sleep(60*1000);

        const context = await browser.newContext({ ignoreHTTPSErrors: true });
        try {
            const page = await context.newPage();

            const qs = new URLSearchParams({
                "example-client": `${name}/${version}`,
            });

            await page.goto(`https://example.com:8888?${qs}`);

            const content = await page.evaluate(() => document.documentElement.innerText);

            console.log(content);
        } finally {
            await context.close();
        }
    } finally {
        await browser.close();
    }
}
