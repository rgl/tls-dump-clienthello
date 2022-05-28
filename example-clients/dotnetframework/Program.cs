using System;
using System.Linq;
using System.Net;

namespace dotnet
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"Runtime {System.Environment.Version} ({System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription})");

            // e.g. .NET Framework 4.8.3928.0.
            var frameworkVersion = System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription.Split(' ').Last();

            // NB even with these custom settings, the result was the same.
            // ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
            //                                      | SecurityProtocolType.Tls11
            //                                      | SecurityProtocolType.Tls12
            //                                      | SecurityProtocolType.Tls13;

            // disable server certificate validation.
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;

            Console.WriteLine(new WebClient().DownloadString($"https://example.com:8888?example-client={WebUtility.UrlEncode("dotnetframework/"+frameworkVersion)}"));
        }
    }
}
