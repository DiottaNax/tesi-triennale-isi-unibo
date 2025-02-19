:::mermaid
classDiagram
    direction LR


    class DnsResolver {
        <<interface>>
        resolveQuery(query: byte[]) byte[]
    }

    class DoHResolver {
    }

    class DoTResolver {
    }

    class ServerDns {
            <<interface>>
            start() bool
            stop() void
        }

    DoHResolver ..|> DnsResolver: instance of
    ServerDns o-- DnsResolver
    DoTResolver ..|> DnsResolver: instance of
:::