:::mermaid
classDiagram

    class ServerNamedPipe {
        <<interface>>
        start() void
    }

    class ProtectionManager {
        <<interface>>
        startProtection() bool
        stopProtection(pin: int) void
        registerDevice(profileKey: string, deviceName: string) bool
        getStatus() ProtectionStatus 
    }

    class FlashStartAPI {
        <<interface>>
        register(profileKey: string, deviceName) HttpResponse
        authorize(type: string, pin: int) HttpResponse
        check() HttpResponse
    }

    class CredentialManager {
        <<interface>>
        getActiveClientIfPresent() string?
        setActiveClient(clientId: string) void
        forgetActiveClient() void
    }

    class ServerDns {
        <<interface>>
        start() bool
        stop() void
    }

    ServerNamedPipe o-- ProtectionManager
    ProtectionManager o-- CredentialManager
    ProtectionManager o-- ServerDns
    ProtectionManager o-- FlashStartAPI
:::