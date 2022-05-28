using System;
using System.Net;

namespace dotnet
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"Runtime {System.Environment.Version} ({System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription})");

            // disable server certificate validation.
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;

            Console.WriteLine(new WebClient().DownloadString($"https://example.com:8888?example-client={WebUtility.UrlEncode("dotnet/"+System.Environment.Version)}"));
        }
    }
}
