import fetch from "node-fetch";

const qs = new URLSearchParams({
    "example-client": `nodejs/${process.versions.node}`,
});

const response = await fetch(`https://example.com:8888?${qs}`);

console.log(await response.text());
