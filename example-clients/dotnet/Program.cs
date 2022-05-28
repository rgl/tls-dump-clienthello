Console.WriteLine($"Runtime {System.Environment.Version} ({System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription})");

var handler = new HttpClientHandler
{
    // disable server certificate validation.
    ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator,
};

using (var client = new HttpClient(handler))
{
    var data = new Dictionary<string, string>
    {
        {"example-client", "dotnet/"+System.Environment.Version},
    };

    var qs = await new FormUrlEncodedContent(data).ReadAsStringAsync();

    var content = await client.GetStringAsync($"https://example.com:8888?{qs}");

    Console.WriteLine(content);
}
