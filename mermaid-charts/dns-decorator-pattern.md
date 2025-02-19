:::mermaid
classDiagram
direction LR

    class ServerDns {
        <<interface>>
        start() bool
        stop() void
    }

    class NetworkManager {
        <<static>>
        setStaticDns(ipAddress: string) void
        setDnsToDhcp() void
    }

    class DnsDecorator {
        <<abstract>>
        - dnsServer: ServerDns
    }

    class StubbornDnsServer {
        - imposeDns() void
    }


    DnsDecorator ..|> ServerDns
    StubbornDnsServer --|> DnsDecorator
    StubbornDnsServer --> NetworkManager: uses
:::